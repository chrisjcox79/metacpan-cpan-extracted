package Mango::BSON::Binary;
use Mojo::Base -base;
use overload bool => sub {1}, '""' => sub { shift->data }, fallback => 1;

use Mojo::Util 'b64_encode';

has [qw(data type)];

sub TO_JSON { b64_encode shift->data, '' }

1;

=encoding utf8

=head1 NAME

Mango::BSON::Binary - Binary type

=head1 SYNOPSIS

  use Mango::BSON::Binary;

  my $bin = Mango::BSON::Binary->new(data => $bytes, type => 'generic');
  say $bin->data;

=head1 DESCRIPTION

L<Mango::BSON::Binary> is a container for the BSON binary type used by
L<Mango::BSON>. For C<JSON> implementations like L<Mojo::JSON>, that support
the C<TO_JSON> method, it will automatically C<Base64> encode the binary data.

=head1 ATTRIBUTES

L<Mango::BSON::Binary> implements the following attributes.

=head2 data

  my $bytes = $bin->data;
  $bin      = $bin->data($bytes);

Binary data.

=head2 type

  my $type = $bin->type;
  $bin     = $bin->type('generic');

Binary subtype.

=head1 METHODS

L<Mango::BSON::Binary> inherits all methods from L<Mojo::Base> and implements
the following new ones.

=head2 TO_JSON

  my $b64 = $bin->TO_JSON;

Base64 encode L</"data">.

=head1 OPERATORS

L<Mango::BSON::Binary> overloads the following operators.

=head2 bool

  my $bool = !!$bin;

Always true.

=head2 stringify

  my $str = "$bin";

Alias for L</data>.

=head1 SEE ALSO

L<Mango>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
