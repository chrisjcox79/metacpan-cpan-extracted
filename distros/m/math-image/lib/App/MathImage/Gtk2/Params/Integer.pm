# Copyright 2011, 2012, 2013 Kevin Ryde

# This file is part of Math-Image.
#
# Math-Image is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 3, or (at your option) any later
# version.
#
# Math-Image is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License along
# with Math-Image.  If not, see <http://www.gnu.org/licenses/>.


package App::MathImage::Gtk2::Params::Integer;
use 5.008;
use strict;
use warnings;
use List::Util 'min', 'max';
use POSIX ();
use Glib;
use Gtk2;
use Glib::Ex::ObjectBits 'set_property_maybe';

# uncomment this to run the ### lines
#use Devel::Comments;

our $VERSION = 110;

use Gtk2::Ex::ToolItem::OverflowToDialog 41; # v.41 fix overflow-mnemonic
use Glib::Object::Subclass
  'Gtk2::Ex::ToolItem::OverflowToDialog',
  properties => [ Glib::ParamSpec->int
                  ('parameter-value',
                   'Parameter Value',
                   'Blurb.',
                   POSIX::INT_MIN(), POSIX::INT_MAX(),
                   0,
                   Glib::G_PARAM_READWRITE),

                  Glib::ParamSpec->scalar
                  ('parameter-info',
                   'Parameter Info',
                   'Blurb.',
                   Glib::G_PARAM_READWRITE),
                ];

sub INIT_INSTANCE {
  my ($self) = @_;

  my $adj = $self->{'adjustment'}
    = Gtk2::Adjustment->new  (0,    # value
                              0,    # lower
                              0,    # upper
                              1,10, # step,page increment
                              0);   # page_size
  Scalar::Util::weaken (my $weak_self = $self);
  $adj->signal_connect
    ('notify::value' => \&_do_adj_value, \$weak_self);

  my $spin = Gtk2::SpinButton->new ($adj, 10, 0);
  $spin->set (xalign => 1);
  $spin->show;
  $self->add ($spin);
}

sub GET_PROPERTY {
  my ($self, $pspec) = @_;
  my $pname = $pspec->get_name;
  if ($pname eq 'parameter_value') {
    return $self->{'adjustment'}->value;
  } else {
    return $self->{$pname};
  }
}
sub SET_PROPERTY {
  my ($self, $pspec, $newval) = @_;
  my $pname = $pspec->get_name;
  if ($pname eq 'parameter_value') {
    return $self->{'adjustment'}->set_value ($newval);
  } else {
    my $oldval = $self->{$pname};
    $self->{$pname} = $newval;
    ### $newval

    my $minimum = $newval->{'minimum'};
    if (! defined $minimum) { $minimum = POSIX::INT_MIN; }
    my $maximum = $newval->{'maximum'};
    if (! defined $maximum) { $maximum = POSIX::INT_MAX; }
    my $adj = $self->{'adjustment'};
    $adj->set (lower => $minimum,
               upper => $maximum);
    my $value = $adj->value;
    if (! $oldval) {
      $value = (defined $newval->{'default'}
                ? $newval->{'default'}
                : max (0, $minimum));
    }
    $value = max ($minimum, min ($maximum, $value));
    ### $value
    $adj->set_value ($value);

    if (my $spin = $self->get('child-widget')) {
      $spin->set (width_chars => ($newval->{'width'} || -1));
    }

    my $display = ($newval->{'display'} || $newval->{'name'});
    $self->set (overflow_mnemonic =>
                Gtk2::Ex::MenuBits::mnemonic_escape($display));
  }
}

sub _do_adj_value {
  my ($adj, $pspec, $ref_weak_self) = @_;
  my $self = $$ref_weak_self || return;
  $self->notify ('parameter-value');
}

1;
__END__
