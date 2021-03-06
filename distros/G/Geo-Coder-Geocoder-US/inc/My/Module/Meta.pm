package My::Module::Meta;

use 5.006002;

use strict;
use warnings;

use Carp;

sub new {
    my ( $class ) = @_;
    ref $class and $class = ref $class;
    my $self = {
	distribution => $ENV{MAKING_MODULE_DISTRIBUTION},
    };
    bless $self, $class;
    return $self;
}

sub build_requires {
    return +{
	'Test::More'	=> 0.88,	# Because of done_testing().
    };
}

sub distribution {
    my ( $self ) = @_;
    return $self->{distribution};
}

sub meta_merge {
    return {
	'meta-spec'	=> {
	    version	=> 2,
	},
	no_index	=> {
	    directory	=> [ qw{ inc t xt } ],
	},
	resources	=> {
	    bugtracker	=> {
                web	=> 'https://rt.cpan.org/Public/Dist/Display.html?Name=Geo-Coder-Geocoder-US',
#                mailto  => 'wyant@cpan.org',
            },
	    license	=> 'http://dev.perl.org/licenses/',
	    repository	=> {
		type	=> 'git',
		url	=> 'git://github.com/trwyant/perl-Geo-Coder-Geocoder-US.git',
		web	=> 'https://github.com/trwyant/perl-Geo-Coder-Geocoder-US',
	    },
	},
	x_deprecated	=> 1,
    };
}

sub notice {
    warn <<"EOD";

>>>> NOTICE <<<<\a\a\a

The web site that this module in a front-end to, http://geocoder.us/,
disappeared in late 2015. Without the web site, this module does
nothing. Because this web site or a readonable facsimile has not not
reappeared by mid-2016, this module HAS BEEN RETRACTED. See the POD for
the detailed plan.

EOD

    sleep 6;

    return;
}

sub requires {
    my ( undef, @extra ) = @_;		# Invocant unused
##  if ( ! $self->distribution() ) {
##  }
    return +{
	'Carp'			=> 0,
	'LWP::UserAgent'	=> 0,
	strict			=> 0,
	'Text::CSV'		=> 0,
#	'URI::Escape'		=> 0,
	'URI'			=> 0,
	warnings		=> 0,
	@extra,
    };
}

sub requires_perl {
    return 5.006002;
}


1;

__END__

=head1 NAME

My::Module::Meta - Information needed to build Geo::Coder::Geocoder::US

=head1 SYNOPSIS

 use lib qw{ inc };
 use My::Module::Meta;
 my $meta = My::Module::Meta->new();
 use YAML;
 print "Required modules:\n", Dump(
     $meta->requires() );

=head1 DETAILS

This module centralizes information needed to build C<Geo::Coder::Geocoder::US>. It
is private to the C<Geo::Coder::Geocoder::US> package, and may be changed or
retracted without notice.

=head1 METHODS

This class supports the following public methods:

=head2 new

 my $meta = My::Module::Meta->new();

This method instantiates the class.

=head2 build_requires

 use YAML;
 print Dump( $meta->build_requires() );

This method computes and returns a reference to a hash describing the
modules required to build the C<Geo::Coder::Geocoder::US> package, suitable for
use in a F<Build.PL> C<build_requires> key, or a F<Makefile.PL>
C<< {META_MERGE}->{build_requires} >> or C<BUILD_REQUIRES> key.

=head2 distribution

 if ( $meta->distribution() ) {
     print "Making distribution\n";
 } else {
     print "Not making distribution\n";
 }

This method returns the value of the environment variable
C<MAKING_MODULE_DISTRIBUTION> at the time the object was instantiated.

=head2 meta_merge

 use YAML;
 print Dump( $meta->meta_merge() );

This method returns a reference to a hash describing the meta-data which
has to be provided by making use of the builder's C<meta_merge>
functionality. This includes the C<no_index> and C<resources> data.

=head2 notice

 $meta->notice();

This method displays the pending-retraction notice.

=head2 requires

 use YAML;
 print Dump( $meta->requires() );

This method computes and returns a reference to a hash describing
the modules required to run the C<Geo::Coder::Geocoder::US>
package, suitable for use in a F<Build.PL> C<requires> key, or a
F<Makefile.PL> C<PREREQ_PM> key. Any additional arguments will be
appended to the generated hash. In addition, unless
L<distribution()|/distribution> is true, configuration-specific modules
may be added.

=head2 requires_perl

 print 'This package requires Perl ', $meta->requires_perl(), "\n";

This method returns the version of Perl required by the package.

=head1 ATTRIBUTES

This class has no public attributes.


=head1 ENVIRONMENT

=head2 MAKING_MODULE_DISTRIBUTION

This environment variable should be set to a true value if you are
making a distribution. This ensures that no configuration-specific
information makes it into F<META.yml>.


=head1 SUPPORT

Support is by the author. Please file bug reports at
L<http://rt.cpan.org>, or in electronic mail to the author.

=head1 AUTHOR

Thomas R. Wyant, III F<wyant at cpan dot org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010-2018 by Thomas R. Wyant, III

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl 5.10.0. For more details, see the full text
of the licenses in the directory LICENSES.

This program is distributed in the hope that it will be useful, but
without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

=cut

# ex: set textwidth=72 :
