# automatically generated file, don't edit



# Copyright 2011 David Cantrell, derived from data from libphonenumber
# http://code.google.com/p/libphonenumber/
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
package Number::Phone::StubCountry::SI;
use base qw(Number::Phone::StubCountry);

use strict;
use warnings;
use utf8;
our $VERSION = 1.20201204215957;

my $formatters = [
                {
                  'format' => '$1 $2',
                  'leading_digits' => '
            8[09]|
            9
          ',
                  'national_rule' => '0$1',
                  'pattern' => '(\\d{2})(\\d{3,6})'
                },
                {
                  'format' => '$1 $2',
                  'leading_digits' => '
            59|
            8
          ',
                  'national_rule' => '0$1',
                  'pattern' => '(\\d{3})(\\d{5})'
                },
                {
                  'format' => '$1 $2 $3',
                  'leading_digits' => '
            [37][01]|
            4[0139]|
            51|
            6
          ',
                  'national_rule' => '0$1',
                  'pattern' => '(\\d{2})(\\d{3})(\\d{3})'
                },
                {
                  'format' => '$1 $2 $3 $4',
                  'leading_digits' => '[1-57]',
                  'national_rule' => '(0$1)',
                  'pattern' => '(\\d)(\\d{3})(\\d{2})(\\d{2})'
                }
              ];

my $validators = {
                'fixed_line' => '
          (?:
            [1-357][2-8]|
            4[24-8]
          )\\d{6}
        ',
                'geographic' => '
          (?:
            [1-357][2-8]|
            4[24-8]
          )\\d{6}
        ',
                'mobile' => '
          65(?:
            1\\d|
            55|
            [67]0
          )\\d{4}|
          (?:
            [37][01]|
            4[0139]|
            51|
            6[489]
          )\\d{6}
        ',
                'pager' => '',
                'personal_number' => '',
                'specialrate' => '(
          89[1-3]\\d{2,5}|
          90\\d{4,6}
        )',
                'toll_free' => '80\\d{4,6}',
                'voip' => '
          (?:
            59\\d\\d|
            8(?:
              1(?:
                [67]\\d|
                8[0-489]
              )|
              2(?:
                0\\d|
                2[0-37-9]|
                8[0-2489]
              )|
              3[389]\\d
            )
          )\\d{4}
        '
              };
my %areanames = ();
$areanames{en} = {"38674", "Novo\ Mesto\/Krško",
"38654", "Gorica\/Koper\/Postojna",
"3862", "Maribor\/Ravne\ na\ Koroškem\/Murska\ Sobota",
"38648", "Kranj",
"38634", "Celje\/Trbovlje",
"38647", "Kranj",
"38646", "Kranj",
"38635", "Celje\/Trbovlje",
"38673", "Novo\ Mesto\/Krško",
"38653", "Gorica\/Koper\/Postojna",
"38655", "Gorica\/Koper\/Postojna",
"38675", "Novo\ Mesto\/Krško",
"38642", "Kranj",
"38633", "Celje\/Trbovlje",
"38637", "Celje\/Trbovlje",
"38644", "Kranj",
"38638", "Celje\/Trbovlje",
"38678", "Novo\ Mesto\/Krško",
"38657", "Gorica\/Koper\/Postojna",
"38677", "Novo\ Mesto\/Krško",
"38658", "Gorica\/Koper\/Postojna",
"38632", "Celje\/Trbovlje",
"38676", "Novo\ Mesto\/Krško",
"38656", "Gorica\/Koper\/Postojna",
"3861", "Ljubljana",
"38652", "Gorica\/Koper\/Postojna",
"38645", "Kranj",
"38636", "Celje\/Trbovlje",
"38672", "Novo\ Mesto\/Krško",};

    sub new {
      my $class = shift;
      my $number = shift;
      $number =~ s/(^\+386|\D)//g;
      my $self = bless({ number => $number, formatters => $formatters, validators => $validators, areanames => \%areanames}, $class);
      return $self if ($self->is_valid());
      $number =~ s/^(?:0)//;
      $self = bless({ number => $number, formatters => $formatters, validators => $validators, areanames => \%areanames}, $class);
      return $self->is_valid() ? $self : undef;
    }
1;