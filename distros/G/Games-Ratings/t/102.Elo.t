use strict;
use warnings;

use Games::Ratings::Chess::FIDE;

use Test::More tests => 3;

## see the following link for the official calculation 
## * http://ratings.fide.com/individual_calculations.phtml?idnumber=4625200&rating_period=2008-10-01
## see the following link for performance calculation:
## * http://www.schachclubkreuzberg.de/Open08_ELO.HTM

my %expected = (
                rating_change   => '13.5',
                performance     => '2304',
                points_expected => '4.6',
               );
my $player = Games::Ratings::Chess::FIDE->new();
$player->set_rating(2221);
$player->set_coefficient(15);
my @opponent_ratings =   (1871,2015,2122,2552,2155,2123,2316,2151);
my @results          = qw(draw win  win  loss draw win  draw win );
foreach my $game ( 0 .. $#results ) {
    $player->add_game( { opponent_rating => $opponent_ratings[$game],
                         result          => $results[$game], });  
}

my %computed;

## test 1: check rating change
$computed{rating_change} = $player->get_rating_change();

## test 2: check performance
$computed{performance} = $player->get_performance();

## test 2: check points expected
$computed{points_expected} = $player->get_points_expected();

## run actual tests for all test_items in %expected
foreach my $test_item ( sort keys %expected ) {
    is( $computed{$test_item}, $expected{$test_item}, 
        "$test_item: $computed{$test_item} -> $expected{$test_item}" );
}


