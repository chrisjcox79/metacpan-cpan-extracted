# copied over from JSON::PC and modified to use Data::AnyXfer::JSON

use Test::More;
use strict;
BEGIN { plan tests => 6 };
use Data::AnyXfer::JSON;
use utf8;

#########################
my ($js,$obj);
my $pc = new Data::AnyXfer::JSON;

$js  = '{"foo":0}';
$obj = $pc->decode($js);
is($obj->{foo}, 0, "normal 0");

$js  = '{"foo":0.1}';
$obj = $pc->decode($js);
is($obj->{foo}, 0.1, "normal 0.1");


$js  = '{"foo":10}';
$obj = $pc->decode($js);
is($obj->{foo}, 10, "normal 10");

$js  = '{"foo":-10}';
$obj = $pc->decode($js);
is($obj->{foo}, -10, "normal -10");


$js  = '{"foo":0, "bar":0.1}';
$obj = $pc->decode($js);
is($obj->{foo},0,  "normal 0");
is($obj->{bar},0.1,"normal 0.1");

