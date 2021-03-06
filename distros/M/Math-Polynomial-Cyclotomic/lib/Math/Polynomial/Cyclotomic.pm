# Copyright (c) 2013-2019 by Martin Becker.  This package is free software,
# licensed under The Artistic License 2.0 (GPL compatible).

package Math::Polynomial::Cyclotomic;

use 5.006;
use strict;
use warnings;
use Math::Polynomial;
use Math::Prime::Util qw(divisors);
require Exporter;

our @ISA         = qw(Exporter);
our @EXPORT_OK   = qw(
    cyclo_poly cyclo_factors cyclo_poly_iterate cyclo_factors_iterate
);
our %EXPORT_TAGS = (all => \@EXPORT_OK);
our $VERSION     = '0.002';

# some polynomial with default coefficient type
my $poly = Math::Polynomial->new;
$poly->string_config({fold_sign => 1, times => '*'});

# ----- private subroutine -----

sub _cyclo_poly {
    my ($u, $table, $n, $divisors) = @_;
    my @d = $divisors? (grep { not $n % $_ } @{$divisors}): divisors($n);
    my $p = $u->monomial(pop @d)->sub_($u);
    if (@d) {
        my $m = $d[-1];
        $p /= $u->monomial($m)->sub_($u);
        for (my $i = 1; $i < $#d; ++$i) {
            my $r = $d[$i];
            if ($m % $r) {
                $p /= $table->{$r} || _cyclo_poly($u, $table, $r, \@d);
            }
        }
    }
    $table->{$n} = $p;
    return $p;
}

sub _cyclo_factors {
    my ($u, $table, $n) = @_;
    my @d = divisors($n);
    return map { $table->{$_} || _cyclo_poly($u, $table, $_, \@d) } @d;
}

# ----- Math::Polynomial extension -----

sub Math::Polynomial::cyclotomic {
    my ($this, $n, $table) = @_;
    my $u = $this->monomial(0);
    return _cyclo_poly($u, {}, $n) if !$table;
    return $table->{$n} || _cyclo_poly($u, $table, $n);
}

sub Math::Polynomial::cyclo_factors {
    my ($this, $n, $table) = @_;
    my $u = $this->monomial(0);
    return _cyclo_factors($u, $table || {}, $n);
}

sub Math::Polynomial::cyclo_poly_iterate {
    my ($this, $n, $table) = @_;
    my $u = $this->monomial(0);
    $n ||= 1;
    --$n;
    $table ||= {};
    return
        sub {
            ++$n;
            $table->{$n} || _cyclo_poly($u, $table, $n);
        };
}

sub Math::Polynomial::cyclo_factors_iterate {
    my ($this, $n, $table) = @_;
    my $u = $this->monomial(0);
    $n ||= 1;
    $table ||= {};
    return sub { _cyclo_factors($u, $table, $n++) };
}

# ----- public subroutines -----

sub cyclo_poly            { $poly->cyclotomic(@_)            }
sub cyclo_factors         { $poly->cyclo_factors(@_)         }
sub cyclo_poly_iterate    { $poly->cyclo_poly_iterate(@_)    }
sub cyclo_factors_iterate { $poly->cyclo_factors_iterate(@_) }

1;

__END__

=encoding utf8

=head1 NAME

Math::Polynomial::Cyclotomic - cyclotomic polynomials generator

=head1 VERSION

This documentation refers to Version 0.002 of Math::Polynomial::Cyclotomic.

=head1 SYNOPSIS

  use Math::Polynomial::Cyclotomic qw(
    cyclo_poly cyclo_factors cyclo_poly_iterate cyclo_factors_iterate );
  use Math::Polynomial::Cyclotomic qw(:all);

  $p6 = cyclo_poly(6);                    # x^2-x+1

  # complete factorization of x^6-1
  @f6 = cyclo_factors(6);                 # x-1, x+1, x^2+x+1, x^2-x+1

  # iterator generating consecutive cyclotomic polynomials
  $it = cyclo_poly_iterate(1);
  $p1 = $it->();                          # x-1
  $p2 = $it->();                          # x+1
  $p3 = $it->();                          # x^2+x+1

  # iterator generating factors of consecutive binomials x^n-1
  $it = cyclo_factors_iterate(3);
  @f3 = $it->();                          # x-1, x^2+x+1
  @f4 = $it->();                          # x-1, x+1, x^2+1

  # constructors for a given coefficient type, such as Math::AnyNum
  $poly = Math::Polynomial->new(Math::AnyNum->new(0));
  $p6 = $poly->cyclotomic(6);             # x^2-x+1
  @fs = $poly->cyclo_factors(6);          # x-1, x+1, x^2+x+1, x^2-x+1
  $it = $poly->cyclo_poly_iterate(1);     # as above
  $it = $poly->cyclo_factors_iterate(3);  # as above

  # optional argument: hashref of read-write polynomial index
  %table = ();
  @f6    = cyclo_factors(6, \%table);
  $p3    = $table{3};                     # already done
  $p18   = cyclo_poly(18, \%table);       # faster

