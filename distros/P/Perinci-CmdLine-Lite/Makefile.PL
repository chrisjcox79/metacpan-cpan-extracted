# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.012.
use strict;
use warnings;

use 5.010001;

use ExtUtils::MakeMaker;

use File::ShareDir::Install;
$File::ShareDir::Install::INCLUDE_DOTFILES = 1;
$File::ShareDir::Install::INCLUDE_DOTDIRS = 1;
install_share dist => "share";


my %WriteMakefileArgs = (
  "ABSTRACT" => "A Rinci/Riap-based command-line application framework",
  "AUTHOR" => "perlancar <perlancar\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::ShareDir::Install" => "0.06"
  },
  "DISTNAME" => "Perinci-CmdLine-Lite",
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.010001",
  "NAME" => "Perinci::CmdLine::Lite",
  "PREREQ_PM" => {
    "Complete::Bash" => "0.333",
    "Complete::Fish" => "0.03",
    "Complete::Tcsh" => 0,
    "Complete::Util" => "0.608",
    "Complete::Zsh" => 0,
    "Data::Clean::JSON" => "0.390",
    "Data::Dump" => 0,
    "Data::Sah" => "0.907",
    "Data::Sah::Util::Type" => "0.45",
    "Encode" => 0,
    "Fcntl" => 0,
    "File::Temp" => "0.2307",
    "File::Which" => 0,
    "Getopt::Long" => "2.50",
    "JSON::MaybeXS" => 0,
    "JSON::PP" => 0,
    "List::Util" => "1.45",
    "Log::ger" => "0.037",
    "Log::ger::App" => "0.009",
    "Log::ger::Output::Screen" => "0.012",
    "MIME::Base64" => 0,
    "Mo" => 0,
    "Perinci::Access::Lite" => "0.09",
    "Perinci::CmdLine::Help" => "0.172",
    "Perinci::CmdLine::Util::Config" => "1.724",
    "Perinci::Object" => "0.310",
    "Perinci::Result::Format::Lite" => "0.277",
    "Perinci::Sub::Complete" => "0.935",
    "Perinci::Sub::GetArgs::Argv" => "0.845",
    "Progress::Any::Output" => 0,
    "Progress::Any::Output::TermProgressBarColor" => "0.17",
    "Scalar::Util" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => "0.98",
    "Test::Perinci::CmdLine" => "1.47",
    "YAML::Old" => 0
  },
  "VERSION" => "1.900",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Complete::Bash" => "0.333",
  "Complete::Fish" => "0.03",
  "Complete::Tcsh" => 0,
  "Complete::Util" => "0.608",
  "Complete::Zsh" => 0,
  "Data::Clean::JSON" => "0.390",
  "Data::Dump" => 0,
  "Data::Sah" => "0.907",
  "Data::Sah::Util::Type" => "0.45",
  "Encode" => 0,
  "Fcntl" => 0,
  "File::Spec" => 0,
  "File::Temp" => "0.2307",
  "File::Which" => 0,
  "Getopt::Long" => "2.50",
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "JSON::MaybeXS" => 0,
  "JSON::PP" => 0,
  "List::Util" => "1.45",
  "Log::ger" => "0.037",
  "Log::ger::App" => "0.009",
  "Log::ger::Output::Screen" => "0.012",
  "MIME::Base64" => 0,
  "Mo" => 0,
  "Perinci::Access::Lite" => "0.09",
  "Perinci::CmdLine::Help" => "0.172",
  "Perinci::CmdLine::Util::Config" => "1.724",
  "Perinci::Object" => "0.310",
  "Perinci::Result::Format::Lite" => "0.277",
  "Perinci::Sub::Complete" => "0.935",
  "Perinci::Sub::GetArgs::Argv" => "0.845",
  "Progress::Any::Output" => 0,
  "Progress::Any::Output::TermProgressBarColor" => "0.17",
  "Scalar::Util" => 0,
  "Test::More" => "0.98",
  "Test::Perinci::CmdLine" => "1.47",
  "YAML::Old" => 0,
  "parent" => 0,
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

{
package
MY;
use File::ShareDir::Install qw(postamble);
}
