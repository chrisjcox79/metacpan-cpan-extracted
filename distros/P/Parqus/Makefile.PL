# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.015.
use strict;
use warnings;



use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "parse a search query string",
  "AUTHOR" => "David Schmidt <davewood\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "Parqus",
  "LICENSE" => "perl",
  "NAME" => "Parqus",
  "PREREQ_PM" => {
    "Moo" => 0,
    "Regexp::Grammars" => 0,
    "namespace::autoclean" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => "0.88",
    "Test::Warnings" => 0
  },
  "VERSION" => "0.05",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Moo" => 0,
  "Regexp::Grammars" => 0,
  "Test::More" => "0.88",
  "Test::Warnings" => 0,
  "namespace::autoclean" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
