package ColorTheme::Test::RandomANSI16;

our $AUTHORITY = 'cpan:PERLANCAR'; # AUTHORITY
our $DATE = '2020-06-13'; # DATE
our $DIST = 'ColorThemes-Test'; # DIST
our $VERSION = '0.003'; # VERSION

use strict;
use warnings;
use parent 'ColorThemeBase::Base';

our %THEME = (
    v => 2,
    summary => 'A color theme which gives random 16-color ANSI codes',
    dynamic => 1,
    args => {
        cache => {
            schema => 'bool*',
            default => 1,
        },
        # TODO: whether to set random foreground color or not (default 1)
        # TODO: whether to set random background color or not (default 0)
    },
);

sub _rand_ansi16 {
    +{ansi_fg=>"\e[".(30+int(rand()*8)).(rand() > 0.5 ? ";1":"")."m"};
}

sub list_items {
    my $self = shift;

    my @list = [];
    wantarray ? @list : \@list;
}

sub get_item_color {
    my ($self, $name, $args) = @_;
    if ($self->{args}{cache}) {
        return $self->{_cache}{$name} if defined $self->{_cache}{$name};
        $self->{_cache}{$name} = _rand_ansi16();
    } else {
        _rand_ansi16();
    }
}

1;
# ABSTRACT: A color theme which gives random 16-color ANSI codes

__END__

=pod

=encoding UTF-8

=head1 NAME

ColorTheme::Test::RandomANSI16 - A color theme which gives random 16-color ANSI codes

=head1 VERSION

This document describes version 0.003 of ColorTheme::Test::RandomANSI16 (from Perl distribution ColorThemes-Test), released on 2020-06-13.

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/ColorThemes-Test>.

=head1 SOURCE

Source repository is at L<https://github.com/perlancar/perl-ColorThemes-Test>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=ColorThemes-Test>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

perlancar <perlancar@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2020 by perlancar@cpan.org.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
