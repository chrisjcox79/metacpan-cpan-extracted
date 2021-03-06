# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.034.
use strict;
use warnings;

use 5.008001;

use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "programmatic XML generation, conveniently",
  "AUTHOR" => "Aristotle Pagaltzis <pagaltzis\@gmx.de>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "XML-Builder",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.008001",
  "NAME" => "XML::Builder",
  "PREREQ_PM" => {
    "Carp::Clan" => 0,
    "Encode" => 0,
    "Object::Tiny::Lvalue" => 0,
    "Scalar::Util" => 0,
    "overload" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.906",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp::Clan" => 0,
  "Encode" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Find" => 0,
  "File::Temp" => 0,
  "Object::Tiny::Lvalue" => 0,
  "Scalar::Util" => 0,
  "Test::More" => 0,
  "overload" => 0,
  "parent" => 0,
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
