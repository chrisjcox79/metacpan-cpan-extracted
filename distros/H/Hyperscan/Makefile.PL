# This Makefile.PL for Hyperscan was generated by
# inc::MakeMaker <self>
# and Dist::Zilla::Plugin::MakeMaker::Awesome 0.48.
# Don't edit it but the dist.ini and plugins used to construct it.

use strict;
use warnings;

use ExtUtils::Constant qw(WriteConstants);

my @names = qw(
    HS_MAJOR HS_MINOR HS_PATCH

    HS_FLAG_CASELESS
    HS_FLAG_DOTALL
    HS_FLAG_MULTILINE
    HS_FLAG_SINGLEMATCH
    HS_FLAG_ALLOWEMPTY
    HS_FLAG_UTF8
    HS_FLAG_UCP
    HS_FLAG_PREFILTER
    HS_FLAG_SOM_LEFTMOST
    HS_FLAG_COMBINATION
    HS_FLAG_QUIET

    HS_MODE_BLOCK
    HS_MODE_NOSTREAM
    HS_MODE_STREAM
    HS_MODE_VECTORED

    HS_MODE_SOM_HORIZON_LARGE
    HS_MODE_SOM_HORIZON_MEDIUM
    HS_MODE_SOM_HORIZON_SMALL
);

WriteConstants(
    PROXYSUBS => {autoload => 1},
    NAME => 'Hyperscan',
    NAMES => \@names,
);

use ExtUtils::PkgConfig;

my %pkg_info = ExtUtils::PkgConfig->find('libhs');
use 5.006;
use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Perl bindings to the Intel hyperscan regular expression library",
  "AUTHOR" => "Mark Sikora <marknsikora\@gmail.com>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::Constant" => 0,
    "ExtUtils::MakeMaker" => 0,
    "ExtUtils::PkgConfig" => 0
  },
  "DISTNAME" => "Hyperscan",
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.006",
  "NAME" => "Hyperscan",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter" => 0,
    "XSLoader" => 0,
    "re" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => 0,
    "Test::Most" => 0
  },
  "VERSION" => "0.04",
  "test" => {
    "TESTS" => "t/*.t"
  }
);
$WriteMakefileArgs{CCFLAGS} = $pkg_info{cflags};
$WriteMakefileArgs{LIBS}    = $pkg_info{libs};

my %FallbackPrereqs = (
  "Carp" => 0,
  "Exporter" => 0,
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "Test::More" => 0,
  "Test::Most" => 0,
  "XSLoader" => 0,
  "re" => 0,
  "strict" => 0,
  "warnings" => 0
);

unless ( eval { ExtUtils::MakeMaker->VERSION('6.63_03') } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
