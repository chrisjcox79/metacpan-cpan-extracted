#!perl

use strict;
use warnings;

use FindBin;
use lib $FindBin::Bin;

BEGIN { require 'test-helper-s3-request.pl' }

plan tests => 2;

behaves_like_net_amazon_s3_request 'delete bucket' => (
	request_class   => 'Net::Amazon::S3::Operation::Bucket::Delete::Request',
	with_bucket     => 'some-bucket',

	expect_request_method   => 'DELETE',
	expect_request_uri      => 'https://some-bucket.s3.amazonaws.com/',
	expect_request_headers  => { },
	expect_request_content  => '',
);

had_no_warnings;
