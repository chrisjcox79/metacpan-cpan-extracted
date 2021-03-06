package Types::PDL;

# ABSTRACT: PDL types using Type::Tiny

use 5.010;

use strict;
use warnings;

our $VERSION = '0.03';

use Carp;

use Type::Library -base,
  -declare => qw[
    Piddle
    Piddle0D
    Piddle1D
    Piddle2D
    Piddle3D

    PiddleFromAny
  ];


use Types::Standard -types, 'is_Int';
use Type::Utils;
use Type::TinyX::Facets;
use String::Errf 'errf';
use B qw(perlstring);


facet 'empty', sub {
    my ( $o, $var ) = @_;
    return unless exists $o->{empty};
    errf '%{not}s%{var}s->isempty',
      { var => $var, not => ( !!delete( $o->{empty} ) ? '' : '!' ) };
};

facet 'null', sub {
    my ( $o, $var ) = @_;
    return unless exists $o->{null};
    errf '%{not}s%{var}s->isnull',
      { var => $var, not => ( !!delete( $o->{null} ) ? '' : '!' ) };
};

facet ndims => sub {
    my ( $o, $var ) = @_;

    my %o = map { ( $_ => delete $o->{$_} ) }
      grep { exists $o->{$_} } qw[ ndims ndims_min ndims_max ];

    return unless keys %o;

    croak( "'$_' must be an integer\n" )
      for grep { !is_Int( $o{$_} ) } keys %o;


    if ( exists $o{ndims_max} and exists $o{ndims_min} ) {

        if ( $o{ndims_max} < $o{ndims_min} ) {
            croak( "'ndims_min' must be <= 'ndims_max'\n" );
        }

        elsif ( $o{ndims_min} == $o{ndims_max} ) {

            croak(
                "cannot mix 'ndims' facet with either 'ndims_min' or 'ndims_max'\n"
            ) if exists $o{ndims};

            $o{ndims} = delete $o{ndims_min};
            delete $o{ndims_max};
        }
    }

    my @code;

    if ( exists $o{ndims_max} or exists $o{ndims_min} ) {

        if ( exists $o{ndims_min} ) {

            push @code, errf '%{var}s->ndims >= %{value}i',
              {
                var   => $var,
                value => delete $o{ndims_min} };
        }

        if ( exists $o{ndims_max} ) {

            push @code, errf '%{var}s->ndims <= %{value}i',
              {
                var   => $var,
                value => delete $o{ndims_max} };
        }
    }

    elsif ( exists $o{ndims} ) {

        push @code, errf '%{var}s->ndims == %{value}i',
          { var => $var, value => delete $o{ndims} };
    }

    else {
        return;
    }

    croak( "cannot mix 'ndims' facet with either 'ndims_min' or 'ndims_max'\n" )
      if keys %o;

    return join( ' and ', @code );
};


facet 'type', sub {
    my ( $o, $var ) = @_;
    return unless exists $o->{type};
    my $type = eval { PDL::Type->new( delete $o->{type} )->ioname };
    croak( "type must be a valid type name or a PDL::Type object: $@\n" )
      if $@;

    errf '%{var}s->type->ioname eq q[%{type}s]',
      { var => $var, type => $type };
};

facet 'shape', sub {
    my ( $o, $var ) = @_;
    return unless exists $o->{shape};

    my $shape = delete $o->{shape};

    croak( "shape must be a string or an arrayref of specifications" )
      unless 'ARRAY' eq ref $shape or ! ref $shape;

    errf q|join( ',', %{var}s->dims) =~ qr/%{regexp}s/x|,
      { var => $var, regexp => _mk_shape_regexp( $shape ) };
};


facetize qw[ empty null ndims type shape ], class_type Piddle, { class => 'PDL' };

facetize qw[ null type ], declare Piddle0D, as Piddle [ ndims => 0 ];

facetize qw[ empty null type shape ], declare Piddle1D, as Piddle [ ndims => 1 ];

facetize qw[ empty null type shape ], declare Piddle2D, as Piddle [ ndims => 2 ];

facetize qw[ empty null type shape ], declare Piddle3D, as Piddle [ ndims => 3 ];

