use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

execute

=usage

  my $data = Data::Object::Array->new([1..4]);

  my $func = Data::Object::Array::Func::Any->new(
    arg1 => $data,
    arg2 => sub { $_[0] == 4 }
  );

  my $result = $func->execute;

=description

Executes the function logic and returns the result.

=signature

execute() : Object

=type

method

=cut

# TESTING

use Data::Object::Array;
use Data::Object::Array::Func::Any;

can_ok "Data::Object::Array::Func::Any", "execute";

my $data;
my $func;

$data = Data::Object::Array->new([1..4]);
$func = Data::Object::Array::Func::Any->new(
  arg1 => $data,
  arg2 => sub { $_[0] == 4 }
);

my $result = $func->execute;

is_deeply $result, 1;

ok 1 and done_testing;
