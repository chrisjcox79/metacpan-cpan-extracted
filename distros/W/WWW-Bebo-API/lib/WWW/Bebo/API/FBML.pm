package WWW::Bebo::API::FBML;

use warnings;
use strict;
use Carp;

use version; our $VERSION = qv('0.0.03');

sub refresh_img_src { return shift->base->call( 'fbml.refreshImgSrc', @_ ) }
sub refresh_ref_url { return shift->base->call( 'fbml.refreshRefUrl', @_ ) }
sub set_ref_handle  { return shift->base->call( 'fbml.setRefHandle',  @_ ) }

1;    # Magic true value required at end of module
__END__

=head1 NAME

WWW::Bebo::API::FBML - Bebo Markup Language

=head1 VERSION

This document describes WWW::Bebo::API::FBML version 0.0.03

=head1 SYNOPSIS

    use WWW::Bebo::API;

=head1 DESCRIPTION

Methods for updating FBML references with L<WWW::Bebo::API>

=head1 SUBROUTINES/METHODS 

=over

=item base

Returns the L<WWW::Bebo::API> base object.

=item new

Constructor.

=item set_ref_handle( handle => 'handleName', fbml => 'fbml' )

The fbml.setRefHandle method of the Bebo API. See this page on the wiki:
http://wiki.developers.bebo.com/index.php/Changing_profile_content

=item refresh_img_src( url => $url )

Request an image in Bebo's cache (at the given URL) be refreshed. See this
page on the wiki:
http://wiki.developers.bebo.com/index.php/Changing_profile_content 

=item refresh_ref_url( url => $url )

Have Bebo call the given URL to generate the FBML. See this page on the
wiki: http://wiki.developers.bebo.com/index.php/Changing_profile_content

=back


=head1 DIAGNOSTICS

None.

=head1 CONFIGURATION AND ENVIRONMENT

WWW::Bebo::API::FBML requires no configuration files or environment
variables.

=head1 DEPENDENCIES

See L<WWW::Bebo::API>

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-www-bebo-api@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 AUTHOR

TSIBLEY C<< <tsibley@cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2007, TSIBLEY C<< <tsibley@cpan.org> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENSE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
