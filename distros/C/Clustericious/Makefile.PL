use strict; use warnings;
BEGIN {
  unless(eval q{ use 5.010001; 1}) {
    print "Perl 5.010001 or better required\n";
    exit;
  }
}
# This file was automatically generated by Dist::Zilla::Plugin::Author::Plicease::MakeMaker v2.25.
use strict;
use warnings;
use 5.010001;
use ExtUtils::MakeMaker;
use File::ShareDir::Install;

$File::ShareDir::Install::INCLUDE_DOTFILES = 1;
$File::ShareDir::Install::INCLUDE_DOTDIRS  = 1;
install_share dist => "share";

my %WriteMakefileArgs = (
  "ABSTRACT"           => "(Deprecated) A framework for RESTful processing systems.",
  "AUTHOR"             => "Graham Ollis <plicease\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker"     => 0,
    "File::ShareDir::Install" => "0.06"
  },
  "DISTNAME"  => "Clustericious",
  "EXE_FILES" => [
    "bin/clustericious"
  ],
  "LICENSE"          => "perl",
  "MIN_PERL_VERSION" => "5.010001",
  "NAME"             => "Clustericious",
  "PM"               => {
    "lib/Clustericious.pm"                             => "\$(INST_LIB)/Clustericious.pm",
    "lib/Clustericious/App.pm"                         => "\$(INST_LIB)/Clustericious/App.pm",
    "lib/Clustericious/Client.pm"                      => "\$(INST_LIB)/Clustericious/Client.pm",
    "lib/Clustericious/Client/Command.pm"              => "\$(INST_LIB)/Clustericious/Client/Command.pm",
    "lib/Clustericious/Client/Meta.pm"                 => "\$(INST_LIB)/Clustericious/Client/Meta.pm",
    "lib/Clustericious/Client/Meta/Route.pm"           => "\$(INST_LIB)/Clustericious/Client/Meta/Route.pm",
    "lib/Clustericious/Client/Object.pm"               => "\$(INST_LIB)/Clustericious/Client/Object.pm",
    "lib/Clustericious/Client/Object/DateTime.pm"      => "\$(INST_LIB)/Clustericious/Client/Object/DateTime.pm",
    "lib/Clustericious/Client/Object/Params.pm"        => "\$(INST_LIB)/Clustericious/Client/Object/Params.pm",
    "lib/Clustericious/Coder/JSON.pm"                  => "\$(INST_LIB)/Clustericious/Coder/JSON.pm",
    "lib/Clustericious/Coder/YAML.pm"                  => "\$(INST_LIB)/Clustericious/Coder/YAML.pm",
    "lib/Clustericious/Command.pm"                     => "\$(INST_LIB)/Clustericious/Command.pm",
    "lib/Clustericious/Command/apache.pm"              => "\$(INST_LIB)/Clustericious/Command/apache.pm",
    "lib/Clustericious/Command/configdebug.pm"         => "\$(INST_LIB)/Clustericious/Command/configdebug.pm",
    "lib/Clustericious/Command/configdump.pm"          => "\$(INST_LIB)/Clustericious/Command/configdump.pm",
    "lib/Clustericious/Command/configpath.pm"          => "\$(INST_LIB)/Clustericious/Command/configpath.pm",
    "lib/Clustericious/Command/configtest.pm"          => "\$(INST_LIB)/Clustericious/Command/configtest.pm",
    "lib/Clustericious/Command/configure.pm"           => "\$(INST_LIB)/Clustericious/Command/configure.pm",
    "lib/Clustericious/Command/daemon.pm"              => "\$(INST_LIB)/Clustericious/Command/daemon.pm",
    "lib/Clustericious/Command/generate.pm"            => "\$(INST_LIB)/Clustericious/Command/generate.pm",
    "lib/Clustericious/Command/generate/app.pm"        => "\$(INST_LIB)/Clustericious/Command/generate/app.pm",
    "lib/Clustericious/Command/generate/client.pm"     => "\$(INST_LIB)/Clustericious/Command/generate/client.pm",
    "lib/Clustericious/Command/hypnotoad.pm"           => "\$(INST_LIB)/Clustericious/Command/hypnotoad.pm",
    "lib/Clustericious/Command/lighttpd.pm"            => "\$(INST_LIB)/Clustericious/Command/lighttpd.pm",
    "lib/Clustericious/Command/morbo.pm"               => "\$(INST_LIB)/Clustericious/Command/morbo.pm",
    "lib/Clustericious/Command/nginx.pm"               => "\$(INST_LIB)/Clustericious/Command/nginx.pm",
    "lib/Clustericious/Command/plackup.pm"             => "\$(INST_LIB)/Clustericious/Command/plackup.pm",
    "lib/Clustericious/Command/start.pm"               => "\$(INST_LIB)/Clustericious/Command/start.pm",
    "lib/Clustericious/Command/status.pm"              => "\$(INST_LIB)/Clustericious/Command/status.pm",
    "lib/Clustericious/Command/stop.pm"                => "\$(INST_LIB)/Clustericious/Command/stop.pm",
    "lib/Clustericious/Command/which.pm"               => "\$(INST_LIB)/Clustericious/Command/which.pm",
    "lib/Clustericious/Commands.pm"                    => "\$(INST_LIB)/Clustericious/Commands.pm",
    "lib/Clustericious/Config.pm"                      => "\$(INST_LIB)/Clustericious/Config.pm",
    "lib/Clustericious/Config/Helpers.pm"              => "\$(INST_LIB)/Clustericious/Config/Helpers.pm",
    "lib/Clustericious/Controller.pm"                  => "\$(INST_LIB)/Clustericious/Controller.pm",
    "lib/Clustericious/HelloWorld.pm"                  => "\$(INST_LIB)/Clustericious/HelloWorld.pm",
    "lib/Clustericious/HelloWorld/Client.pm"           => "\$(INST_LIB)/Clustericious/HelloWorld/Client.pm",
    "lib/Clustericious/Log.pm"                         => "\$(INST_LIB)/Clustericious/Log.pm",
    "lib/Clustericious/Log/CommandLine.pm"             => "\$(INST_LIB)/Clustericious/Log/CommandLine.pm",
    "lib/Clustericious/Plugin/AutodataHandler.pm"      => "\$(INST_LIB)/Clustericious/Plugin/AutodataHandler.pm",
    "lib/Clustericious/Plugin/ClustericiousHelpers.pm" => "\$(INST_LIB)/Clustericious/Plugin/ClustericiousHelpers.pm",
    "lib/Clustericious/Plugin/CommonRoutes.pm"         => "\$(INST_LIB)/Clustericious/Plugin/CommonRoutes.pm",
    "lib/Clustericious/Plugin/PlugAuth.pm"             => "\$(INST_LIB)/Clustericious/Plugin/PlugAuth.pm",
    "lib/Clustericious/RouteBuilder.pm"                => "\$(INST_LIB)/Clustericious/RouteBuilder.pm",
    "lib/Clustericious/RouteBuilder/CRUD.pm"           => "\$(INST_LIB)/Clustericious/RouteBuilder/CRUD.pm",
    "lib/Clustericious/RouteBuilder/Search.pm"         => "\$(INST_LIB)/Clustericious/RouteBuilder/Search.pm",
    "lib/Test/Clustericious/Command.pm"                => "\$(INST_LIB)/Test/Clustericious/Command.pm",
    "lib/Test/Clustericious/Config.pm"                 => "\$(INST_LIB)/Test/Clustericious/Config.pm",
    "lib/Test/Clustericious/Log.pm"                    => "\$(INST_LIB)/Test/Clustericious/Log.pm"
  },
  "PREREQ_PM" => {
    "Capture::Tiny"                => 0,
    "Data::Rmap"                   => 0,
    "DateTime::Format::DateParse"  => 0,
    "DateTime::Format::ISO8601"    => 0,
    "File::ReadBackwards"          => 0,
    "File::ShareDir::Dist"         => 0,
    "File::Which"                  => 0,
    "Hash::Merge"                  => 0,
    "JSON::MaybeXS"                => 0,
    "List::Util"                   => "1.45",
    "Log::Log4perl"                => 0,
    "Log::Log4perl::Appender::TAP" => "0.02",
    "MojoX::Log::Log4perl"         => 0,
    "Mojolicious"                  => "7.31",
    "Path::Class"                  => "0.26",
    "PerlX::Maybe"                 => "0.003",
    "Sub::Exporter"                => 0,
    "Sub::Identify"                => "0.05",
    "Term::Prompt"                 => 0,
    "Test2::API"                   => "1.302015",
    "Test2::Plugin::FauxHomeDir"   => 0,
    "YAML::XS"                     => 0,
    "autodie"                      => 0
  },
  "TEST_REQUIRES" => {
    "File::chdir"                  => 0,
    "PlugAuth::Lite"               => 0,
    "Test2::Bundle::Extended"      => "0.000060",
    "Test::Clustericious::Cluster" => "0.37",
    "Test::More"                   => "0.94",
    "Test::Script"                 => "1.10",
    "Test::Warn"                   => 0
  },
  "VERSION" => "1.29",
  "test"    => {
    "TESTS" => "t/*.t"
    }
);

