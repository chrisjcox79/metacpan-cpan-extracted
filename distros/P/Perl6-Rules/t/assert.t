use Perl6::Rules;
use Test::Simple 'no_plan';

ok( '1' =~ m/ (\d) <($1 < 5)> /, "1 < 5" );
ok( '5' !~ m/ (\d) <($^N < 5)> /, "5 !< 5" );

ok( 'x254' =~ m/x (\d+): <($^N < 255)> /, "254 < 255" );
ok( 'x255' !~ m/x (\d+): <($^N < 255)> /, "255 !< 255" );
