# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.005.
use strict;
use warnings;

use 5.008005;

use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "A Dist::Zilla (and hence Dist::Milla) command to update generated files",
  "AUTHOR" => "Thomas Sibley <tsibley\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "Dist-Zilla-App-Command-update",
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.008005",
  "NAME" => "Dist::Zilla::App::Command::update",
  "PREREQ_PM" => {
    "Dist::Zilla::App" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => "0.96"
  },
  "VERSION" => "0.06",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Dist::Zilla::App" => 0,
  "Test::More" => "0.96"
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
