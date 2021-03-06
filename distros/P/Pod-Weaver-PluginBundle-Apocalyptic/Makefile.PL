
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.021.
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Let the apocalypse generate your POD!",
  "AUTHOR" => "Apocalypse <APOCAL\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Module::Build" => "0.28"
  },
  "CONFIGURE_REQUIRES" => {
    "Module::Build" => "0.28"
  },
  "DISTNAME" => "Pod-Weaver-PluginBundle-Apocalyptic",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.006",
  "NAME" => "Pod::Weaver::PluginBundle::Apocalyptic",
  "PREREQ_PM" => {
    "Pod::Elemental::Transformer::List" => "0.101620",
    "Pod::Weaver::Config::Assembler" => "4.001",
    "Pod::Weaver::Plugin::EnsureUniqueSections" => "0.103531",
    "Pod::Weaver::Plugin::StopWords" => "1.001005",
    "Pod::Weaver::Section::Contributors" => "0.008",
    "Pod::Weaver::Section::SeeAlso" => "1.002",
    "Pod::Weaver::Section::Support" => "1.003",
    "Pod::Weaver::Section::WarrantyDisclaimer" => "0.111290",
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "File::Temp" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => "0.88"
  },
  "VERSION" => "0.004",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "File::Spec" => 0,
  "File::Temp" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "Module::Build" => "0.28",
  "Pod::Elemental::Transformer::List" => "0.101620",
  "Pod::Weaver::Config::Assembler" => "4.001",
  "Pod::Weaver::Plugin::EnsureUniqueSections" => "0.103531",
  "Pod::Weaver::Plugin::StopWords" => "1.001005",
  "Pod::Weaver::Section::Contributors" => "0.008",
  "Pod::Weaver::Section::SeeAlso" => "1.002",
  "Pod::Weaver::Section::Support" => "1.003",
  "Pod::Weaver::Section::WarrantyDisclaimer" => "0.111290",
  "Test::More" => "0.88",
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



