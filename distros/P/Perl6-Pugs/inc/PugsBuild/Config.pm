package PugsBuild::Config;
use strict;
use warnings;
our $VERSION = '0.01';

use File::Copy;

# change these two lines if it turns out we need the real YAML.pm
use PugsBuild::MiniYAML ();
our $YAML = PugsBuild::MiniYAML->new;
our $Conf;

our %DEFAULTS = (
    optimization          => '-O',
    smoke_concurrent      => 1,
    smoke_upload          => '',
    inline_prelude_source => 0,
    precompile_prelude    => 1,
    precompile_modules    => [],
    ghc_heap_size         => '',       # use GHC's default
    install_dir           => '',
);

sub import {
    my($class, $filename) = @_;
    $Conf = $class->read($filename);
}

sub pretty_print {
    # ah yes so THAT's why we wanted YAML.pm.
    join "", map { ref $Conf->{$_} ?
            "\t$_ => [". (join ", ", @{ $Conf->{$_} }) ."]\n" :
            "\t$_ => $Conf->{$_}\n" }
        sort keys %$Conf;
}

sub read {
    my($class, $filename) = @_;
    my $config_default    = 'config.yml';
    my $config_template   = 'util/config-template.yml';
    $filename           ||= $ENV{PUGS_BUILD_CONFIG} || $config_default;
    my $stream;
    
    if (!-e $filename) {
        require File::Copy;
        File::Copy::copy ($config_template, $filename) or
            die "copy: $!";
        print <<".";
*** Default build config file created.
    You can edit some settings in $filename (then rerun Makefile.PL).

.
    }       

    open my $fh, $filename or die "open: $filename: $!";
    { local $/; $stream = <$fh> }
    my $conf = $YAML->load($stream);
    
    if (-M $filename > -M $config_template) {
        print <<".";
*** Build config file '$filename' is older than template
    '$config_template'.  I will merge them in memory, but
    you may wish to check for new settings and edit the old
    config file by hand.

.
        open my $tpl, $config_template or die "open: $config_template: $!";
        my $tpl_stream = do { local $/; <$tpl> };
        my $tpl_config = $YAML->load($stream);
        $conf = { %$tpl_config, %$conf };
    }

    $class->env_override($conf);
    $class->defaults($conf);
    return $conf;
}

sub env_override {
    my($class, $conf) = @_;
    my %env = map { split /=/ } (split /:/, ($ENV{PUGS_BUILD_OPTS} || ''));
    $conf->{$_} = $env{$_} for keys %env;
}

sub defaults {
    my($class, $conf) = @_;
    do { $conf->{$_} = $DEFAULTS{$_} unless defined $conf->{$_}; } for
        keys %DEFAULTS;
}

sub lookup {
    my($class, $what) = @_;
    die "unknown option: $what" unless exists $Conf->{$what};
    my $value = $Conf->{$what};
    return $value;
}

1;