my %FallbackPrereqs = (
  "Capture::Tiny"                => 0,
  "Data::Rmap"                   => 0,
  "DateTime::Format::DateParse"  => 0,
  "DateTime::Format::ISO8601"    => 0,
  "File::ReadBackwards"          => 0,
  "File::ShareDir::Dist"         => 0,
  "File::Which"                  => 0,
  "File::chdir"                  => 0,
  "Hash::Merge"                  => 0,
  "JSON::MaybeXS"                => 0,
  "List::Util"                   => "1.45",
  "Log::Log4perl"                => 0,
  "Log::Log4perl::Appender::TAP" => "0.02",
  "MojoX::Log::Log4perl"         => 0,
  "Mojolicious"                  => "7.31",
  "Path::Class"                  => "0.26",
  "PerlX::Maybe"                 => "0.003",
  "PlugAuth::Lite"               => 0,
  "Sub::Exporter"                => 0,
  "Sub::Identify"                => "0.05",
  "Term::Prompt"                 => 0,
  "Test2::API"                   => "1.302015",
  "Test2::Bundle::Extended"      => "0.000060",
  "Test2::Plugin::FauxHomeDir"   => 0,
  "Test::Clustericious::Cluster" => "0.37",
  "Test::More"                   => "0.94",
  "Test::Script"                 => "1.10",
  "Test::Warn"                   => 0,
  "YAML::XS"                     => 0,
  "autodie"                      => 0
);

unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

{
  package
    MY;
  use File::ShareDir::Install qw(postamble);
}