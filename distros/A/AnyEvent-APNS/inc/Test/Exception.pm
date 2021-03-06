#line 1
use strict;
use warnings;

package Test::Exception;
use Test::Builder;
use Sub::Uplevel qw( uplevel );
use base qw( Exporter );

our $VERSION = '0.31';
our @EXPORT = qw(dies_ok lives_ok throws_ok lives_and);

my $Tester = Test::Builder->new;

sub import {
    my $self = shift;
    if ( @_ ) {
        my $package = caller;
        $Tester->exported_to( $package );
        $Tester->plan( @_ );
    };
    $self->export_to_level( 1, $self, $_ ) foreach @EXPORT;
}

#line 83

sub _quiet_caller (;$) { ## no critic Prototypes
    my $height = $_[0];
    $height++;

    if ( CORE::caller() eq 'DB' ) {
        # passthrough the @DB::args trick
        package DB;
        if( wantarray ) {
            if ( !@_ ) {
                return (CORE::caller($height))[0..2];
            }
            else {
                # If we got here, we are within a Test::Exception test, and
                # something is producing a stacktrace. In case this is a full
                # trace (i.e. confess() ), we have to make sure that the sub
                # args are not visible. If we do not do this, and the test in
                # question is throws_ok() with a regex, it will end up matching
                # against itself in the args to throws_ok().
                #
                # While it is possible (and maybe wise), to test if we are
                # indeed running under throws_ok (by crawling the stack right
                # up from here), the old behavior of Test::Exception was to
                # simply obliterate @DB::args altogether in _quiet_caller, so
                # we are just preserving the behavior to avoid surprises
                #
                my @frame_info = CORE::caller($height);
                @DB::args = ();
                return @frame_info;
            }
        }

        # fallback if nothing above returns
        return CORE::caller($height);
    }
    else {
        if( wantarray and !@_ ) {
            return (CORE::caller($height))[0..2];
        }
        else {
            return CORE::caller($height);
        }
    }
}

sub _try_as_caller {
    my $coderef = shift;

    # local works here because Sub::Uplevel has already overridden caller
    local *CORE::GLOBAL::caller;
    { no warnings 'redefine'; *CORE::GLOBAL::caller = \&_quiet_caller; }

    eval { uplevel 3, $coderef };
    return $@;
};


sub _is_exception {
    my $exception = shift;
    return ref $exception || $exception ne '';
};


sub _exception_as_string {
    my ( $prefix, $exception ) = @_;
    return "$prefix normal exit" unless _is_exception( $exception );
    my $class = ref $exception;
    $exception = "$class ($exception)" 
            if $class && "$exception" !~ m/^\Q$class/;
    chomp $exception;
    return "$prefix $exception";
};


#line 206


sub throws_ok (&$;$) {
    my ( $coderef, $expecting, $description ) = @_;
    unless (defined $expecting) {
      require Carp;
      Carp::croak( "throws_ok: must pass exception class/object or regex" ); 
    }
    $description = _exception_as_string( "threw", $expecting )
    	unless defined $description;
    my $exception = _try_as_caller( $coderef );
    my $regex = $Tester->maybe_regex( $expecting );
    my $ok = $regex 
        ? ( $exception =~ m/$regex/ ) 
        : eval { 
            $exception->isa( ref $expecting ? ref $expecting : $expecting ) 
        };
    $Tester->ok( $ok, $description );
    unless ( $ok ) {
        $Tester->diag( _exception_as_string( "expecting:", $expecting ) );
        $Tester->diag( _exception_as_string( "found:", $exception ) );
    };
    $@ = $exception;
    return $ok;
};


#line 254

sub dies_ok (&;$) {
    my ( $coderef, $description ) = @_;
    my $exception = _try_as_caller( $coderef );
    my $ok = $Tester->ok( _is_exception($exception), $description );
    $@ = $exception;
    return $ok;
}


#line 293

sub lives_ok (&;$) {
    my ( $coderef, $description ) = @_;
    my $exception = _try_as_caller( $coderef );
    my $ok = $Tester->ok( ! _is_exception( $exception ), $description );
	$Tester->diag( _exception_as_string( "died:", $exception ) ) unless $ok;
    $@ = $exception;
    return $ok;
}


#line 333

sub lives_and (&;$) {
    my ( $test, $description ) = @_;
    {
        local $Test::Builder::Level = $Test::Builder::Level + 1;
        my $ok = \&Test::Builder::ok;
        no warnings;
        local *Test::Builder::ok = sub {
            $_[2] = $description unless defined $_[2];
            $ok->(@_);
        };
        use warnings;
        eval { $test->() } and return 1;
    };
    my $exception = $@;
    if ( _is_exception( $exception ) ) {
        $Tester->ok( 0, $description );
        $Tester->diag( _exception_as_string( "died:", $exception ) );
    };
    $@ = $exception;
    return;
}

#line 502

1;
