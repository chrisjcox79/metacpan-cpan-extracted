package Local::CreateWorkspace;

use 5.006;
use strict;
use warnings;

our $VERSION = '0.001';

use Moose;
use namespace::autoclean;

with 'Dist::Zilla::Role::Plugin';

use Path::Tiny;

around plugin_from_config => sub {
    my $orig         = shift @_;
    my $plugin_class = shift @_;

    my $instance = $plugin_class->$orig(@_);

    path( $instance->zilla->root )->child('ws')->mkpath;

    return $instance;
};

__PACKAGE__->meta->make_immutable;

1;

__END__
