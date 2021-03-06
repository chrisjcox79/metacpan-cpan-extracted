#! /usr/local/bin/perl -w
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl disamb.t'

#########################
# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;
use Test::More;
BEGIN { plan tests => 13 };
use WordNet::SenseRelate::TargetWord;
use WordNet::SenseRelate::Word;
ok(1);

# Create a hash with the config options
my %wsd_options = (preprocess => [],
                   preprocessconfig => [],
                   context => 'WordNet::SenseRelate::Context::NearestWords',
                   contextconfig => {(windowsize => 4,
                                     contextpos => 'n')},
                   algorithm => 'WordNet::SenseRelate::Algorithm::Local',
                   algorithmconfig => {(measure => 'WordNet::Similarity::res')});

# Initialize the object
my ($wsd, $error) = WordNet::SenseRelate::TargetWord->new(\%wsd_options, 0);
ok($wsd) or diag "Failed to create WordNet::SenseRelate::TargetWord object.";
is($error, undef) or diag $error;

# Create an instance object
my $hashRef = {};             # Creates a reference to an empty hash.
$hashRef->{text} = [];        # Value is an empty array ref.
$hashRef->{words} = [];       # Value is an empty array ref.
$hashRef->{wordobjects} = []; # Value is an empty array ref.
$hashRef->{head} = -1;        # Index into the text array (initialized to -1)
$hashRef->{target} = -1;      # Index into the words & wordobjects arrays (initialized to -1)
$hashRef->{lexelt} = "";      # Lexical element (terminology from Senseval2)
$hashRef->{id} = "";          # Some ID assigned to this instance
$hashRef->{answer} = "";      # Answer key (only required for evaluation)
$hashRef->{targetpos} = "";   # Part-of-speech of the target word (if known).

my @sentence = ("The", "boat", "ran", "aground", "on", "the", "river", "bank");
foreach my $theword (@sentence)
{
  my $wordobj = WordNet::SenseRelate::Word->new($theword);
  ok($wordobj);
  push(@{$hashRef->{wordobjects}}, $wordobj);
  push(@{$hashRef->{words}}, $theword);
}
$hashRef->{target} = 7;        # Index of "bank"
$hashRef->{id} = "Instance1";  # ID can be any string.

$hashRef->{lexelt} = "bank.n";
$hashRef->{answer} = "bank#n#1";
$hashRef->{targetpos} = "n";     # n, v, a or r
$hashRef->{text} = [("The boat ran aground on the river", "bank")];
$hashRef->{head} = 1;   # Index to bank

my ($sense, $err) = $wsd->disambiguate($hashRef);
is($err, undef);
is($sense, "bank#n#6");
