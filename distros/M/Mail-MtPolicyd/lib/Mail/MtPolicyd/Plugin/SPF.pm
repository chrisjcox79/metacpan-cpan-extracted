package Mail::MtPolicyd::Plugin::SPF;

use Moose;
use namespace::autoclean;

our $VERSION = '2.05'; # VERSION
# ABSTRACT: mtpolicyd plugin to apply SPF checks


extends 'Mail::MtPolicyd::Plugin';

with 'Mail::MtPolicyd::Plugin::Role::Scoring';
with 'Mail::MtPolicyd::Plugin::Role::UserConfig' => {
  'uc_attributes' => [ 'enabled', 'fail_mode', 'softfail_mode', 'pass_mode' ],
};

use Mail::MtPolicyd::Plugin::Result;
use Mail::MtPolicyd::AddressList;
use Mail::SPF;

use Net::DNS::Resolver;

has 'enabled' => ( is => 'rw', isa => 'Str', default => 'on' );

has 'pass_score' => ( is => 'rw', isa => 'Maybe[Num]' );
has 'pass_mode' => ( is => 'rw', isa => 'Str', default => 'passive' );

has 'softfail_score' => ( is => 'rw', isa => 'Maybe[Num]' );
has 'softfail_mode' => ( is => 'rw', isa => 'Str', default => 'passive' );

has 'fail_score' => ( is => 'rw', isa => 'Maybe[Num]' );
has 'fail_mode' => ( is => 'rw', isa => 'Str', default => 'reject' );

has 'reject_message' => ( is => 'rw', isa => 'Str',
  default => 'SPF validation failed: %LOCAL_EXPL%' );

has 'default_authority_explanation' => ( is => 'ro', isa => 'Str',
  default => 'See http://www.%{d}/why/id=%{S};ip=%{I};r=%{R}' );
has 'hostname' => ( is => 'ro', isa => 'Str', default => '' );

has 'whitelist' => ( is => 'rw', isa => 'Str',
  default => '');

has 'max_dns_interactive_terms' => (is => 'rw', isa => 'Maybe[Num]', default => 10);
has 'max_name_lookups_per_term' => (is => 'rw', isa => 'Maybe[Num]', default => 10);
has 'max_void_dns_lookups' => (is => 'rw', isa => 'Maybe[Num]', default => 2);

has 'temperror_score' => ( is => 'rw', isa => 'Maybe[Num]' );
has 'temperror_mode' => ( is => 'rw', isa => 'Str', default => 'defer');

has 'permerror_score' => ( is => 'rw', isa => 'Maybe[Num]' );
has 'permerror_mode' => ( is => 'rw', isa => 'Str', default => 'reject');

has '_whitelist' => ( is => 'ro', isa => 'Mail::MtPolicyd::AddressList',
  lazy => 1, default => sub {
    my $self = shift;
    my $list = Mail::MtPolicyd::AddressList->new;
    $list->add_localhost;
    $list->add_string( $self->whitelist );
    return $list;
  },
);

# use a custom resolver to be able to provide a mock in unit tests
has '_dns_resolver' => (
  is => 'ro', isa => 'Net::DNS::Resolver', lazy => 1,
  default => sub { Net::DNS::Resolver->new; },
);

has '_spf' => ( is => 'ro', isa => 'Mail::SPF::Server', lazy => 1,
  default => sub {
    my $self = shift;
    return Mail::SPF::Server->new(
      default_authority_explanation => $self->default_authority_explanation,
      hostname => $self->hostname,
      dns_resolver => $self->_dns_resolver,
      max_dns_interactive_terms => $self->max_dns_interactive_terms,
      max_name_lookups_per_term => $self->max_name_lookups_per_term,
      max_void_dns_lookups => $self->max_void_dns_lookups,
    );
  },
);

has 'check_helo' => ( is => 'rw', isa => 'Str', default => 'on');

sub run {
  my ( $self, $r ) = @_;

  if( $self->get_uc($r->session, 'enabled') eq 'off' ) {
    return;
  }

  if( ! $r->is_attr_defined('client_address') ) {
    $self->log( $r, 'cant check SPF without client_address');
    return;
  }

  if( $self->_whitelist->match_string( $r->attr('client_address') ) ) {
    $self->log( $r, 'skipping SPF checks for local or whitelisted ip');
    return;
  }

  my $sender = $r->attr('sender');

  if( $r->is_attr_defined('helo_name') && $self->check_helo ne 'off' ) {
    my $helo_result = $self->_check_helo( $r );
    if( defined $helo_result ) {
      return( $helo_result ); # return action if present
    }
    if( ! $r->is_attr_defined('sender') ) {
      $sender = 'postmaster@'.$r->attr('helo_name');
      $self->log( $r, 'null sender, building sender from HELO: '.$sender );
    }
  }

  if( ! defined $sender ) {
    $self->log( $r, 'skipping SPF check because of null sender, consider setting check_helo=on');
    return;
  }

  return $self->_check_mfrom( $r, $sender );
}

