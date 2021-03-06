# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.009.
use strict;
use warnings;

use 5.006000;

use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "MetaCPAN source implementation",
  "AUTHOR" => "Chris Williams <chris\@bingosnet.co.uk>",
  "BUILD_REQUIRES" => {
    "Test::More" => "0.47"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "CPANPLUS-Internals-Source-MetaCPAN",
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.006000",
  "NAME" => "CPANPLUS::Internals::Source::MetaCPAN",
  "PREREQ_PM" => {
    "CPANPLUS" => "0.9001",
    "File::Fetch" => 0,
    "File::Spec" => 0,
    "JSON::PP" => 0,
    "Locale::Maketext::Simple" => 0,
    "Module::Load::Conditional" => 0,
    "Params::Check" => 0,
    "Parse::CPAN::Meta" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => "0.47"
  },
  "VERSION" => "0.10",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "CPANPLUS" => "0.9001",
  "File::Fetch" => 0,
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "JSON::PP" => 0,
  "Locale::Maketext::Simple" => 0,
  "Module::Load::Conditional" => 0,
  "Params::Check" => 0,
  "Parse::CPAN::Meta" => 0,
  "Test::More" => "0.47"
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
