#!/usr/bin/perl -w
#########################################################################
#
# Serz Minus (Sergey Lepenkov), <abalama@cpan.org>
#
# Copyright (C) 1998-2019 D&D Corporation. All Rights Reserved
# 
# This is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.
#
# $Id: 01-use.t 4 2019-05-28 10:57:50Z minus $
#
#########################################################################
use Test::More tests => 1;
use lib qw(inc);
use Test::MPMinus;
BEGIN { use_ok('MPMinusX::AuthSsn') };
1;
