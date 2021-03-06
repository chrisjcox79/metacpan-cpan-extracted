#!perl

use Test::More;
use Furl::PSGI;

my $requests = 0;

my $app = sub {
  $requests++;
  [200, ['Content-Type' => 'text/plain'], ['Hello World!']]
};

ok my $f = Furl::PSGI->new(app => $app),
  'Created Furl::PSGI';

ok my $res = $f->get('http://foobaz.net/'),
  'Got response';

is $requests, 1,
  'exactly one request handled by app';

is $res->status, '200',
  '200 status';

is $res->body, 'Hello World!',
  'correct body';

ok $f->get('http://foobaz.net')->is_success,
  "repeat requests... $_"
  for 1..5;

is $requests, 6,
  'six requests handled by app now';

subtest "error 404" => sub {
  ok my $res = Furl::PSGI
    ->new(app => sub { [404, ['Content-Type' => 'text/plain'], ['Not found']] })
    ->get('http://foobaz.net/');

  is $res->status, '404',
    '404 status';

  is $res->message, 'Not Found',
    'not found message';
};

subtest "die" => sub {
  ok my $res = Furl::PSGI
    ->new(app => sub { die 'ack' })
    ->get('http://foobaz.net/');

  is $res->status, '500',
    '500 status';
};

done_testing;
