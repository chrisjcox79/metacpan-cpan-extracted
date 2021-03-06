
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    print qq{1..0 # SKIP these tests are for testing by the author\n};
    exit
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.15

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/Perl/Critic/Policy/Variables/ProhibitLoopOnHash.pm',
    't/00-report-prereqs.dd',
    't/00-report-prereqs.t',
    't/Variables/ProhibitLoopOnHash.run',
    't/author-no-tabs.t',
    't/author-pod-syntax.t',
    't/policies.t'
);

notabs_ok($_) foreach @files;
done_testing;
