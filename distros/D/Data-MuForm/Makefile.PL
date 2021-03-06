# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.010.
use strict;
use warnings;



use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Data validator and form processor",
  "AUTHOR" => "Gerda Shank",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "Data-MuForm",
  "LICENSE" => "perl",
  "NAME" => "Data::MuForm",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Class::Load" => "0.06",
    "Class::XSAccessor" => 0,
    "Crypt::CBC" => 0,
    "Data::Clone" => 0,
    "Data::Dump" => 0,
    "DateTime" => 0,
    "DateTime::Format::Strptime" => 0,
    "Email::Valid" => 0,
    "File::ShareDir" => 0,
    "File::Spec" => 0,
    "HTML::Entities" => 0,
    "HTML::TreeBuilder" => "3.23",
    "JSON" => 0,
    "List::Util" => "1.33",
    "Moo" => "2.000",
    "MooX::Aliases" => 0,
    "Regexp::Common" => 0,
    "Scalar::Util" => 0,
    "Sub::Exporter" => 0,
    "Sub::Name" => 0,
    "Test::Builder::Module" => 0,
    "Try::Tiny" => 0,
    "Type::Tiny" => 0,
    "aliased" => 0
  },
  "TEST_REQUIRES" => {
    "Test::Differences" => 0,
    "Test::Exception" => 0,
    "Test::Memory::Cycle" => "1.04",
    "Test::More" => "0.94",
    "Test::Warn" => 0
  },
  "VERSION" => "0.05",
  "test" => {
    "TESTS" => "t/*.t t/compound/*.t t/errors/*.t t/field_setup/*.t t/fields/*.t t/form_setup/*.t t/localizer/*.t t/render/*.t t/repeatable/*.t t/transform/*.t t/validation/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Class::Load" => "0.06",
  "Class::XSAccessor" => 0,
  "Crypt::CBC" => 0,
  "Data::Clone" => 0,
  "Data::Dump" => 0,
  "DateTime" => 0,
  "DateTime::Format::Strptime" => 0,
  "Email::Valid" => 0,
  "File::ShareDir" => 0,
  "File::Spec" => 0,
  "HTML::Entities" => 0,
  "HTML::TreeBuilder" => "3.23",
  "JSON" => 0,
  "List::Util" => "1.33",
  "Moo" => "2.000",
  "MooX::Aliases" => 0,
  "Regexp::Common" => 0,
  "Scalar::Util" => 0,
  "Sub::Exporter" => 0,
  "Sub::Name" => 0,
  "Test::Builder::Module" => 0,
  "Test::Differences" => 0,
  "Test::Exception" => 0,
  "Test::Memory::Cycle" => "1.04",
  "Test::More" => "0.94",
  "Test::Warn" => 0,
  "Try::Tiny" => 0,
  "Type::Tiny" => 0,
  "aliased" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