declare_coercion PiddleFromAny, to_type Piddle, from Any, q[ do { local $@;
          require PDL::Core;
          my $new = eval { PDL::Core::topdl( $_ )  };
          $@ ? $_ : $new
     }
  ];


sub _mk_shape_regexp {

    my $spec = shift;

    # positive integer
    my $int = q/(?:[0123456789]+)/;

    my $re = qr/
               \s*(?:
                   (?:
                       (?<int> $int )
                       |
                       (?<any> X | : ) )
                   (?:
                        (?<quant>[*+?])
                    | (?:\{
                                (?<min>$int)
                                (?:(?<comma>,) (?<max>$int)? )?
                         \}
                        )
                   )?
               )
               \s*
               /x;

    my @spec;

    if ( !ref $spec ) {
        push @spec, { %+ }  while $spec =~ /\G$re,?/gc;
        croak( "error in spec starting HERE ==>",
            substr( $spec, pos( $spec ) || 0 ), "<\n" )
          if ( pos( $spec ) || 0 ) != length( $spec );
    }
    else {

        @spec = map {
            croak( "error parsing spec: >$_<\n" )
              unless /^$re$/;
            +{ %+ }
        } @$spec;
    }


    my @shape;

    for my $spec ( @spec ) {

        my $extent;

        if ( defined $spec->{int} ) {
            $extent = $spec->{int};
            croak( "extent cannot be zero"  )
              if ( $extent += 0 ) == 0;
        }
        else {
            $extent = $int;
        }

        my $res = "(?:${extent},?)";


        if ( defined $spec->{quant} ) {
            $res .= $spec->{quant};
        }
        elsif ( defined $spec->{min} ) {

                $res .= '{' . $spec->{min};

                $res .= ',' if defined $spec->{comma};
                $res .= $spec->{max} if defined $spec->{max};
                $res .= '}';
            }

        push @shape, $res;
    }

    #  this must be a string!
    return '^' . join( '', @shape ) . '$';
}



1;

#
# This file is part of Types-PDL
#
# This software is Copyright (c) 2017 by Smithsonian Astrophysical Observatory.
#
# This is free software, licensed under:
#
#   The GNU General Public License, Version 3, June 2007
#

=pod

=head1 NAME

Types::PDL - PDL types using Type::Tiny

=head1 VERSION

version 0.03

=head1 SYNOPSIS

  use Types::PDL -types;
  use Type::Params qw[ validate ];
  use PDL;

  validate( [ pdl ], Piddle );

=head1 DESCRIPTION

This module provides L<Type::Tiny> compatible types for L<PDL>.

=head2 Types

Types which accept parameters (see L</Parameters>) will list them.

=head3 C<Piddle>

Allows an object blessed into the class C<PDL>, e.g.

  validate( [pdl], Piddle );

It accepts the following parameters:

  null
  empty
  ndims
  ndims_min
  ndims_max
  shape
  type

=head3 C<Piddle0D>

Allows an object blessed into the class C<PDL> with C<ndims> = 0.
It accepts the following parameters:

  null
  type

=head3 C<Piddle1D>

Allows an object blessed into the class C<PDL> with C<ndims> = 1.
It accepts the following parameters:

  null
  empty
  shape
  type

=head3 C<Piddle2D>

Allows an object blessed into the class C<PDL> with C<ndims> = 2.
It accepts the following parameters:

  null
  empty
  shape
  type

=head3 C<Piddle3D>

Allows an object blessed into the class C<PDL> with C<ndims> = 3.
It accepts the following parameters:

  null
  empty
  shape
  type

=head2 Coercions

The following coercions are provided, and may be applied via a type
object's L<Type::Tiny/plus_coercions> or
L<Type::Tiny/plus_fallback_coercions> methods, e.g.

  Piddle->plus_coercions( PiddleFromAny );

=head3 C<PiddleFromAny>

Uses L<PDL::Core/topdl> to coerce the value into a piddle.

=head2 Parameters

Some types take optional parameters which add additional constraints
on the object.  For example, to indicate that only empty piddles are
accepted:

  validate( [pdl], Piddle[ empty => 1 ] );

The available parameters are:

=head3 C<empty>

This accepts a boolean value; if true the piddle must be empty
(i.e. the C<isempty> method returns true), if false, it must not be
empty.

