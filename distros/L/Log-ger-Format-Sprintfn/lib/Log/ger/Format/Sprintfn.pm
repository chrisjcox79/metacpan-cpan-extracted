package Log::ger::Format::Sprintfn;

our $AUTHORITY = 'cpan:PERLANCAR'; # AUTHORITY
our $DATE = '2020-03-11'; # DATE
our $DIST = 'Log-ger-Format-Sprintfn'; # DIST
our $VERSION = '0.004'; # VERSION

use strict;
use warnings;

use Text::sprintfn;

sub meta { +{
    v => 2,
} }

sub get_hooks {
    my %plugin_conf = @_;

    return {
        create_formatter => [
            __PACKAGE__, # key
            50,          # priority
            sub {        # hook
                my %hook_args = @_; # see Log::ger::Manual::Internals/"Arguments passed to hook"

                my $formatter = sub {
                    return $_[0] if @_ < 2;
                    my $fmt = shift;
                    my @args;
                    for my $i (0..$#_) {
                        if ($i == 0 && ref $_[$i] eq 'HASH') {
                            my $orig = $_[$i];
                            my $dumped = {};
                            for my $k (keys %$orig) {
                                my $v = $orig->{$k};
                                # XXX code duplication'ish
                                if (!defined($v)) {
                                    $dumped->{$k} = '<undef>';
                                } elsif (ref $v) {
                                    require Log::ger::Util
                                        unless $Log::ger::_dumper;
                                    $dumped->{$k} = Log::ger::Util::_dump($v);
                                } else {
                                    $dumped->{$k} = $v;
                                }
                            }
                            push @args, $dumped;
                        } elsif (!defined($_[$i])) {
                            push @args, '<undef>';
                        } elsif (ref $_[$i]) {
                            require Log::ger::Util unless $Log::ger::_dumper;
                            push @args, Log::ger::Util::_dump($_[$i]);
                        } else {
                            push @args, $_[$i];
                        }
                    }
                    sprintfn $fmt, @args;
                };
                [$formatter];
            }],
    };
}

1;
# ABSTRACT: Use Text::sprintfn for formatting instead of sprintf

__END__

=pod

=encoding UTF-8

=head1 NAME

Log::ger::Format::Sprintfn - Use Text::sprintfn for formatting instead of sprintf

=head1 VERSION

version 0.004

=head1 SYNOPSIS

 use Log::ger::Format 'Sprintfn';
 use Log::ger;

After that:

 log_debug 'user is %(username)s, details are %(detail)s',
     {username=>"Foo", detail=>{...}};

Note that this only has effect in the importing package.

=head1 DESCRIPTION

=for Pod::Coverage ^(.+)$

=head1 SEE ALSO

L<Log::ger>

L<Text::sprintfn>

=head1 AUTHOR

perlancar <perlancar@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2020, 2017 by perlancar@cpan.org.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
