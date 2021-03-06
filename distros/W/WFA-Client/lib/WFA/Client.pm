package WFA::Client;

use 5.008;
use strict;
use warnings;
use Moo;
use MooX::Types::MooseLike::Base qw/ Bool Str /;

our $VERSION = '0.01';

use WFA::Workflow;

use HTTP::Request;
use LWP::UserAgent;
use XML::Simple;

=head1 NAME

WFA::Client - A perl WFA client for interacting with OnCommand Workflow Automation

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

  my $wfa = WFA::Client->new(
    server   => $hostname_or_ip,
    username => $username,
    password => $password,
  );

  my $workflow = $wfa->get_workflow($workflow_name);

  my $job = $workflow->execute(
    parameter => 'value',
  );

  $job->poll_for_completion();

  my $success = $job->success();

=head1 DESCRIPTION

This module provides access to execute jobs on an OnCommand WFA server via the REST interface.

=head1 CONSTRUCTOR

=head2 my $wfa = WFA::Client->new(server => $server, username => $username, password => $password)

Create a new WFA client object.  It accepts the following named options:

=over

=item I<server =E<gt> C<'myserver'>>

Required.  The hostname or IP address of a WFA server.

=item I<username =E<gt> C<'myuser'>>

Required.  The WFA username.

=item I<password =E<gt> C<'mypass'>>

Required.  The WFA password.

=item I<use_ssl =E<gt> 1>

Default.  Connect using SSL.  This is the most secure and preferred method.

=back

=cut

has [qw/ server username password /] => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has use_ssl => (
    is      => 'ro',
    isa     => Bool,
    default => 1,
);

has xml_obj => (
    is      => 'ro',
    builder => '_build_xml_obj',
    lazy    => 1,
);

has ua_obj => (
    is      => 'ro',
    builder => '_build_ua_obj',
    lazy    => 1,
);

has base_url => (
    is      => 'ro',
    builder => '_build_base_url',
    lazy    => 1,
);

sub _build_xml_obj {
    return XML::Simple->new(
        KeepRoot => 1,
        KeyAttr  => {'atom:link' => 'rel', userInput => 'name'},
        XMLDecl  => 1,
    );
}

sub _build_ua_obj { LWP::UserAgent->new(keep_alive => 1) }
sub _build_base_url { my ($self) = @_; ($self->use_ssl() ? 'https://' : 'http://') . $self->server() }

=head1 METHODS

=head2 my @workflow_names = $wfa->get_workflow_names()

Get the list of workflows available on the server.  This only returns names, see C<get_workflow> for retrieving workflow details.

=cut

sub get_workflow_names {
    my ($self) = @_;
    my $url = $self->base_url() . '/rest/workflows';
    my @workflow_names = sort map { $_->{name} } @{ $self->submit_wfa_request($url)->{collection}->{workflow} };
    return @workflow_names;
}

=head2 my $workflow = $wfa->get_workflow($workflow_name)

Retrieve an individual workflow.  This returns a C<WFA::Workflow> object.

=over

=item I<$workflow_name>

The name of the workflow to retrieve.  See C<get_workflow_names> for a list of available workflows.

=back

=cut

sub get_workflow {
    my ($self, $workflow) = @_;
    my $url = $self->base_url() . "/rest/workflows?name=$workflow";
    return WFA::Workflow->new(
        client => $self,
        response => $self->submit_wfa_request($url)->{collection},
    );
}

=head1 LOW-LEVEL INTERFACE

There is a low-level interface which provides access to make arbitrary requests to WFA.  It also provides access to the raw responses from WFA for these actions.  It can be used in conjunction with the high-level interface and is best used when the high-level interface is lacking the desired functionality.

Manually executing a workflow:

  my $workflow = $wfa->get_workflow('MyWorkflow');
  my $execute_action = $workflow->url_for_action('execute');
  my $execute_parameter_xml = $wfa->construct_xml_request_parameters(Parameter => 'value');
  my $response = $wfa->submit_wfa_request($execute_action, $execute_parameter_xml);

Accessing workflow raw values:

  my $workflow = $wfa->get_workflow('MyWorkflow');
  my @workflow_actions = $workflow->actions();
  my $workflow_raw_context = $workflow->response();

Accessing job raw values:

  my $job = $wfa->execute();
  my @job_actions = $job->actions();
  my $job_raw_context = $job->response();
=cut

=head2 my $response = C<$wfa-E<gt>submit_wfa_request($url, $optional_paramater_xml)>

Make a call to WFA for a given URL.  This can include a properly formatted parameter xml blob which can be generated by C<construct_xml_request_parameters>.

=over

=item I<$url>

Required. The url to call.  This usually comes from C<$workflow->url_for_action($action)> or C<$job->url_for_action($action)>.

=item I<$optional_paramater_xml>

This is an optional xml string which will be POST-ed to the given C<$url>.  See C<construct_xml_request_parameters>.

=back

=cut

sub submit_wfa_request {
    my ($self, $url, $xml_data) = @_;

    $self->ua_obj()->ssl_opts(verify_hostname => 0);

    my $request;

    if ($xml_data) {
        $request = HTTP::Request->new(POST => $url);
        $request->content($xml_data);
        $request->content_type('application/xml');
    } else {
        $request = HTTP::Request->new(GET => $url);
    }

    $request->authorization_basic($self->username(), $self->password());
    my $response = $self->ua_obj()->request($request);

    if ($response->is_success()) {
        return $self->xml_obj()->XMLin($response->decoded_content());
    } else {
        die 'error response from server: ' . $response->as_string() . "\n";
    }
}

=head2 my $parameter_xml = $wfa->construct_xml_request_parameters(%parameters)

Generate a properly formatted xml parameter blob which can be used to pass parameters to WFA.  This is typically required for C<execute> actions.

=over

=item I<%parameters>

The parameters to serialize into xml.  Example:

  (
    Parameter1 => 'value1',
    Parameter2 => 'value2',
  )

=back

=cut

sub construct_xml_request_parameters {
    my ($self, %parameters) = @_;

    return $self->xml_obj()->XMLout({
        workflowInput => {
            userInputValues => {
                userInputEntry => [
                    (map { { key => $_, value => $parameters{$_} } } keys %parameters),
                ],
            },
        },
    });
}

1;
