# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.012.
use strict;
use warnings;



use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Allows web authentication using cookies and a storage engine. ",
  "AUTHOR" => "Adam Hopkins <srchulo\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "Web-Authenticate",
  "LICENSE" => "perl",
  "NAME" => "Web::Authenticate",
  "PREREQ_PM" => {
    "CGI" => 0,
    "CGI::Cookie" => 0,
    "Carp" => 0,
    "Crypt::PBKDF2" => 0,
    "DBIx::Raw" => 0,
    "DateTime" => 0,
    "Digest::SHA" => 0,
    "Mouse" => 0,
    "Mouse::Role" => 0,
    "Mouse::Util::TypeConstraints" => 0,
    "Ref::Util" => 0,
    "Session::Token" => 0,
    "strict" => 0
  },
  "VERSION" => "0.013",
  "test" => {
    "TESTS" => ""
  }
);


my %FallbackPrereqs = (
  "CGI" => 0,
  "CGI::Cookie" => 0,
  "Carp" => 0,
  "Crypt::PBKDF2" => 0,
  "DBIx::Raw" => 0,
  "DateTime" => 0,
  "Digest::SHA" => 0,
  "Mouse" => 0,
  "Mouse::Role" => 0,
  "Mouse::Util::TypeConstraints" => 0,
  "Ref::Util" => 0,
  "Session::Token" => 0,
  "strict" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
