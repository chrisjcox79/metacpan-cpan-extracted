use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::PodSpelling 2.007005
use Test::Spelling 0.12;
use Pod::Wordlist;


add_stopwords(<DATA>);
all_pod_files_spelling_ok( qw( bin lib ) );
__DATA__
AlarmClock
CoinFlip
Component
Fortune
IRC
Magic8Ball
POE
Plugin
PluginBundle
SigFail
Thanks
Toys
YouAreDoingItWrong
Znet
Zoffix
cpan
lib
