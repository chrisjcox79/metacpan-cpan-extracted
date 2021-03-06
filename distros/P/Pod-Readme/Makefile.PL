# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.012.
use strict;
use warnings;

use 5.010001;

use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Intelligently generate a README file from POD",
  "AUTHOR" => "Robert Rothenberg <rrwo\@cpan.org>",
  "CONFIGURE_REQUIRES" => {},
  "DISTNAME" => "Pod-Readme",
  "EXE_FILES" => [
    "bin/pod2readme"
  ],
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.010001",
  "NAME" => "Pod::Readme",
  "PREREQ_PM" => {
    "CPAN::Changes" => "0.30",
    "CPAN::Meta" => 0,
    "Class::Method::Modifiers" => 0,
    "File::Slurp" => 0,
    "Getopt::Long::Descriptive" => 0,
    "Hash::Util" => 0,
    "List::Util" => "1.33",
    "Module::CoreList" => 0,
    "Moo" => 0,
    "Moo::Role" => 0,
    "MooX::HandlesVia" => 0,
    "Path::Tiny" => 0,
    "Pod::Simple" => 0,
    "Role::Tiny" => 0,
    "Scalar::Util" => 0,
    "Try::Tiny" => 0,
    "Type::Tiny" => "1.000000",
    "Types::Standard" => 0,
    "namespace::autoclean" => 0
  },
  "TEST_REQUIRES" => {
    "Cwd" => 0,
    "File::Compare" => 0,
    "File::Spec" => 0,
    "IO::String" => 0,
    "Module::Metadata" => 0,
    "Pod::Simple::Text" => 0,
    "Test::Deep" => 0,
    "Test::Exception" => 0,
    "Test::Kit" => 0,
    "Test::More" => 0
  },
  "VERSION" => "v1.2.3",
  "test" => {
    "TESTS" => "t/*.t t/plugins/*.t"
  }
);


my %FallbackPrereqs = (
  "CPAN::Changes" => "0.30",
  "CPAN::Meta" => 0,
  "Class::Method::Modifiers" => 0,
  "Cwd" => 0,
  "File::Compare" => 0,
  "File::Slurp" => 0,
  "File::Spec" => 0,
  "Getopt::Long::Descriptive" => 0,
  "Hash::Util" => 0,
  "IO::String" => 0,
  "List::Util" => "1.33",
  "Module::CoreList" => 0,
  "Module::Metadata" => 0,
  "Moo" => 0,
  "Moo::Role" => 0,
  "MooX::HandlesVia" => 0,
  "Path::Tiny" => 0,
  "Pod::Simple" => 0,
  "Pod::Simple::Text" => 0,
  "Role::Tiny" => 0,
  "Scalar::Util" => 0,
  "Test::Deep" => 0,
  "Test::Exception" => 0,
  "Test::Kit" => 0,
  "Test::More" => 0,
  "Try::Tiny" => 0,
  "Type::Tiny" => "1.000000",
  "Types::Standard" => 0,
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
