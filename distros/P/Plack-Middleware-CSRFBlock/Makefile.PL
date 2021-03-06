
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.019.
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Block CSRF Attacks with minimal changes to your app",
  "AUTHOR" => "Rintaro Ishizaki <rintaro\@cpan.org>, William Wolf <throughnothing\@gmail.com>, Matthew Phillips <mattp\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Plack-Middleware-CSRFBlock",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Plack::Middleware::CSRFBlock",
  "PREREQ_PM" => {
    "Digest::SHA1" => 0,
    "HTML::Parser" => 0,
    "Plack" => 0,
    "Time::HiRes" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "HTTP::Request::Common" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Plack::Middleware::Session" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.10",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Digest::SHA1" => 0,
  "File::Spec" => 0,
  "HTML::Parser" => 0,
  "HTTP::Request::Common" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "Plack" => 0,
  "Plack::Middleware::Session" => 0,
  "Test::More" => 0,
  "Time::HiRes" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