=head3 C<null>

This accepts a boolean value; if true the piddle must be a null
piddle, if false, it must not be null.

=head3 C<ndims>

This specifies a fixed number of dimensions which the piddle must
have. Don't mix use this with C<ndims_min> or C<ndims_max>.

=head3 C<ndims_min>

The minimum number of dimensions the piddle may have. Don't specify
this with C<ndims>.

=head3 C<ndims_max>

The maximum number of dimensions the piddle may have. Don't specify
this with C<ndims>.

=head3 C<shape>

The shape of the piddle.

The value is a list of specifications for dimensions, expressed either
as elements in a Perl array or as comma-delimited fields in a string.

The specifications are reminiscent of regular expressions.  A specification
is composed of an extent size followed by an optional quantifier indicating
the number of dimensions it should match.

Extent sizes may be

=over

=item 1

A non-zero positive integer representing the extent of the dimension.

=item 2

The strings C<X> or C<:> indicating that any extent is accepted for that dimension

=back

Quantifiers may be

  *           Match 0 or more times
  +           Match 1 or more times
  ?           Match 1 or 0 times
  {n}         Match exactly n times
  {n,}        Match at least n times
  {n,m}       Match at least n but not more than m times

Here are some example specifications and the shapes they might match  (in the match, C<X> means any extent):

  2,2     => (2,2)
  3,3,3   => (3,3,3)
  3{3}    => (3,3,3)
  3{2,3}  => (3,3),  (3,3,3)
  1,X     => (1,X)
  1,X+    => (1,X), (1,X,X),  (1,X,X,X), ...
  1,X{1,} => (1,X), (1,X,X),  (1,X,X,X), ...
  1,X?,3   => (1,X,3), (1,3)
  1,2,X*   => (1,2), (1,2,X),  (1,2,X,X), ...
  1,2,3*,5   => (1,2,5), (1,2,3,5),  (1,2,3,3,5), ...

=head3 C<type>

The type of the piddle. The value may be a L<PDL::Type> object or a
string containing the name of a type (e.g., C<double>). For a complete
list of types, run this command:

  perl -MPDL::Types=mapfld,ppdefs \
    -E 'say mapfld( $_ => 'ppsym' => 'ioname' )  for ppdefs'

=head1 BUGS AND LIMITATIONS

You can make new bug reports, and view existing ones, through the
web interface at L<https://rt.cpan.org/Public/Dist/Display.html?Name=Types-PDL>.

=head1 AUTHOR

Diab Jerius <djerius@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2017 by Smithsonian Astrophysical Observatory.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut

__END__


