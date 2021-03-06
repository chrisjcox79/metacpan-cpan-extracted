
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.012.
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "App::Nopaste service for www.pastebin.ca",
  "AUTHOR" => "Zoffix Znet <cpan\@zoffix.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-Nopaste-Service-PastebinCa",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "App::Nopaste::Service::PastebinCa",
  "PREREQ_PM" => {
    "App::Nopaste::Service" => 0,
    "WWW::Pastebin::PastebinCa::Create" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => 0
  },
  "VERSION" => "1.004",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "App::Nopaste::Service" => 0,
  "Test::More" => 0,
  "WWW::Pastebin::PastebinCa::Create" => 0,
  "base" => 0,
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



