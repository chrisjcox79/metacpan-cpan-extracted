use strict;
use warnings;
use Test::More;

BEGIN {
  plan skip_all => 'This test is valid only under Win32' if $^O ne 'MSWin32';
}

plan tests => 2;
use Win32::UrlCache::Cache;

ok -f Win32::UrlCache::Cache->_file, Win32::UrlCache::Cache->_file;
ok eval { Win32::UrlCache::Cache->new }, $@;