sub _check_helo {
  my ( $self, $r ) = @_;
  my $ip = $r->attr('client_address');
  my $helo = $r->attr('helo_name');
  my $session = $r->session;

  my $request = Mail::SPF::Request->new(
    scope => 'helo',
    identity => $helo,
    ip_address  => $ip,
  );
  my $result = $self->_spf->process($request);

  return $self->_check_spf_result( $r, $result, 1 );
}

sub _check_mfrom {
  my ( $self, $r, $sender ) = @_;
  my $ip = $r->attr('client_address');
  my $helo = $r->attr('helo_name');

  my $request = Mail::SPF::Request->new(
    scope => 'mfrom',
    identity => $sender,
    ip_address  => $ip,
    defined $helo && length($helo) ? ( helo_identity => $helo ) : (),
  );
  my $result = $self->_spf->process($request);

  return $self->_check_spf_result( $r, $result, 0 );
}

sub _check_spf_result {
  my ( $self, $r, $result, $no_pass_action ) = @_;
  my $scope = $result->request->scope;
  my $session = $r->session;
  my $fail_mode = $self->get_uc($session, 'fail_mode');
  my $softfail_mode = $self->get_uc($session, 'softfail_mode');
  my $pass_mode = $self->get_uc($session, 'pass_mode');

  if( $result->code eq 'neutral') {
    $self->log( $r, 'SPF '.$scope.' status neutral. (no SPF records)');
    return;
  } elsif( $result->code eq 'fail') {
    $self->log( $r, 'SPF '.$scope.' check failed: '.$result->local_explanation);
    if( defined $self->fail_score && ! $r->is_already_done($self->name.'-score') ) {
      $self->add_score( $r, $self->name => $self->fail_score );
    }
    if( $fail_mode eq 'reject') {
      return Mail::MtPolicyd::Plugin::Result->new(
        action => $self->_get_reject_action($result),
        abort => 1,
      );
    }
    return;
  } elsif( $result->code eq 'softfail') {
    $self->log( $r, 'SPF '.$scope.' check returned softfail '.$result->local_explanation);
    if( defined $self->softfail_score && ! $r->is_already_done($self->name.'-score') ) {
      $self->add_score( $r, $self->name => $self->softfail_score );
    }
    if( $softfail_mode eq 'reject') {
      return Mail::MtPolicyd::Plugin::Result->new(
        action => $self->_get_reject_action($result),
        abort => 1,
      );
    } elsif( $softfail_mode eq 'accept' || $softfail_mode eq 'dunno') {
      return Mail::MtPolicyd::Plugin::Result->new_dunno;
    }
    return;
  } elsif( $result->code eq 'pass' ) {
    $self->log( $r, 'SPF '.$scope.' check passed');
        if( $no_pass_action ) { return; }
    if( defined $self->pass_score && ! $r->is_already_done($self->name.'-score') ) {
      $self->add_score( $r, $self->name => $self->pass_score );
    }
    if( $pass_mode eq 'accept' || $pass_mode eq 'dunno') {
      return Mail::MtPolicyd::Plugin::Result->new_dunno;
    }
    return;
  } elsif($result->code eq 'temperror') {
    return $self->_handle_spf_error(
      $r,
      $result,
      $self->temperror_mode,
      $self->temperror_score,
      'defer'
    );
  } elsif($result->code eq 'permerror') {
    return $self->_handle_spf_error(
      $r,
      $result,
      $self->permerror_mode,
      $self->permerror_score,
      'reject'
    );
  }

  $self->log( $r, 'spf '.$scope.' check failed: '.$result->local_explanation );
  return;
}

sub _handle_spf_error {
  my ($self, $r, $result, $mode, $score, $action) = @_;
  my $scope = $result->request->scope;

  $self->log($r, 'SPF '.$scope.' failed with '.$result->code.' '.$result->local_explanation);

  if( defined $score && ! $r->is_already_done($self->name.'-score') ) {
    $self->add_score( $r, $self->name => $score );
  }

  if($mode eq 'passive') {
    return;
  }
  if ( $self->temperror_mode eq 'dunno') {
    return Mail::MtPolicyd::Plugin::Result->new_dunno;
  }

  return Mail::MtPolicyd::Plugin::Result->new(
    action => $action.' spf '.${scope}.' check failed: '.$result->local_explanation,
    abort => 1,
  );
}