=head1 DESCRIPTION

This small extension of Math::Polynomial adds a constructor for cyclotomic
polynomials and a factoring algorithm for rational polynomials of the
form I<x^n-1>.  Cyclotomic polynomials are monic irreducible polynomials
with integer coefficients that are a divisor of some binomial I<x^n-1>
but not of any other binomial I<x^k-1> with I<k> E<lt> I<n>.

=over 4

=item I<cyclo_poly>

If C<$n> is a positive integer number, C<cyclo_poly($n)> calculates
the I<n>th cyclotomic polynomial.

If C<%table> is a dictionary mapping indexes to previously computed
cyclotomic polynomials, C<cyclo_poly($n, \%table)> will do the same, but
use the table to store and look up intermediate results that also happen
to be cyclotomic polynomials.  The table must not contain other stuff,
nor should it be used for more than one coefficient type.  To be safe,
start with an empty hash but re-use it for similar calculations.

=item I<Math::Polynomial::cyclotomic>

If C<$poly> is a Math::Polynomial object and Math::Polynomial::Cyclotomic
has been loaded, C<$poly-E<gt>cyclotomic($n)> is essentially equivalent
to C<cyclo_poly($n)>, but returns a polynomial sharing the coefficient
type of C<$poly>.

With an optional hashref argument for memoization,
C<$poly-E<gt>cyclotomic($n, \%table)> will work similar to
C<cyclo_poly($n, \%table)>.

=item I<cyclo_factors>

If C<$n> is a positive integer number, C<cyclo_factors($n)> calculates a
complete factorization of I<x^n-1> over the field of rational numbers.
These are precisely the cyclotomic polynomials with index I<k>, I<k>
running through all positive integer divisors of I<n>.  The factors are
ordered by increasing index, so that the I<n>th cyclotomic polynomial
will be the last element of the list returned.

Like L</cyclo_poly>, I<cyclo_factors> can be called with an optional
hashref argument for memoization.  It will store individual cyclotomic
polynomials, not complete factorizations, and can thus be used with
I<cyclo_poly> and I<cyclo_factors> interchangeably.

=item I<Math::Polynomial::cyclo_factors>

If C<$poly> is a Math::Polynomial object and Math::Polynomial::Cyclotomic
has been loaded, C<$poly-E<gt>cyclo_factors($n)> is essentially equivalent
to C<cyclo_factors($n)>, but returns a list of polynomials sharing the
coefficient type of C<$poly>.

With an optional hashref argument for memoization,
C<$poly-E<gt>cyclo_factors($n, \%table)> will work similar to
C<cyclo_factors($n, \%table)>.

=item I<cyclo_poly_iterate>

If C<$n> is a positive integer number, C<cyclo_poly_iterate($n)> returns
a coderef that, repeatedly called, returns consecutive cyclotomic
polynomials starting with index I<n>.  If C<$n> is omitted it defaults
to 1.  Iterating this way is more time-efficient than repetitive
calls of I<cyclo_poly>, as intermediate results that would otherwise
be re-calculated later are memoized in the state of the closure.
Re-assigning or undefining the coderef will free the memory used for that.

Alternatively, an external memoization table can be used, if supplied
as optional hashref argument, as in C<cyclo_poly_iterate($n, \%table)>.

=item I<Math::Polynomial::cyclo_poly_iterate>

If C<$poly> is a Math::Polynomial object and Math::Polynomial::Cyclotomic
has been loaded, C<$poly-E<gt>cyclo_poly_iterate($n)> is essentially
equivalent to C<cyclo_poly_iterate($n)>, but the polynomials returned
by the iterator will share the coefficient type of C<$poly>.

