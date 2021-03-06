# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.009.
use strict;
use warnings;



use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "A Task to install all POE simple TCP/IP services modules.",
  "AUTHOR" => "Chris Williams <chris\@bingosnet.co.uk>",
  "BUILD_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.36",
    "Test::More" => "0.47"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "Task-POE-Simple-TCPIP-Services",
  "LICENSE" => "perl",
  "NAME" => "Task::POE::Simple::TCPIP::Services",
  "PREREQ_PM" => {
    "POE" => "1.0001",
    "POE::Component::Server::Chargen" => "1.1",
    "POE::Component::Server::Daytime" => "1.1",
    "POE::Component::Server::Discard" => "1.1",
    "POE::Component::Server::Echo" => "1.6",
    "POE::Component::Server::Qotd" => "1.1",
    "POE::Component::Server::Time" => "1.1"
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => "0.47"
  },
  "VERSION" => "1.10",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "ExtUtils::MakeMaker" => "6.36",
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "POE" => "1.0001",
  "POE::Component::Server::Chargen" => "1.1",
  "POE::Component::Server::Daytime" => "1.1",
  "POE::Component::Server::Discard" => "1.1",
  "POE::Component::Server::Echo" => "1.6",
  "POE::Component::Server::Qotd" => "1.1",
  "POE::Component::Server::Time" => "1.1",
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
