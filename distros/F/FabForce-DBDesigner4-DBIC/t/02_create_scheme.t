#!perl -T

use strict;
use warnings;

use Test::More tests => 7;
use FindBin ();

BEGIN {
	use_ok( 'FabForce::DBDesigner4::DBIC' );
}

my $foo = FabForce::DBDesigner4::DBIC->new;
isa_ok( $foo, 'FabForce::DBDesigner4::DBIC', 'object is type F::D::D' );

my $bin         = $FindBin::Bin;
my $file        = $bin . '/test.xml';
my $namespace   = 'MyApp::DB';
my $output_path = $bin . '/Test';

if( -e $output_path ){
    rmtree( $output_path );
}

$foo->input_file( $file );
$foo->namespace( $namespace );
$foo->output_path( $output_path );
$foo->create_scheme;

(my $path = $namespace) =~ s!::!/!;

my $subpath = $output_path . '/' . $path;
ok( -e $subpath , 'Path created' );
ok( -e $subpath . '/DBIC_Schema.pm' );
ok( -e $subpath . '/DBIC_Schema/Result/Gefa_User.pm' );
ok( -e $subpath . '/DBIC_Schema/Result/UserRole.pm' );
ok( -e $subpath . '/DBIC_Schema/Result/Role.pm' );

eval{
    rmtree( $output_path );
    $output_path = _untaint_path( $output_path );
    rmdir $output_path;
};

sub rmtree{
    my ($path) = @_;
    $path = _untaint_path( $path );
    opendir my $dir, $path or die $!;
    while( my $entry = readdir $dir ){
        next if $entry =~ /^\.?\.$/;
        my $file = File::Spec->catfile( $path, $entry );
        $file = _untaint_path( $file );
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

sub _untaint_path{
    my ($path) = @_;
    ($path) = ( $path =~ /(.*)/ );
    # win32 uses ';' for a path separator, assume others use ':'
    my $sep = ($^O =~ /win32/i) ? ';' : ':';
    # -T disallows relative directories in the PATH
    $path = join $sep, grep !/^\./, split /$sep/, $path;
    return $path;
}
