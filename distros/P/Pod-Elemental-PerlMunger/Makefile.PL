# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.003.
use strict;
use warnings;



use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "a thing that takes a string of Perl and rewrites its documentation",
  "AUTHOR" => "Ricardo SIGNES <rjbs\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "Pod-Elemental-PerlMunger",
  "LICENSE" => "perl",
  "NAME" => "Pod::Elemental::PerlMunger",
  "PREREQ_PM" => {
    "Encode" => 0,
    "List::Util" => "1.33",
    "Moose" => 0,
    "Moose::Role" => 0,
    "PPI" => 0,
    "Params::Util" => 0,
    "Pod::Elemental" => "0.103000",
    "namespace::autoclean" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "Moose" => 0,
    "Pod::Elemental" => "0.103000",
    "Test::More" => "0.96",
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.200006",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Encode" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Spec" => 0,
  "List::Util" => "1.33",
  "Moose" => 0,
  "Moose::Role" => 0,
  "PPI" => 0,
  "Params::Util" => 0,
  "Pod::Elemental" => "0.103000",
  "Test::More" => "0.96",
  "namespace::autoclean" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
