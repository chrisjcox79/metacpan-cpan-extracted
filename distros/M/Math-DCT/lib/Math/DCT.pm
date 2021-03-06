package Math::DCT;

use 5.008;
use strict;
use warnings;

=head1 NAME

Math::DCT - 1D and NxN 2D Fast Discreet Cosine Transforms (DCT-II)

=head1 SYNOPSIS

    use Math::DCT qw/dct dct1d dct2d/;

    my $dct1d = dct([[1,2,3,4]]);
    $dct1d = dct1d([1,2,3,4]);

    my $dct2d = dct([[1,2],[3,4]]);
    $dct2d = dct2d([1,2,3,4]);

=head1 VERSION

Version 0.03

=cut

our $VERSION = '0.03';

require XSLoader;
XSLoader::load('Math::DCT', $VERSION);

use Exporter qw(import);

our @EXPORT_OK = qw(
    dct
    dct1d
    dct2d
);

our %EXPORT_TAGS;
$EXPORT_TAGS{all} = [@EXPORT_OK];

=head1 DESCRIPTION

An unscaled DCT-II implementation for 1D and NxN 2D matrices implemented in XS.
For array sizes which are a power of 2, a fast algorithm (FCT) described by Lee is
used (with the addition of a coefficient table that makes it even faster than some
common implementations), plus an unscaled version of the Arai, Agui, Nakajima
algorithm is used for size 1x8, 8x8 matrices.

The module was written for a perceptual hash project that needed 32x32 DCT-II,
and on a 2.5GHz 2015 Macbook Pro over 11500/s per thread are processed (C<dct2d> function).
The common 8x8 DCT-II uses a special path, (abut 250000 transforms per sec on the same CPU),
although for most image/video applications that require 8x8 DCT there are much faster
implementations (SIMD, approximations etc) that usually produce an already scaled result
for the specific application.

None of the algorithms used on this module are approximate, the test suite verifies
against a naive DCT-II implementation with a tolerance of 1e-08.

=head1 METHODS
 
=head2 C<dct>

  my $dct = dct([[1,2],[3,4]]);

Pass an array (ref) of either a single array, or N N-length arrays for 1D and 2D
DCT-II calculation respectivelly. The output will be an arrayref of array(s) with
the result of the transform.

=cut

sub dct {
    my $vector = shift;
    die "Expect array of array(s)"
        unless $vector && ref $vector eq 'ARRAY'
        && $vector->[0] && ref $vector->[0] eq 'ARRAY';

    my $dim = scalar(@$vector);
    my $sz  = scalar(@{$vector->[0]});
    die "Expect 1d or NxN 2d arrays" unless $dim == 1 || $dim == $sz;

    my $pack;
    for (my $x = 0; $x < $dim; $x++) {
        $pack .= pack "d$sz", @{$vector->[$x]}
    }

    if ($dim > 1) {
        $sz == 8
            ? fct8_2d($pack)
            : 0 == ($sz & ($sz - 1)) ? fast_dct_2d($pack, $sz) : dct_2d($pack, $sz);
    } else {
        $sz == 8
            ? fct8_1d($pack)
            : 0 == ($sz & ($sz - 1)) ? fast_dct_1d($pack, $sz) : dct_1d($pack, $sz);
    }

    my $result;
    foreach (0..$dim-1) {
        $result->[$_] = [unpack "d".($sz), substr $pack, $_ * $sz*8, $sz*8];
    }
    return $result;
}

=head2 C<dct1d>

  my $dct = dct1d([1,2,3]);

Pass an array (ref) for a 1D DCT-II calculation. The output will be an arrayref
with the result of the transform.

=cut

sub dct1d {
    my $input = shift;
    my $sz    = scalar @$input;
    my $pack  = pack "d$sz", @$input;
    $sz == 8
        ? fct8_1d($pack)
        : 0 == ($sz & ($sz - 1)) ? fast_dct_1d($pack, $sz) : dct_1d($pack, $sz);
    my @result = unpack "d$sz", $pack;
    return \@result;
}

=head2 C<dct2d>

  my $dct = dct2d(
      [1,2,3,4],   # Arrayref containing your NxN matrix
      2            # Optionally, the size N of your array (sqrt of its length)
  );

Pass an array (ref) for a 2D DCT-II calculation. The length of the array is expected
to be a square (as only NxN arrays are supported) - you can optionally pass N as
the second argument to avoid a C<sqrt> calculation.
The output will be an arrayref with the result of the transform.

If your 2D data is available in a 1d array as is usual with most image manipulation
etc cases, this function will be faster than C<dct>, as the DCT calculation is
in any case done on a 1D array, hence you save the cost of conversion.

=cut

sub dct2d {
    my $input = shift;
    my $sz    = shift || sqrt(scalar @$input);
    my $pack  = pack "d".($sz*$sz), @$input;
    $sz == 8
        ? fct8_2d($pack)
        : 0 == ($sz & ($sz - 1)) ? fast_dct_2d($pack, $sz) : dct_2d($pack, $sz);
    my @result = unpack "d".($sz*$sz), $pack;
    return \@result;
}

=head1 USAGE NOTES

The C functions are not exported, but theoretically you could use them directly
if you do your own C<pack/unpack>. The fast versions for power-of-2 size arrays
are C<fast_dct_1d> and C<fast_dct_2d>, while the generic versions are C<dct_1d>
and C<dct_2d>. The specialized size-8 versions are C<fct8_1d> and C<fct8_2d>.
First argument is a C<char *> (use C<pack "dN">), second is the size N (except
for the fct8* functions which don't need a second argument).

=head1 ACKNOWLEDGEMENTS

Some code from Project Nayuki was adapted and improved upon.

(L<https://www.nayuki.io/page/fast-discrete-cosine-transform-algorithms>)

=head1 AUTHOR

Dimitrios Kechagias, C<< <dkechag at cpan.org> >>
 
=head1 BUGS

Please report any bugs or feature requests to C<bug-math-dct at rt.cpan.org>,
or through the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=Math-DCT>.
I will be notified, and then you'll automatically be notified of progress on your
bug as I make changes.

=head1 GIT

L<https://github.com/SpareRoom/Math-DCT>
 
=head1 COPYRIGHT & LICENSE

Copyright (C) 2019, SpareRoom.com

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

=cut

1;
