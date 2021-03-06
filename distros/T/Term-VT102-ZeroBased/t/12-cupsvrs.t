#!/usr/bin/perl -w
#
# Test CUPSV and CUPRS.
#
# Copyright (C) Andrew Wood
# NO WARRANTY - see COPYING.
#

require Term::VT102::ZeroBased;
require 't/testbase';

run_tests ([(
#              (F,B,b,f,s,u,F,r)
  [ 5, 3, "\e[41;33mtest\e[s\e[2H\e[42;34mgrok\e[s\e[m\e[3Hfoo\e[u2\e[u1",
    "test1", [ [3,1,0,0,0,0,0,0],
               [3,1,0,0,0,0,0,0],
               [3,1,0,0,0,0,0,0],
               [3,1,0,0,0,0,0,0],
               [7,0,0,0,0,0,0,0] ],
    "grok2", [ [4,2,0,0,0,0,0,0],
               [4,2,0,0,0,0,0,0],
               [4,2,0,0,0,0,0,0],
               [4,2,0,0,0,0,0,0],
               [7,0,0,0,0,0,0,0] ],
    "foo\0\0", [ [7,0,0,0,0,0,0,0],
               [7,0,0,0,0,0,0,0],
               [7,0,0,0,0,0,0,0],
               [7,0,0,0,0,0,0,0],
               [7,0,0,0,0,0,0,0] ],
  ],
)]);

# EOF
