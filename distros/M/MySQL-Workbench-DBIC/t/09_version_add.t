#!/usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 10;
use FindBin ();

BEGIN {
	use_ok( 'MySQL::Workbench::DBIC' );
}

#use MySQL::Workbench::DBIC::FakeDBIC;

my $bin         = $FindBin::Bin;
my $file        = $bin . '/test.mwb';
my $namespace   = 'MyApp::DB';
my $output_path = $bin . '/Test' . $$;

my $foo = MySQL::Workbench::DBIC->new(
    file        => $file,
    output_path => $output_path,
    namespace   => $namespace,
    version_add => 2,
);

isa_ok( $foo, 'MySQL::Workbench::DBIC', 'object is type M::W::D' );

if( -e $output_path ){
    rmtree( $output_path );
}

$foo->create_schema;

(my $path = $namespace) =~ s!::!/!;

my $subpath = $output_path . '/' . $path;
ok( -e $subpath , 'Path ' . $subpath . ' created' );
ok( -e $subpath . '/DBIC_Schema.pm', 'Schema' );
ok( -e $subpath . '/DBIC_Schema/Result/Gefa_User.pm', 'Gefa_User' );
ok( -e $subpath . '/DBIC_Schema/Result/UserRole.pm', 'UserRole' );
ok( -e $subpath . '/DBIC_Schema/Result/Role.pm', 'Role' );

my $version;
eval {
    eval "use lib '$output_path'";
    require MyApp::DB::DBIC_Schema;
    $version = MyApp::DB::DBIC_Schema->VERSION;
} or diag $@;
is $version, 2, 'check version';

$foo->create_schema;
eval{
    delete $INC{"MyApp/DB/DBIC_Schema.pm"};
    require MyApp::DB::DBIC_Schema;
    $version = MyApp::DB::DBIC_Schema->VERSION;
} or diag $@;
is $version, 4, 'check version 4';

$foo->create_schema;
eval{
    delete $INC{"MyApp/DB/DBIC_Schema.pm"};
    require MyApp::DB::DBIC_Schema;
    $version = MyApp::DB::DBIC_Schema->VERSION;
} or diag $@;
is $version, 6, 'check version 6';

eval{
    rmtree( $output_path );
    rmdir $output_path;
};

sub rmtree{
    my ($path) = @_;
    opendir my $dir, $path or die $!;
    while( my $entry = readdir $dir ){
        next if $entry =~ /^\.?\.$/;
        my $file = File::Spec->catfile( $path, $entry );
        if( -d $file ){
            rmtree( $file );
            rmdir $file;
        }
        else{
            unlink $file;
        }
    }
    closedir $dir;
}

