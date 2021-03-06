package Datahub::Factory::Exporter::Arthub;

use Datahub::Factory::Sane;

our $VERSION = '1.02';

use Lido::XML;
use Moo;
use Catmandu;
use namespace::clean;
use Catmandu::BadVal;

with 'Datahub::Factory::Exporter';

has datahub_url         => (is => 'ro', required => 1);
has datahub_format      => (is => 'ro', default => sub { return 'LIDO'; });
has oauth_client_id     => (is => 'ro', required => 1);
has oauth_client_secret => (is => 'ro', required => 1);
has oauth_username      => (is => 'ro', required => 1);
has oauth_password      => (is => 'ro', required => 1);
has lido         => (is => 'lazy');

sub _build_out {
    my $self = shift;
    my $store = Catmandu->store(
        'Datahub',
        url           => $self->datahub_url,
        client_id     => $self->oauth_client_id,
        client_secret => $self->oauth_client_secret,
        username      => $self->oauth_username,
        password      => $self->oauth_password
    );
    return $store;
}

sub add {
    my ($self, $item) = @_;

    # Fall back system to determine the ID.
    #  - If multiple LidoRecID's are present, use the 'preferred' one if this exists.
    #  - If no preferred id's are defined, use the first one we'll encounter.
    #  - If there's only one LidoRecID, use that one regardless of it's type.
    my $id;
    if (!exists($item->{'lidoRecID'})) {
        Catmandu::BadVal->throw('No LidoRecID element found in document.');
    }

    if (scalar($item->{'lidoRecID'}) > 1) {
        my @matches = grep { 'preferred' eq $_->{pref} } @{ $item->{'lidoRecID'} };
        if (@matches) {
            my $lidoRecID = pop @matches;
            $id = $lidoRecID->{'_'};
        } else {
            $id = $item->{'lidoRecID'}->[0]->{'_'};
        }
    } else {
        $id = $item->{'lidoRecID'}->[0]->{'_'};
    }

    my $data = {
        'id' => $id,
        '_'  => $self->lido->to_xml($item)
    };

    $self->out->bag->add($data);
}

sub _build_lido {
    my $self = shift;
    return Lido::XML->new();
}

1;

__END__

=encoding utf-8

=head1 NAME

Datahub::Factory::Exporter::Datahub - Export items to a Datahub instance

=head1 SYNOPSIS

    use Datahub::Factory;

    my $datahub_options = {
        datahub_url         => 'https://www.datahub.be',
        oauth_client_id     => 'mydatahub',
        oauth_client_secret => 'thedatahub',
        oauth_username      => 'datahub',
        oauth_password      => 'adatahub'
    };

    my $exporter = Datahub::Factory->exporter('Datahub')->new($datahub_options);

    $exporter->add({'id' => 1});

=head1 DESCRIPTION

This module converts records to an exchange format and exports them
to a L<Datahub instance|https://github.com/thedatahub/Datahub>.

=head1 PARAMETERS

=over

=item C<datahub_url>

URL where the Datahub resides. This URL is the base URL of the datahub, not
the API url. The module will create the correct API URL automatically. Required.

=item C<datahub_format>

Data will be converted to this format before exporting. Set to C<LIDO> by default.

=item C<oauth_client_id>

OAuth 2 client ID. Required.

=item C<oauth_client_secret>

OAuth2 client secret. Required.

=item C<oauth_username>

Datahub username. Required.

=item C<oauth_password>

Datahub password. Required.

=back

=head1 AUTHORS

Pieter De Praetere <pieter@packed.be>
Matthias Vandermaesen <matthias.vandermaesen@vlaamsekunstcollectie.be>

=head1 COPYRIGHT

Copyright 2017 - PACKED vzw, Vlaamse Kunstcollectie vzw

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the terms of the GPLv3.

=cut
