use 5.006;    # our
use strict;
use warnings;

package Search::GIN::Extract::ClassMap::Like;

# ABSTRACT: Map Extractors based on what an objects inheritance or roles

our $VERSION = '1.000003';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moose qw( with blessed );
use namespace::autoclean;

with 'Search::GIN::Extract::ClassMap::Role';

no Moose;
__PACKAGE__->meta->make_immutable;














sub matches {
  my ( $self, $extractee ) = @_;
  my @m;
  return @m if not blessed $extractee;
  for my $class ( $self->classmap_entries ) {
    if ( $extractee->isa($class) or $extractee->does($class) ) {
      push @m, $self->classmap_get($class);
    }
  }
  return @m;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Search::GIN::Extract::ClassMap::Like - Map Extractors based on what an objects inheritance or roles

=head1 VERSION

version 1.000003

=head1 METHODS

=head2 C<matches>

  # List of Search::GIN::Extract objects
  my ( @extractors ) = $like_object->matches( $extractee );

returns a list of extractors that are in the map for the object.

  for my $extractor ( @extractors ) {
    my $metadata = $extractor->extract_values( $extractee );
  }

=head1 AUTHOR

Kent Fredric <kentnl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
