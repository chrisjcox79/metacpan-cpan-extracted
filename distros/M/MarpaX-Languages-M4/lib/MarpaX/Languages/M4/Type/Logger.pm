use Moops;

# PODNAME: MarpaX::Languages::M4::Type::Logger

# ABSTRACT: M4 Logger Type

library MarpaX::Languages::M4::Type::Logger declares M4Logger {

    our $VERSION = '0.020'; # VERSION

    our $AUTHORITY = 'cpan:JDDPAUSE'; # AUTHORITY

    declare M4Logger, as ConsumerOf ['MarpaX::Languages::M4::Role::Logger'];
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

MarpaX::Languages::M4::Type::Logger - M4 Logger Type

=head1 VERSION

version 0.020

=head1 AUTHOR

Jean-Damien Durand <jeandamiendurand@free.fr>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Jean-Damien Durand.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
