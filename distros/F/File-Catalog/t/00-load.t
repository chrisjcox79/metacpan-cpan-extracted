#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'File::Catalog' ) || print "Bail out!\n";
}

diag( "Testing File::Catalog $File::Catalog::VERSION, Perl $], $^X" );
