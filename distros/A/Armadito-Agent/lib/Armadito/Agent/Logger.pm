package Armadito::Agent::Logger;

use strict;
use warnings;
use base qw/Exporter/;

use Readonly;
Readonly my $LOG_DEBUG2  => 5;
Readonly my $LOG_DEBUG   => 4;
Readonly my $LOG_INFO    => 3;
Readonly my $LOG_WARNING => 2;
Readonly my $LOG_ERROR   => 1;
Readonly my $LOG_NONE    => 0;

use English qw(-no_match_vars);
use UNIVERSAL::require;

sub LOG_DEBUG2  { return $LOG_DEBUG2 }
sub LOG_DEBUG   { return $LOG_DEBUG }
sub LOG_INFO    { return $LOG_INFO }
sub LOG_WARNING { return $LOG_WARNING }
sub LOG_ERROR   { return $LOG_ERROR }
sub LOG_NONE    { return $LOG_NONE }

our @EXPORT_OK = qw/LOG_DEBUG2 LOG_DEBUG LOG_INFO LOG_WARNING LOG_ERROR LOG_NONE/;

sub new {
	my ( $class, %params ) = @_;
	my $self = { verbosity => defined $params{verbosity} ? $params{verbosity} : $LOG_INFO };
	bless $self, $class;

	my %backends;
	foreach ( $params{backends} ? @{ $params{backends} } : 'Stderr' ) {
		my $backend = ucfirst($_);
		next if $backends{$backend};
		my $package = "Armadito::Agent::Logger::$backend";
		$package->require();
		if ($EVAL_ERROR) {
			print "Failed to load Logger backend $backend: ($EVAL_ERROR)\n";
			next;
		}

		$backends{$backend} = 1;
		push( @{ $self->{backends} }, $package->new(%params) );

		$self->debug("Logger backend $backend initialised");
	}

	$self->debug($Armadito::Agent::VERSION_STRING);
	return $self;
}

sub _log {
	my ( $self, %params ) = @_;

	# levels: debug2, debug, info, error, fault
	my $level = $params{level} || 'info';
	my $message = $params{message};

	return unless $message;

	chomp($message);

	foreach my $backend ( @{ $self->{backends} } ) {
		$backend->addMessage(
			level   => $level,
			message => $message
		);
	}
}

sub debug2 {
	my ( $self, $message ) = @_;

	return unless $self->{verbosity} >= $LOG_DEBUG2;
	$self->_log( level => 'debug2', message => $message );
}

sub debug {
	my ( $self, $message ) = @_;

	return unless $self->{verbosity} >= $LOG_DEBUG;
	$self->_log( level => 'debug', message => $message );
}

sub debug_result {
	my ( $self, %params ) = @_;

	return unless $self->{verbosity} >= $LOG_DEBUG;

	my $status = $params{status} || ( $params{data} ? 'success' : 'no result' );

	$self->_log(
		level   => 'debug',
		message => sprintf( '- %s: %s', $params{action}, $status )
	);
}

sub info {
	my ( $self, $message ) = @_;

	return unless $self->{verbosity} >= $LOG_INFO;
	$self->_log( level => 'info', message => $message );
}

sub warning {
	my ( $self, $message ) = @_;

	return unless $self->{verbosity} >= $LOG_WARNING;
	$self->_log( level => 'warning', message => $message );
}

sub error {
	my ( $self, $message ) = @_;

	return unless $self->{verbosity} >= $LOG_ERROR;
	$self->_log( level => 'error', message => $message );
}

1;
__END__

=head1 NAME

Armadito::Agent::Logger - Armadito Agent logger

=head1 DESCRIPTION

This is the logger object.

=head1 METHODS

=head2 new(%params)

The constructor. The following parameters are allowed, as keys of the %params
hash:

=over

=item I<config>

the agent configuration object, to be passed to backends

=item I<backends>

a list of backends to use (default: Stderr)

=item I<verbosity>

the verbosity level (default: LOG_INFO)

=back

=head2 debug2($message)

Add a log message with debug2 level.

=head2 debug($message)

Add a log message with debug level.

=head2 info($message)

Add a log message with info level.

=head2 warning($message)

Add a log message with warning level.

=head2 error($message)

Add a log message with error level.

=head2 debug_result(%params)

Add a log message with debug level related to an action result.
