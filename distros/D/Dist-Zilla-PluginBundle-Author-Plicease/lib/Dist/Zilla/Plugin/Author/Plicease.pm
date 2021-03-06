package Dist::Zilla::Plugin::Author::Plicease 2.59 {

  use strict;
  use warnings;
  use Path::Tiny ();
  use File::ShareDir::Dist ();

  # ABSTRACT: Dist::Zilla plugins used by Plicease


  sub dist_dir
  {
    my $file = Path::Tiny->new(__FILE__);
    if($file->is_absolute)
    {
      return Path::Tiny->new(
        File::ShareDir::Dist::dist_share('Dist-Zilla-PluginBundle-Author-Plicease')
      );
    }
    else
    {
      my $share = $file
        ->absolute
        ->parent
        ->parent
        ->parent
        ->parent
        ->parent
        ->parent
        ->child('share');
      die "no share $share" unless -d $share;
      return $share;
    }
  }
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease - Dist::Zilla plugins used by Plicease

=head1 VERSION

version 2.59

=head1 DESCRIPTION

The modules in this namespace contain some miscellaneous L<Dist::Zilla>
plugins that I use to customize my personal L<Dist::Zilla> experience.
Most likely you don't want or need to use them.  If you do run into
one of my distributions my L<Dist::Zilla> bundle includes documentation
that may be able to help:

L<Dist::Zilla::PluginBundle::Author::Plicease>

=head1 METHODS

=head2 dist_dir

 my $dir = Dist::Zilla::Plugin::Author::Plicease->dist_dir;

Returns this distributions share directory.

=head1 AUTHOR

Graham Ollis <plicease@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012,2013,2014,2015,2016,2017,2018,2019,2020 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