With an optional hashref argument for memoization,
C<$poly-E<gt>cyclo_poly_iterate($n, \%table)> will work similar to
C<cyclo_poly_iterate($n, \%table)>.

=item I<cyclo_factors_iterate>

If C<$n> is a positive integer number, C<cyclo_factors_iterate($n)>
returns a coderef that, repeatedly called, returns factorizations of
consecutive binomials I<x^k-1> starting with I<k> = I<n>.  If C<$n> is
omitted it defaults to 1.  Iterating this way is more time-efficient than
repetitive calls of I<cyclo_factors>, as intermediate results that would
otherwise be re-calculated later are memoized in the state of the closure.
Re-assigning or undefining the coderef will free the memory used for that.

Alternatively, an external memoization table can be used, if supplied as
optional hashref argument, as in C<cyclo_factors_iterate($n, \%table)>.
It will store individual cyclotomic polynomials, not complete
factorizations, and can thus be used with I<cyclo_poly_iterate> and
I<cyclo_factors_iterate>, as well as I<cyclo_poly> and I<cyclo_factors>,
interchangeably.

=item I<Math::Polynomial::cyclo_factors_iterate>

If C<$poly> is a Math::Polynomial object and Math::Polynomial::Cyclotomic
has been loaded, C<$poly-E<gt>cyclo_factors_iterate($n)> is essentially
equivalent to C<cyclo_factors_iterate($n)>, but the polynomials returned
by the iterator will share the coefficient type of C<$poly>.

With an optional hashref argument for memoization,
C<$poly-E<gt>cyclo_factors_iterate($n, \%table)> will work similar to
C<cyclo_factors_iterate($n, \%table)>.

=back

=head1 DIAGNOSTICS

While this library doesn't have specific diagnostic messages, some
exceptions from Math::Polynomial or Math::Prime::Util may indicate
inappropriate arguments.

=over 4

=item C<exponent too large>

The integer argument I<n>, which necessitates operations on polynomials
up to degree I<n>, was too large for current Math::Polynomial limitations.

=item C<Parameter '%s' must be a positive integer>

The argument I<n> should have been a positive integer number but was not.

=back

=head1 DEPENDENCIES

This library uses Math::Polynomial (version 1.001 and up) for polynomial
arithmetic and Math::Prime::Util (version 0.36 and up) for factoring
integers.  The minimal required perl version is 5.6.

=head1 ROADMAP

While cyclotomic polynomials are irreducible over the integers in general,
they can be further factorized with algebraic methods when restricted to
particular integer values.  We intend to add aurifeuillean factorization
in an upcoming release.

It will be not very hard to extend the interface to factor not just
I<x^n-1> but, more generally, I<x^nE<177>y^n>, too.  We might add this
feature just for that reason.

Other improvements should address performance with large degrees,
eventually.  This is, however, not a priority so far.

=head1 BUGS AND LIMITATIONS

This implementation is optimized for I<n> E<8804> 10000.  It assumes
that factoring numbers up to I<n> is cheap, and it employs polynomial
division via Math::Polynomial, using pure Perl to operate on arrays
of coefficients.

For larger I<n>, C<$Math::Polynomial::max_degree> must be raised or
undefined.  For very large I<n>, a memory-efficient polynomial type
and an arbitrary precision coefficient type should be used.  Note that
although Math::BigInt is not in general a coefficient type suitable
for polynomial division, in this case it would be sufficent, as all of
our divisions in the coefficient space have integer results.

Currently, our algorithms do not always avoid factoring integer numbers
more than once.  Doing so more rigorously might speed up calculations
for very large I<n>.

Bug reports and suggestions are always welcome
E<8212> please submit them through the CPAN RT,
L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Math-Polynomial-Cyclotomic>.

=head1 SEE ALSO

=over 4

=item *

L<Math::Polynomial>

=item *

L<Math::Prime::Util>

=back

=head1 AUTHOR

Martin Becker, E<lt>becker-cpan-mp (at) cozap.comE<gt>

=head1 CONTRIBUTING

Contributions to this library are welcome (see the CONTRIBUTING file).

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2019 by Martin Becker, Blaubeuren.

This library is free software; you can distribute it and/or modify it
under the terms of the Artistic License 2.0 (see the LICENSE file).

=head1 DISCLAIMER OF WARRANTY

This library is distributed in the hope that it will be useful,
but without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

=cut
