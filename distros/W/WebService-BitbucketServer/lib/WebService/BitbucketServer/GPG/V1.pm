# Generated by WebService::BitbucketServer::WADL - DO NOT EDIT!
package WebService::BitbucketServer::GPG::V1;
# ABSTRACT: Bindings for a Bitbucket Server REST API


use warnings;
use strict;

our $VERSION = '0.605'; # VERSION

use Moo;
use namespace::clean;


has context => (
    is          => 'ro',
    isa         => sub { die 'Not a WebService::BitbucketServer' if !$_[0]->isa('WebService::BitbucketServer'); },
    required    => 1,
);


sub _croak { require Carp; Carp::croak(@_) }

sub _get_url {
    my $url  = shift;
    my $args = shift || {};
    $url =~ s/\{([^:}]+)(?::\.\*)?\}/_get_path_parameter($1, $args)/eg;
    return $url;
}

sub _get_path_parameter {
    my $name = shift;
    my $args = shift || {};
    return delete $args->{$name} if defined $args->{$name};
    $name =~ s/([A-Z])/'_'.lc($1)/eg;
    return delete $args->{$name} if defined $args->{$name};
    _croak("Missing required parameter $name");
}


sub delete_keys {
    my $self = shift;
    my $args = {@_ == 1 ? %{$_[0]} : @_};
    my $url  = _get_url('gpg/1.0/keys', $args);
    my $data = (exists $args->{data} && $args->{data}) || (%$args && $args);
    $self->context->call(method => 'DELETE', url => $url, $data ? (data => $data) : ());
}


sub get_keys {
    my $self = shift;
    my $args = {@_ == 1 ? %{$_[0]} : @_};
    my $url  = _get_url('gpg/1.0/keys', $args);
    my $data = (exists $args->{data} && $args->{data}) || (%$args && $args);
    $self->context->call(method => 'GET', url => $url, $data ? (data => $data) : ());
}


sub add_key {
    my $self = shift;
    my $args = {@_ == 1 ? %{$_[0]} : @_};
    my $url  = _get_url('gpg/1.0/keys', $args);
    my $data = (exists $args->{data} && $args->{data}) || (%$args && $args);
    $self->context->call(method => 'POST', url => $url, $data ? (data => $data) : ());
}


sub delete_key {
    my $self = shift;
    my $args = {@_ == 1 ? %{$_[0]} : @_};
    my $url  = _get_url('gpg/1.0/keys/{fingerprintOrId}', $args);
    my $data = (exists $args->{data} && $args->{data}) || (%$args && $args);
    $self->context->call(method => 'DELETE', url => $url, $data ? (data => $data) : ());
}


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

WebService::BitbucketServer::GPG::V1 - Bindings for a Bitbucket Server REST API

=head1 VERSION

version 0.605

=head1 SYNOPSIS

    my $stash = WebService::BitbucketServer->new(
        base_url    => 'https://stash.example.com/',
        username    => 'bob',
        password    => 'secret',
    );
    my $api = $stash->gpg;

=head1 DESCRIPTION

This is a Bitbucket Server REST API for L<GPG::V1|https://developer.atlassian.com/static/rest/bitbucket-server/5.8.3/bitbucket-gpg-rest.html>.

Original API documentation created by and copyright Atlassian.

=head1 ATTRIBUTES

=head2 context

Get the instance of L<WebService::BitbucketServer> passed to L</new>.

=head1 METHODS

=head2 new

    $api = WebService::BitbucketServer::GPG::V1->new(context => $webservice_bitbucketserver_obj);

Create a new API.

Normally you would use C<<< $webservice_bitbucketserver_obj->gpg >>> instead.

=head2 delete_keys

Delete all GPG keys for a supplied user.

    DELETE gpg/1.0/keys

Parameters:

=over 4

=item * C<<< user >>> - string, default: none

the username of the user to delete the keys for. If no username is specified, the GPG keys will
be deleted for the currently authenticated user.

=back

Responses:

=over 4

=item * C<<< 401 >>> - errors, type: application/json

The currently authenticated user has insufficient permissions
to delete the GPG keys. This is only possible when a
B<<< user >>> is explicitly supplied.

=item * C<<< 204 >>> - data, type: unknown

The GPG keys matching the supplied B<<< user >>> were deleted.

=item * C<<< 404 >>> - errors, type: application/json

No user matches the supplied B<<< user >>>

=back

=head2 get_keys

Find all the keys for the currently authenticated user. Optionally, users with ADMIN and higher permissions
may choose to specify the C<<< user >>> parameter to retrieve GPG keys for another user.

Only authenticated users may call this endpoint.

    GET gpg/1.0/keys

Parameters:

=over 4

=item * C<<< user >>> - string, default: none

the name of the user to get keys for (optional; requires ADMIN permission or higher)

=back

Responses:

=over 4

=item * C<<< 200 >>> - page, type: application/json

=item * C<<< 401 >>> - errors, type: application/json

The currently authenticated user has insufficient permissions to perform
this operation.

=back

=head2 add_key

Add a GPG key to the authenticated user's account. Optionally, users with ADMIN and higher permissions may choose
to specify the C<<< user >>> parameter to add a GPG key for another user.

Only authenticated users may call this endpoint.

    POST gpg/1.0/keys

Parameters:

=over 4

=item * C<<< user >>> - string, default: none

the name of the user to add a key for (optional; requires ADMIN permission or higher)

=back

Responses:

=over 4

=item * C<<< 200 >>> - gpgKey, type: application/json

Response contains the GPG key that was just created.

=item * C<<< 400 >>> - validation, type: application/json

The request has failed validation.

=item * C<<< 401 >>> - errors, type: application/json

The currently authenticated user has insufficient permissions to perform this operation.

=back

=head2 delete_key

Delete the GPG key with the specified ID or Key Fingerprint.

Only authenticated users may call this endpoint.

    DELETE gpg/1.0/keys/{fingerprintOrId}

Parameters:

=over 4

=item * C<<< fingerprintOrId >>> - string, default: none

=back

Responses:

=over 4

=item * C<<< 401 >>> - errors, type: application/json

The currently authenticated user has insufficient permissions to perform this operation.

=item * C<<< 204 >>> - data, type: application/json

The key has been deleted successfully.

=back

=head1 SEE ALSO

=over 4

=item * L<WebService::BitbucketServer>

=item * L<https://developer.atlassian.com/bitbucket/server/docs/latest/>

=back

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
L<https://github.com/chazmcgarvey/WebService-BitbucketServer/issues>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Charles McGarvey <chazmcgarvey@brokenzipper.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2018 by Charles McGarvey.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