#pod =head1 SYNOPSIS
#pod
#pod   use Types::PDL -types;
#pod   use Type::Params qw[ validate ];
#pod   use PDL;
#pod
#pod   validate( [ pdl ], Piddle );
#pod
#pod =head1 DESCRIPTION
#pod
#pod This module provides L<Type::Tiny> compatible types for L<PDL>.
#pod
#pod =head2 Types
#pod
#pod Types which accept parameters (see L</Parameters>) will list them.
#pod
#pod =head3 C<Piddle>
#pod
#pod Allows an object blessed into the class C<PDL>, e.g.
#pod
#pod   validate( [pdl], Piddle );
#pod
#pod It accepts the following parameters:
#pod
#pod   null
#pod   empty
#pod   ndims
#pod   ndims_min
#pod   ndims_max
#pod   shape
#pod   type
#pod
#pod =head3 C<Piddle0D>
#pod
#pod Allows an object blessed into the class C<PDL> with C<ndims> = 0.
#pod It accepts the following parameters:
#pod
#pod   null
#pod   type
#pod
#pod =head3 C<Piddle1D>
#pod
#pod Allows an object blessed into the class C<PDL> with C<ndims> = 1.
#pod It accepts the following parameters:
#pod
#pod   null
#pod   empty
#pod   shape
#pod   type
#pod
#pod =head3 C<Piddle2D>
#pod
#pod Allows an object blessed into the class C<PDL> with C<ndims> = 2.
#pod It accepts the following parameters:
#pod
#pod   null
#pod   empty
#pod   shape
#pod   type
#pod
#pod =head3 C<Piddle3D>
#pod
#pod Allows an object blessed into the class C<PDL> with C<ndims> = 3.
#pod It accepts the following parameters:
#pod
#pod   null
#pod   empty
#pod   shape
#pod   type
#pod
#pod =head2 Coercions
#pod
#pod The following coercions are provided, and may be applied via a type
#pod object's L<Type::Tiny/plus_coercions> or
#pod L<Type::Tiny/plus_fallback_coercions> methods, e.g.
#pod
#pod   Piddle->plus_coercions( PiddleFromAny );
#pod
#pod =head3 C<PiddleFromAny>
#pod
#pod Uses L<PDL::Core/topdl> to coerce the value into a piddle.
#pod
#pod
#pod =head2 Parameters
#pod
#pod Some types take optional parameters which add additional constraints
#pod on the object.  For example, to indicate that only empty piddles are
#pod accepted:
#pod
#pod   validate( [pdl], Piddle[ empty => 1 ] );
#pod
#pod The available parameters are:
#pod
#pod =head3  C<empty>
#pod
#pod This accepts a boolean value; if true the piddle must be empty
#pod (i.e. the C<isempty> method returns true), if false, it must not be
#pod empty.
#pod
#pod =head3  C<null>
#pod
#pod This accepts a boolean value; if true the piddle must be a null
#pod piddle, if false, it must not be null.
#pod
#pod =head3 C<ndims>
#pod
#pod This specifies a fixed number of dimensions which the piddle must
#pod have. Don't mix use this with C<ndims_min> or C<ndims_max>.
#pod
#pod =head3 C<ndims_min>
#pod
#pod The minimum number of dimensions the piddle may have. Don't specify
#pod this with C<ndims>.
#pod
#pod
#pod =head3  C<ndims_max>
#pod
#pod The maximum number of dimensions the piddle may have. Don't specify
#pod this with C<ndims>.
#pod
#pod =head3 C<shape>
#pod
#pod The shape of the piddle.
#pod
#pod The value is a list of specifications for dimensions, expressed either
#pod as elements in a Perl array or as comma-delimited fields in a string.
#pod
#pod The specifications are reminiscent of regular expressions.  A specification
#pod is composed of an extent size followed by an optional quantifier indicating
#pod the number of dimensions it should match.
#pod
#pod Extent sizes may be
#pod
#pod =over
#pod
#pod =item 1
#pod
#pod A non-zero positive integer representing the extent of the dimension.
#pod
#pod =item 2
#pod
#pod The strings C<X> or C<:> indicating that any extent is accepted for that dimension
#pod
#pod =back
#pod
#pod Quantifiers may be
#pod
#pod   *           Match 0 or more times
#pod   +           Match 1 or more times
#pod   ?           Match 1 or 0 times
#pod   {n}         Match exactly n times
#pod   {n,}        Match at least n times
#pod   {n,m}       Match at least n but not more than m times
#pod
#pod
#pod Here are some example specifications and the shapes they might match  (in the match, C<X> means any extent):
#pod
#pod   2,2     => (2,2)
#pod   3,3,3   => (3,3,3)
#pod   3{3}    => (3,3,3)
#pod   3{2,3}  => (3,3),  (3,3,3)
#pod   1,X     => (1,X)
#pod   1,X+    => (1,X), (1,X,X),  (1,X,X,X), ...
#pod   1,X{1,} => (1,X), (1,X,X),  (1,X,X,X), ...
#pod   1,X?,3   => (1,X,3), (1,3)
#pod   1,2,X*   => (1,2), (1,2,X),  (1,2,X,X), ...
#pod   1,2,3*,5   => (1,2,5), (1,2,3,5),  (1,2,3,3,5), ...
#pod
#pod
#pod =head3 C<type>
#pod
#pod The type of the piddle. The value may be a L<PDL::Type> object or a
#pod string containing the name of a type (e.g., C<double>). For a complete
#pod list of types, run this command:
#pod
#pod   perl -MPDL::Types=mapfld,ppdefs \
#pod     -E 'say mapfld( $_ => 'ppsym' => 'ioname' )  for ppdefs'
#pod
#pod
#pod =head1 SEE ALSO
