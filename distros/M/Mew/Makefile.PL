# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.012.
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Moo with sugar on top",
  "AUTHOR" => "Zoffix Znet <cpan\@zoffix.com>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "Mew",
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.006",
  "NAME" => "Mew",
  "PREREQ_PM" => {
    "Filter::Simple" => 0,
    "FindBin" => 0,
    "Import::Into" => "1.002005",
    "Module::Runtime" => "0.014",
    "Moo" => "2.002004",
    "MooX" => "0.101",
    "MooX::ChainedAttributes" => "0.04",
    "Type::Tiny" => "1.000005",
    "Types::Common::Numeric" => 0,
    "Types::Standard" => 0,
    "namespace::clean" => "0.26",
    "strictures" => "2.000002"
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "FindBin" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => 0,
    "Test::Most" => 0,
    "lib" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.002003",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "File::Spec" => 0,
  "Filter::Simple" => 0,
  "FindBin" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "Import::Into" => "1.002005",
  "Module::Runtime" => "0.014",
  "Moo" => "2.002004",
  "MooX" => "0.101",
  "MooX::ChainedAttributes" => "0.04",
  "Test::More" => 0,
  "Test::Most" => 0,
  "Type::Tiny" => "1.000005",
  "Types::Common::Numeric" => 0,
  "Types::Standard" => 0,
  "lib" => 0,
  "namespace::clean" => "0.26",
  "strict" => 0,
  "strictures" => "2.000002",
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
