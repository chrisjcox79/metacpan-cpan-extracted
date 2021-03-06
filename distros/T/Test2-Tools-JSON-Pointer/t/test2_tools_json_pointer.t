use utf8;
use Test2::V0 0.000121 -no_srand => 1;
use Test2::Tools::JSON::Pointer;
use Test2::Util::Table ();

sub table { join "\n", Test2::Util::Table::table(@_) }

subtest 'very basic pass' => sub {

  is(
    '{"a":1}',
    json { a => E() },
  );

  is(
    '{"a":1}',
    json { a => 1 },
  );

  is(
    '{"a":1}',
    json '/a' => E(),
  );

  is(
    '{"a":1}',
    json '/a' => 1,
  );

};

subtest 'JSON comapre fail' => sub {

  my $check1 = { a => 2 };

  is(
    intercept {
      is { top => '{"a":1}' },
         { top => json $check1 };
    },
    array {
      event 'Fail' => sub {
        call info => [
          hash {
            field details => table (
              header => [qw( PATH GOT OP CHECK LNs )],
                rows   => [
                ['{top}', '{"a":1}', 'JSON PTR', "$check1", '38' ],
                ['{top} <JSON>->{a}', '1', 'eq', '2'],
              ],
            );
            etc;
          },
        ];
      };
      end;
    },
    'hash fail sans pointer',
  );

  is(
    intercept {
      is { top => '{"a":1}' },
         { top => json('/a' => 2) };
    },
    array {
      event 'Fail' => sub {
        call info => [
          hash {
            field details => table (
              header => [qw( PATH GOT OP CHECK LNs )],
              rows   => [
                ['{top}', '{"a":1}', 'JSON PTR', "/a 2", '63' ],
                ['{top} <JSON /a>', '1', 'eq', '2'],
              ],
            );
          etc;
          },
        ];
      };
      end;
    },
    'hash fail with pointer',
  );

};

subtest 'invalid json' => sub {

  my $check = {};

  eval { JSON::MaybeXS::decode_json('{ invalid json }') };
  my $error = $@;
  $error =~ s/ at \S+ line [0-9]+\.//;
  chomp $error;

  is
    intercept {
      is { top => '{ invalid json }' },
         { top => json $check };
    },
    array {
      event Fail => sub {
        call info => [
          hash {
            field details => table (
              header => [qw( PATH GOT OP CHECK LNs )],
              rows   => [
                [ '{top}', '{ invalid json }', 'JSON PTR', "$check", '99' ],
                [ '{top} <JSON>', "<EXCEPTION: invalid json: $error>", '', 'valid json', '' ],
              ],
            );
            etc;
          },
        ];
      };
      end;
    },
    'invalid JSON',
  ;

};

is
  { top => '{"a":"龍"}' },
  { top => json { a => '龍' } },
  'handle utf-8',
;

done_testing
