
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::EOL 0.18

use Test::More 0.88;
use Test::EOL;

my @files = (
    'lib/Array/LIFO.pm',
    't/00-compile.t',
    't/00-load.t',
    't/01-methods.t',
    't/author-eol.t',
    't/author-no-tabs.t',
    't/release-pod-coverage.t',
    't/release-pod-syntax.t'
);

eol_unix_ok($_, { trailing_whitespace => 1 }) foreach @files;
done_testing;
