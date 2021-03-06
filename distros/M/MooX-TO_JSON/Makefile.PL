# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.012.
use strict;
use warnings;



use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Generate a TO_JSON method from attributes.",
  "AUTHOR" => "John Napiorkowski <jjn1056\@gmail.com>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "MooX-TO_JSON",
  "LICENSE" => "perl",
  "NAME" => "MooX::TO_JSON",
  "PREREQ_PM" => {
    "Class::Method::Modifiers" => "2.12"
  },
  "TEST_REQUIRES" => {
    "JSON::MaybeXS" => "1.004000",
    "Moo" => "2.003004",
    "Test::Most" => "0.34"
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Class::Method::Modifiers" => "2.12",
  "JSON::MaybeXS" => "1.004000",
  "Moo" => "2.003004",
  "Test::Most" => "0.34"
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
