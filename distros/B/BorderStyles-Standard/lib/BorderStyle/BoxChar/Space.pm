package BorderStyle::BoxChar::Space;

our $AUTHORITY = 'cpan:PERLANCAR'; # AUTHORITY
our $DATE = '2020-06-11'; # DATE
our $DIST = 'BorderStyles-Standard'; # DIST
our $VERSION = '0.002'; # VERSION

use strict;
use parent 'BorderStyleBase';

our %BORDER = (
    v => 2,
    summary => 'Space as borders, but data row separator is still drawn using horizontal line',
    chars => [
        [' ',' ',' ',' '], # 0
        [' ',' ',' '],     # 1
        [' ',' ',' ',' '], # 2
        [' ',' ',' '],     # 3
        [' ','q','q',' '], # 4
        [' ',' ',' ',' '], # 5
    ],
    box_chars => 1,
);

1;
# ABSTRACT: Space as borders, but data row separator is still drawn using horizontal line

__END__

=pod

=encoding UTF-8

=head1 NAME

BorderStyle::BoxChar::Space - Space as borders, but data row separator is still drawn using horizontal line

=head1 VERSION

This document describes version 0.002 of BorderStyle::BoxChar::Space (from Perl distribution BorderStyles-Standard), released on 2020-06-11.

=head1 SYNOPSIS

To use with L<Text::Table::TinyBorderStyle>:

 use Text::Table::TinyBorderStyle qw/generate_table/;
 my $rows =
   [
     ["ColumName1", "ColumnNameB", "ColumnNameC"],
     ["row1A", "row1B", "row1C"],
     ["row2A", "row2B", "row2C"],
     ["row3A", "row3B", "row3C"],
   ];
 generate_table(rows=>$rows, header_row=>1, separate_rows=>1, border_style=>"BorderStyle::BoxChar::Space");

To use with L<Text::ANSITable>:

 # TODO

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/BorderStyles-Standard>.

=head1 SOURCE

Source repository is at L<https://github.com/perlancar/perl-BorderStyles-Standard>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=BorderStyles-Standard>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 SEE ALSO

L<BorderStyle::ASCII::Space>

L<BorderStyle::UTF8::Space>

L<BorderStyle::Custom>

=head1 AUTHOR

perlancar <perlancar@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2020 by perlancar@cpan.org.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
