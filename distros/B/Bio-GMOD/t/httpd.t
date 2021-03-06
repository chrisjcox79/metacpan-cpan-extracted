# This is -*-Perl-*- code
# Bio::GMOD Test Harness Script for Modules
# $Id: httpd.t,v 1.2 2005/05/31 22:31:58 todd Exp $

# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.t'

use strict;
use vars qw($NUMTESTS $DEBUG $MODULE $APACHECTL);

use lib '..','.','./blib/lib';

my $error;

BEGIN {
  $MODULE = 'Bio::GMOD::Admin::Monitor::httpd';
  $error = 0;
  # to handle systems with no installed Test module
  # we include the t dir (where a copy of Test.pm is located)
  # as a fallback
  eval { require Test::More; };
  if( $@ ) {
    use lib 't';
  }
  use Test::More;
  
  if (-e 't/do_monitor_httpd.tests') {
    open IN,'t/do_monitor_httpd.tests';
    while (<IN>) {
      chomp;
      $APACHECTL = $_;
    }
    $NUMTESTS = 4;
  } else {
    $NUMTESTS = 1;
  }

  plan tests => $NUMTESTS;

  # Try to use the module
  eval { use_ok($MODULE); };
  if( $@ ) {
    print STDERR "Could not use $MODULE. Skipping tests.\n";
    $error = 1;
  }
}

exit 0 if $error;
exit 1 unless $APACHECTL;

END {
  #    foreach ( $Test::ntest..$NUMTESTS) {
  #      skip('unable to run all of the Bio::GMOD tests',1);
  #    }
}

# Begin tests
my $monitor  = Bio::GMOD::Admin::Monitor::httpd->new();
ok($monitor,'new constructor via Bio::GMOD');

my ($string,$status) = $monitor->check_status(-site=>'http://localhost');
if ($status == 0) {  # If httpd is down, make sure the string indicates that
  like($string,qr/down/,$string);
} else {
  like($string,qr/up/,$string);
}


# Try restarting httpd
# (This should maybe not be a part of the test proper)
my ($string2,$status2) = $monitor->restart(-apachectl => $APACHECTL);
ok($status2,$string2);

TODO: {
  local $TODO = 'build an adequate test of restarting httpd';
  todo_skip($monitor,'restarting httpd');
}
