use strict;
use Test::More tests => 9;
use lib("t/lib");
use Class::DBI::Loader;

my $dbh;
my $database = $ENV{MYSQL_NAME};
my $user     = $ENV{MYSQL_USER};
my $password = $ENV{MYSQL_PASS};

SKIP: {
    eval { require Class::DBI::mysql; };
    skip "Class::DBI::mysql is not installed", 9 if $@;

    skip
'You need to set the MYSQL_NAME, MYSQL_USER and MYSQL_PASS environment variables',
      9
      unless ( $database && $user );

    my $dsn = "dbi:mysql:$database";
    $dbh = DBI->connect(
        $dsn, $user,
        $password,
        {
            RaiseError => 1,
            PrintError => 1
        }
    );

    $dbh->do(<<'SQL');
CREATE TABLE loader_test1 (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dat VARCHAR(32)
)
SQL

    my $sth = $dbh->prepare(<<"SQL");
INSERT INTO loader_test1 (dat) VALUES(?)
SQL
    for my $dat (qw(foo bar baz)) {
        $sth->execute($dat);
        $sth->finish;
    }

    $dbh->do(<<'SQL');
CREATE TABLE loader_test2 (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dat VARCHAR(32)
)
SQL

    $sth = $dbh->prepare(<<"SQL");
INSERT INTO loader_test2 (dat) VALUES(?)
SQL
    for my $dat (qw(aaa bbb ccc ddd)) {
        $sth->execute($dat);
        $sth->finish;
    }
    $sth->finish;

    my $loader = Class::DBI::Loader->new(
        dsn        => $dsn,
        user       => $user,
        password   => $password,
        constraint => '^loader_test.+',
        additional_base_classes => [ qw(LoaderBase) ],
        left_base_classes => [ qw(LoaderLeft) ]
    );
    is( $loader->find_class("loader_test1"), "LoaderTest1" );
    is( $loader->find_class("loader_test2"), "LoaderTest2" );
    my $class1 = $loader->find_class("loader_test1");

    {
        no strict 'refs';
        is(${"${class1}::ISA"}[0], 'LoaderLeft');
    }

    my $obj    = $class1->retrieve(1);
    is( $obj->id,  1 );
    is( $obj->dat, "foo" );
    isa_ok($obj, 'LoaderBase');
    isa_ok($obj, 'LoaderLeft');

    my $class2 = $loader->find_class("loader_test2");
    is( $class2->retrieve_all, 4 );
    my ($obj2) = $class2->search( dat => 'bbb' );
    is( $obj2->id, 2 );
}

END {
    if ($dbh) {
        $dbh->do("DROP TABLE loader_test1");
        $dbh->do("DROP TABLE loader_test2");
        $dbh->disconnect;
    }
}
