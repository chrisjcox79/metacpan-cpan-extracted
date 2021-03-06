#!perl

use 5.010;
use strict;
use warnings;

use Test::More tests => 4;
use FindBin '$Bin';
require "$Bin/testlib.pl";
prepare_for_testing();

test_perlmv(["a", "b.txt", "c.mp3"], {extra_opt=>"to-number"}, ["1", "2", "3"], 'to-number');
test_perlmv([qw/a b c d e f g h i j/], {extra_opt=>"to-number"}, [qw/01 02 03 04 05 06 07 08 09 10/], 'autowidth 2');
# autowidth 3
# autowidth 4

end_testing();
