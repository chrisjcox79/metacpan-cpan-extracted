package Dist::Zilla::PluginBundle::Author::Plicease 2.59 {

  use 5.014;
  use Moose;
  use Dist::Zilla;
  use PerlX::Maybe qw( maybe );
  use YAML ();
  use Term::ANSIColor ();
  use Dist::Zilla::Util::CurrentCmd ();
  use Path::Tiny qw( path );
  use File::Glob qw( bsd_glob );
  use Path::Tiny qw( path );

  # ABSTRACT: Dist::Zilla plugin bundle used by Plicease


  with 'Dist::Zilla::Role::PluginBundle::Easy';

  sub mvp_multivalue_args { qw(
    upgrade
    preamble
    diag_preamble
    workflow

    diag
    allow_dirty ) }

  sub _my_add_plugin {
    my($self, @specs) = @_;

    foreach my $spec (map { [@$_] } @specs)
    {
      my $plugin = $spec->[0];
      my %args = ref $spec->[-1] ? %{ pop @$spec } : ();
      $self->add_plugins([@$spec, \%args]);
    }
  };

  sub configure
  {
    my($self) = @_;

    if($INC{"Archive/Tar/Wrapper.pm"})
    {
      # https://github.com/PerlAlien/Alien-Build/issues/228
      # But honestly?    FUCK HP-UX
      die "Somehow Archive::Tar::Wrapper was loaded before the plugin bundle.";
    }
    else
    {
      package
        Archive::Tar::Wrapper;
      *new = sub { die "do not use ATW" };
      $INC{"Archive/Tar/Wrapper.pm"} = __FILE__;
    }

    # undocumented for a reason: sometimes I need to release on
    # a different platform that where I do testing, (eg. MSWin32
    # only modules, where Dist::Zilla is frequently not working
    # right).
    if($self->payload->{non_native_release})
    {
      no warnings 'redefine';
      require Dist::Zilla::Role::BuildPL;
      *Dist::Zilla::Role::BuildPL::build = sub {};
      *Dist::Zilla::Role::BuildPL::test  = sub {};
    }

    foreach my $script (qw( before_build.pl before_release.pl release.pl test.pl after_build.pl after_release.pl ))
    {
      if(-r "inc/run/$script")
      {
        print STDERR Term::ANSIColor::color('bold red') if -t STDERR;
        print STDERR "please rename inc/run/$script to maint/run-$script";
        print STDERR Term::ANSIColor::color('reset') if -t STDERR;
        print STDERR "\n";
      }
    }

    foreach my $prefix (qw( inc/run/ maint/run- ))
    {
      $self->_my_add_plugin(['Run::BeforeBuild'        => { run => "%x ${prefix}before_build.pl     --name %n --version %v" }])
        if -r "${prefix}before_build.pl";

      $self->_my_add_plugin(['Run::BeforeRelease'      => { run => "%x ${prefix}before_release.pl   ---name %n --version %v --dir %d --archive %a" }])
        if -r "${prefix}before_release.pl";

      $self->_my_add_plugin(['Run::Release'            => { run => "%x ${prefix}release.pl          ---name %n --version %v --dir %d --archive %a" }])
        if -r "${prefix}release.pl";

      $self->_my_add_plugin(['Run::Test'               => { run => "%x ${prefix}test.pl             ---name %n --version %v --dir %d" }])
        if -r "${prefix}test.pl";
    }

    $self->_my_add_plugin(
      ['GatherDir' => { exclude_filename => [qw( Makefile.PL Build.PL xt/release/changes.t xt/release/fixme.t )],
                        exclude_match => '^_build/' }, ],
      [ PruneCruft => { except => '.travis.yml' } ],
      [ 'ManifestSkip' ],
      [ 'MetaYAML',    ],
      [ 'License',     ],
      [ 'ExecDir',     ],
      [ 'ShareDir',    ],
    );

    do { # installer stuff
      my $installer = $self->payload->{installer};
      my %mb = map { $_ => $self->payload->{$_} } grep /^mb_/, keys %{ $self->payload };
      if(-e "inc/My/ModuleBuild.pm")
      {
        print STDERR Term::ANSIColor::color('bold red') if -t STDERR;
        print STDERR "please migrate off of Module::Build";
        print STDERR Term::ANSIColor::color('reset') if -t STDERR;
        print STDERR "\n";

        $installer ||= 'ModuleBuild';
        $mb{mb_class} = 'My::ModuleBuild'
          unless defined $mb{mb_class};
      }
      if(defined $installer && $installer eq 'Alien')
      {
        die "[Alien] no longer supported as an installer";
      }
      elsif(defined $installer && $installer eq 'ModuleBuild')
      {
        print STDERR Term::ANSIColor::color('bold red') if -t STDERR;
        print STDERR "please migrate off of Module::Build";
        print STDERR Term::ANSIColor::color('reset') if -t STDERR;
        print STDERR "\n";

        $self->_my_add_plugin([ ModuleBuild => \%mb ]);
      }
      else
      {
        $installer ||= 'Author::Plicease::MakeMaker';
        $self->_my_add_plugin([$installer]);
      }
    };

    $self->_my_add_plugin(map { [$_] } qw(
      Manifest
      TestRelease
      PodWeaver
    ));

    $self->_my_add_plugin([ NextRelease => { format => '%-9v %{yyyy-MM-dd HH:mm:ss Z}d' }]);

    $self->_my_add_plugin(['AutoPrereqs']);
    $self->_my_add_plugin([$self->payload->{version_plugin} || (
      'OurPkgVersion', {
        underscore_eval_version => $self->{payload}->{underscore_eval_version} // 1,
        no_critic => 1,
      }
    )]);
    $self->_my_add_plugin(['MetaJSON']);

    if($^O ne 'MSWin32' && !$ENV{PLICEASE_DZIL_NO_GIT})
    {
      foreach my $plugin (qw( Git::Check Git::Commit Git::Tag Git::Push ))
      {
        my %args;
        $args{'allow_dirty'} = [ qw( dist.ini Changes README.md ), @{ $self->payload->{allow_dirty} || [] } ]
          if $plugin =~ /^Git::(Check|Commit)$/;
        $self->_my_add_plugin([$plugin, \%args])
      }
    }

    do {
      my $name = path(".")->absolute->basename;
      my $user = $self->payload->{github_user} || 'plicease';
      my $repo = $self->payload->{github_repo} || $name;

      $self->_my_add_plugin([
        'MetaResources' => {
          'homepage' => $self->payload->{homepage}                 || "https://metacpan.org/pod/@{[ do { my $foo = $name; $foo =~ s/-/::/g; $foo }]}",
          'bugtracker.web'  => $self->payload->{'bugtracker.web'}  || sprintf("https://github.com/%s/%s/issues", $user, $repo),
          'repository.url'  => $self->payload->{'repository.web'}  || sprintf("git://github.com/%s/%s.git",      $user, $repo),
          'repository.web'  => $self->payload->{'repository.web'}  || sprintf("https://github.com/%s/%s",        $user, $repo),
          'repository.type' => $self->payload->{'repository.type'} || 'git',
          maybe 'x_IRC' => $self->payload->{irc},
        },
      ]);
    };

    if($self->payload->{release_tests})
    {
      $self->_my_add_plugin([
        'Author::Plicease::Tests' => {
          maybe skip          => $self->payload->{release_tests_skip},
          maybe diag          => $self->payload->{diag},
          maybe diag_preamble => $self->payload->{diag_preamble},
          maybe test2_v0      => $self->payload->{test2_v0},
        }
      ]);
    }

    $self->_my_add_plugin(map { [$_] } qw(

      InstallGuide
      ConfirmRelease

    ));

    $self->_my_add_plugin([
      MinimumPerl => {
        maybe perl => $self->payload->{perl},
      },
    ]);

    unless($self->payload->{no_readme})
    {
      $self->_my_add_plugin([
        'Author::Plicease::ReadmeAnyFromPod' => {
                type              => 'text',
                filename          => 'README',
                location          => 'build',
          maybe source_filename   => $self->payload->{readme_from},
          maybe default_branch    => $self->payload->{default_branch},
        },
      ]);

      $self->_my_add_plugin([
        'Author::Plicease::ReadmeAnyFromPod' => ReadMePodInRoot => {
                type              => 'gfm',
                filename          => 'README.md',
                location          => 'root',
          maybe source_filename   => $self->payload->{readme_from},
          maybe default_branch    => $self->payload->{default_branch},

          # these are for my ReadmeAnyFromPod wrapper.
                travis_status     => int(defined $self->payload->{travis_status} ? $self->payload->{travis_status} : 0),
          maybe appveyor          => $self->payload->{appveyor},
          maybe travis_user       => $self->payload->{travis_user} // $self->payload->{github_user},
          maybe travis_com        => $self->payload->{travis_com},
          maybe travis_base       => $self->payload->{travis_base},
          maybe travis_image_base => $self->payload->{travis_image_base},
          maybe appveyor_user     => $self->payload->{appveyor_user},
          maybe cirrus_user       => $self->payload->{cirrus_user},
          maybe github_user       => $self->payload->{github_user},
          maybe workflow          => $self->payload->{workflow},
       },
     ]);
    }

    $self->_my_add_plugin([
      'Author::Plicease::SpecialPrereqs' => {
        maybe upgrade  => $self->payload->{upgrade},
        maybe preamble => $self->payload->{preamble},
      },
    ]);

    if($self->payload->{copy_mb})
    {
      $self->_my_add_plugin([
        'CopyFilesFromBuild' => {
          copy => [ 'Build.PL' ],
        },
      ]);
    }

    if($self->payload->{copy_mm})
    {
      $self->_my_add_plugin([
        'CopyFilesFromBuild' => {
          copy => [ 'Makefile.PL' ],
        },
      ]);
    }

    foreach my $test (map { path($_) } bsd_glob ('t/*.t'))
    {
      my @lines = grep !/-no_srand => 1/, grep /use Test2::V0/, $test->lines_utf8;
      next unless @lines;
      print STDERR Term::ANSIColor::color('bold red') if -t STDERR;
      print STDERR "$test has Test2::V0 without -no_srand";
      print STDERR Term::ANSIColor::color('reset') if -t STDERR;
      print STDERR "\n";
    }

    $self->_my_add_plugin(
      [ 'Author::Plicease::NoUnsafeInc' ],
    );

    foreach my $prefix (qw( inc/run/ maint/run- ))
    {
      $self->_my_add_plugin(['Run::AfterBuild'         => { run => "%x ${prefix}after_build.pl      --name %n --version %v --dir %d" }])
        if -r "${prefix}after_build.pl";

      $self->_my_add_plugin(['Run::AfterRelease'       => { run => "%x ${prefix}after_release.pl    --name %n --version %v --dir %d --archive %a" }])
        if -r "${prefix}after_release.pl";

    }

  }

  __PACKAGE__->meta->make_immutable;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::PluginBundle::Author::Plicease - Dist::Zilla plugin bundle used by Plicease

=head1 VERSION

version 2.59

=head1 SYNOPSIS

In your dist.ini:

 [@Author::Plicease]

=head1 DESCRIPTION

This is a L<Dist::Zilla> plugin bundle is a set of my personal preferences.
You are probably reading this documentation not out of choice, but because
you have to.  Sorry.

=over 4

=item Taking over one of my modules?

This dist comes with a script in C<example/unbundle.pl>, which will extract
the C<@Author::Plicease> portion of the dist.ini configuration so that you
can edit it and make your own.  I strongly encourage you to do this, as it
will help you remove the preferences from the essential items.

Alternatively, you can use the L<dzil bakeini|Dist::Zilla::App::Command::bakeini>
command to convert a distribution using this (or any) bundle to an
unbundled version.

=item Want to submit a patch for one of my modules?

Consider using C<prove -l> on the test suite or adding the lib directory
to C<PERL5LIB>.  Save yourself the hassle of dealing with L<Dist::Zilla>
at all.  If there is something wrong with one of the generated files
(such as C<Makefile.PL> or C<Build.PL>) consider opening a support
ticket instead.  Most other activities relating to the use of
L<Dist::Zilla> have to do with release testing and uploading to CPAN
which is more my responsibility than yours.

=item Really need to fix some aspect of the build process?

Or perhaps the module in question is using XS (hint: convert it to FFI
instead!).  If you really do need to fix some aspect of the build process
then you probably do need to install L<Dist::Zilla> and this bundle.
If you are having trouble figuring out how it works, then try extracting
the bundle using the C<example/unbundle.pl> script or
L<dzil bakeini technique|Dist::Zilla::App::Command::bakeini>
mentioned above.

=back

I've only uploaded this to CPAN to assist others who may be working on
one of my dists.  I don't expect anyone to use it for their own projects.

This plugin bundle is mostly equivalent to

 [GatherDir]
 exclude_filename = Makefile.PL
 exclude_filename = Build.PL
 exclude_filename = xt/release/changes.t
 exclude_filename = xt/release/fixme.t
 exclude_match = ^_build/
 
 [PruneCruft]
 except = .travis.yml
 
 [ManifestSkip]
 [MetaYAML]
 [License]
 [ExecDir]
 [ShareDir]
 [Author::Plicease::MakeMaker]
 [Manifest]
 [TestRelease]
 [PodWeaver]
 
 [NextRelease]
 format = %-9v %{yyyy-MM-dd HH:mm:ss Z}d
 
 [AutoPrereqs]
 
 [OurPkgVersion]
 no_critic = 1
 underscore_eval_version = 1
 
 [MetaJSON]
 
 [Git::Check]
 allow_dirty = dist.ini
 allow_dirty = Changes
 allow_dirty = README.md
 
 [Git::Commit]
 allow_dirty = dist.ini
 allow_dirty = Changes
 allow_dirty = README.md
 
 [Git::Tag]
 [Git::Push]
 
 [MetaResources]
 bugtracker.web = https://github.com/plicease/My-Dist/issues
 homepage = https://metacpan.org/pod/My::Dist
 repository.type = git
 repository.url = git://github.com/plicease/My-Dist.git
 repository.web = https://github.com/plicease/My-Dist
 
 [InstallGuide]
 [ConfirmRelease]
 [MinimumPerl]
 
 [Author::Plicease::ReadmeAnyFromPod]
 filename = README
 location = build
 type = text
 
 [Author::Plicease::ReadmeAnyFromPod / ReadMePodInRoot]
 filename = README.md
 location = root
 travis_status = 0
 type = gfm
 
 [Author::Plicease::SpecialPrereqs]
 [Author::Plicease::NoUnsafeInc]

Some exceptions:

=over 4

=item MSWin32

Installing L<Dist::Zilla::Plugin::Git::*> on MSWin32 is a pain
so it is also not a prereq on that platform, isn't used and as a result
releasing from MSWin32 is not allowed.

=back

=head1 OPTIONS

=head2 installer

Specify an alternative to L<[MakeMaker]|Dist::Zilla::Plugin::MakeMaker>
(L<[ModuleBuild]|Dist::Zilla::Plugin::ModuleBuild>,
L<[ModuleBuildTiny]|Dist::Zilla::Plugin::ModuleBuildTiny>, or
L<[ModuleBuildDatabase]|Dist::Zilla::Plugin::ModuleBuildDatabase> for example).

If installer is L<ModuleBuild|Dist::Zilla::Plugin::ModuleBuild>, then any
options with the mb_ prefix will be passed to L<ModuleBuild|Dist::Zilla::Plugin::ModuleBuild>
(including the mb_ prefix).

If you have a C<inc/My/ModuleBuild.pm> file in your dist, then this plugin bundle
will assume C<installer> is C<ModuleBuild> and C<mb_class> = C<My::ModuleBuild>.

=head2 readme_from

Which file to pull from for the Readme (must be POD format).  If not
specified, then the main module will be used.

=head2 release_tests

If set to true, then include release tests when building.

=head2 release_tests_skip

Passed into the L<Author::Plicease::Tests|Dist::Zilla::Plugin::Author::Plicease::Tests>
if C<release_tests> is true.

=head2 travis_status

if set to true, then include a link to the travis build page in the readme.

=head2 travis_com

If set to true use travis-ci.com instead of travis-ci.org.

=head2 travis_base

Base URL for travis-ci.

=head2 travis_image_base

Base URL for the travis-ci status button.

=head2 appveyor

if set to a appveyor id, then include a link to the appveyor build page in the readme.

=head2 mb_class

if builder = ModuleBuild, this is the mb_class passed into the [ModuleBuild]
plugin.

=head2 github_repo

Set the GitHub repo name to something other than the dist name.

=head2 github_user

Set the GitHub user name.

=head2 travis_user

Set the travis user name (defaults to github_user).

=head2 appveyor_user

Set the appveyor username (defaults to plicease).

=head2 cirrus_user

Set the cirrus-ci user (defaults to same as travis_user, which itself defaults to plicease).

=head2 copy_mb

Copy Build.PL from the build into the git repository.
Exclude them from gather.

This allows other developers to use the dist from the git checkout, without needing
to install L<Dist::Zilla> and L<Dist::Zilla::PluginBundle::Author::Plicease>.

=head2 copy_mm

Same as C<copy_mb> but for EUMM.

=head2 allow_dirty

Additional dirty allowed file passed to @Git.

=head2 irc

IRC discussion URL for x_IRC meta (maybe changed to non x_ meta if/when IRC
becomes formally supported).

=head2 version_plugin

Specify an alternative to OurPkgVersion for updating the versions in .pm files.

=head2 perl

Specify a minimum Perl version.  If not specified it will be detected.

=head1 SEE ALSO

=over 4

=item L<Dist::Zilla>

=item L<Dist::Zilla::Plugin::Author::Plicease::SpecialPrereqs>

=item L<Dist::Zilla::Plugin::Author::Plicease::Tests>

=item L<Dist::Zilla::Plugin::Author::Plicease::Thanks>

=item L<Dist::Zilla::Plugin::Author::Plicease::Upload>

=back

=head1 AUTHOR

Graham Ollis <plicease@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012,2013,2014,2015,2016,2017,2018,2019,2020 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
