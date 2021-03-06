
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "copy MediaWiki page history into a Git repository",
  "AUTHOR" => "Matthew Astley <mca1001\@users.sourceforge.net>",
  "BUILD_REQUIRES" => {
    "English" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-MediaWiki2Git",
  "EXE_FILES" => [
    "bin/mw2git"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::MediaWiki2Git",
  "PREREQ_PM" => {
    "Carp" => 0,
    "File::Slurp" => 0,
    "Git::Repository" => 0,
    "MediaWiki::API" => 0,
    "Moose" => 0,
    "Net::DNS" => 0,
    "Pod::Usage" => 0,
    "YAML" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.003",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



