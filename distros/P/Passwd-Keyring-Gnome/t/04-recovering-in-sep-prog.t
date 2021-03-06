#!perl -T

use strict;
use warnings;
use Test::More;

if($ENV{DESKTOP_SESSION}
   || $ENV{DBUS_SESSION_BUS_ADDRESS}
   || $ENV{GNOME_KEYRING_CONTROL}) {
    plan tests => 13;
} else {
    plan skip_all => "Keyring not available (not running under Gnome?), skipping tests";
}

use Passwd::Keyring::Gnome;

my $SOME_REALM = 'my@@realm';
my $OTHER_REALM = 'other realm';

my $ring = Passwd::Keyring::Gnome->new(app=>"Passwd::Keyring::Gnome", group=>"Unit tests");

ok( defined($ring) && ref $ring eq 'Passwd::Keyring::Gnome',   'new() works' );

ok( ! defined($ring->get_password("Paul", $SOME_REALM)), "no phantom");

ok( $ring->get_password("Gregory", $SOME_REALM) eq 'secret-Greg', "get in new prog works");

ok( $ring->get_password("Paul", $OTHER_REALM) eq 'secret-Paul2', "get in new prog works");

ok( $ring->get_password("Duke", $SOME_REALM) eq 'secret-Duke', "get in new prog works");

ok( $ring->clear_password("Gregory", $SOME_REALM) eq 1, "clear clears");

ok( ! defined($ring->get_password("Gregory", $SOME_REALM)), "clear cleared");

ok( $ring->get_password("Paul", $OTHER_REALM) eq 'secret-Paul2', "get works");

ok( $ring->get_password("Duke", $SOME_REALM) eq 'secret-Duke', "get works");

ok( $ring->clear_password("Paul", $OTHER_REALM) eq 1, "clear clears");

ok( $ring->clear_password("Duke", $SOME_REALM) eq 1, "clear clears");

ok( ! defined($ring->get_password("Paul", $SOME_REALM)), "clear cleared");
ok( ! defined($ring->get_password("Duke", $SOME_REALM)), "clear cleared");