sub _get_reject_action {
  my ( $self, $result ) = @_;
  my $message = $self->reject_message;

  if( $message =~ /%LOCAL_EXPL%/) {
    my $expl = $result->local_explanation;
    $message =~ s/%LOCAL_EXPL%/$expl/;
  }
  if( $message =~ /%AUTH_EXPL%/) {
    my $expl = '';
    if( $result->can('authority_explanation') ) {
      $expl = $result->authority_explanation;
    }
    $message =~ s/%AUTH_EXPL%/$expl/;
  }

  return('reject '.$message);
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Mail::MtPolicyd::Plugin::SPF - mtpolicyd plugin to apply SPF checks

=head1 VERSION

version 2.05

=head1 DESCRIPTION

This plugin applies Sender Policy Framework(SPF) checks.

Checks are implemented using the Mail::SPF perl module.

Actions based on the SPF result can be applied for:

=over

=item pass (pass_mode, default: passive)

=item softfail (softfail_mode, default: passive)

=item fail (fail_mode, default: reject)

=item temperror (temperror_mode, default: defer)

=item permerror (permerror_mode, default: reject)

=back

For status 'neutral' no action or score is applied.

=head1 PARAMETERS

=over

=item (uc_)enabled (default: on)

Enable/disable the plugin.

=item (uc_)pass_mode (default: passive)

How to behave if the SPF checks passed successfully:

=over

=item passive

Just apply score. Do not return an action.

=item accept, dunno

Will return an 'dunno' action.

=back

=item pass_score (default: empty)

Score to apply when the sender has been successfully checked against SPF.

=item (uc_)softfail_mode (default: passive)

How to behave if the SPF checks returned a softfail status.

=over

=item passive

Just apply score. Do not return an action.

=item accept, dunno

Will return an 'dunno' action.

=item reject

Return an reject action.

=back

=item softfail_score (default: empty)

Score to apply when the SPF check returns an softfail status.

=item (uc_)fail_mode (default: reject)

=over

=item reject

Return an reject action.

=item passive

Just apply score and do not return an action.

=back

=item temperror_mode (default: defer)

Action to apply on a temperror SPF result.

Possible values: passive, dunno, defer, reject

=item temperror_score (default: empty)

Score to apply on a temperror SPF result.

By default no score is applied.

=item permerror_mode (default: reject)

Action to apply on a permerror SPF result.

Possible values: passive, dunno, defer, reject

=item permerror_score (default: empty)

Score to apply on a permerror SPF result.

By default no score is applied.

=item reject_message (default: )

If fail_mode is set to 'reject' this message is used in the reject.

The following pattern will be replaced in the string:

=over

=item %LOCAL_EXPL%

Will be replaced with a (local) explanation of the check result.

=item %AUTH_EXPL%

Will be replaced with a URL to the explanation of the result.

This URL could be configured with 'default_authority_explanation'.

=back

=item fail_score (default: empty)

Score to apply if the sender failed the SPF checks.

=item default_authority_explanation (default: See http://www.%{d}/why/id=%{S};ip=%{I};r=%{R})

String to return as an URL pointing to an explanation of the SPF check result.

See Mail::SPF::Server for details.

=item hostname (default: empty)

An hostname to show in the default_authority_explanation as generating server.

=item whitelist (default: '')

A comma separated list of IP addresses to skip.

=item check_helo (default: "on")

Set to 'off' to disable SPF check on helo.

=item max_dns_interactive_terms (default: 10)

Maximum number of terms using DNS lookup in a SPF record to evaluate.

Exceeding this limit will cause a permanent error as specified by RFC7208.

The default of 10 is also specified in by RFC7208.

=item max_name_lookups_per_term (default: 10)

Maximum number of DNS lookups per SPF term.

=item max_void_dns_lookups (default: 2)

Maximum number of void DNS lookups.

=back

=head1 EXAMPLE

  <Plugin spf>
    module = "SPF"
    pass_mode = passive
    pass_score = -10
    fail_mode = reject
    #fail_score = 10
  </Plugin>

=head1 SEE ALSO

L<Mail::SPF>, OpenSPF L<www.openspf.org/>, RFC 7208 L<https://tools.ietf.org/html/rfc7208>

=head1 AUTHOR

Markus Benning <ich@markusbenning.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by Markus Benning <ich@markusbenning.de>.

This is free software, licensed under:

  The GNU General Public License, Version 2, June 1991

=cut
