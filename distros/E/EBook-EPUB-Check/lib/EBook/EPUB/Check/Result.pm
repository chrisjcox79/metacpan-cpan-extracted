package EBook::EPUB::Check::Result;

use strict;
use warnings;

sub new
{
    my ($class, $out) = @_;
    bless { out => $out }, $class;
}

sub is_valid { ${ shift->{out} } =~ /No errors or warnings detected/i ? 1 : 0; }
sub report   { ${ shift->{out} }; }

1;

__END__

=encoding utf-8

=head1 NAME

EBook::EPUB::Check::Result - Result class for EBook::EPUB::Check

=head1 METHODS

=head2 is_valid()

Returns true if the EPUB file is valid.

=head2 report()

Returns the report generated by the validation engine.

=cut
