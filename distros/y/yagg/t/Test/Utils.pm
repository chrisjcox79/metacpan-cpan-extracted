package Test::Utils;

use strict;
use Exporter;
use Test::More;
use FileHandle;
use File::Temp;
use File::Slurper qw(read_text write_text);

use vars qw( @EXPORT @ISA );

@ISA = qw( Exporter );
@EXPORT = qw( Do_Diff Module_Installed %PROGRAMS $TEMPDIR
  Broken_Pipe No_such_file_or_directory $single_quote $command_separator
  $set_env
);

use vars qw( $TEMPDIR %PROGRAMS $single_quote $command_separator $set_env );

$TEMPDIR = File::Temp::tempdir();

if ($^O eq 'MSWin32')
{
  $set_env = 'set';
  $single_quote = '"';
  $command_separator = '&';
}
else
{
  $set_env = '';
  $single_quote = "'";
  $command_separator = '';
}

%PROGRAMS = (
 'gzip' => '/usr/cs/contrib/bin/gzip',
 'compress' => '/usr/cs/contrib/bin/gzip',
 'bzip' => undef,
 'bzip2' => undef,
);

# ---------------------------------------------------------------------------

sub Do_Diff
{
  my $filename = shift;
  my $output_filename = shift;
  my $exclude_pattern = shift;

  local $Test::Builder::Level = 2;

  $exclude_pattern = '' unless defined $exclude_pattern;

  my @data1 = read_text($filename, undef, 1);
  s/$exclude_pattern//g foreach @data1;
  @data1 = grep { $_ ne '' } @data1;

  my @data2 = read_text($output_filename, undef, 1);

  is_deeply(\@data1,\@data2,"$filename compared to $output_filename");
}

# ---------------------------------------------------------------------------

sub Module_Installed
{
  my $module_name = shift;

  $module_name =~ s#::#/#g;
  $module_name .= '.pm';

  foreach my $inc (@INC)
  {
    return 1 if -e catfile($inc,$module_name);
  }

  return 0;
}

# ---------------------------------------------------------------------------

sub No_such_file_or_directory
{
  my $filename = 0;

  $filename++ while -e $filename;

  local $!;

  my $foo = new FileHandle;
  $foo->open($filename);

  die q{Couldn't determine local text for "No such file or directory"}
    if $! eq '';

  return $!;
}

# ---------------------------------------------------------------------------

# I think this works, but I haven't been able to test it because I can't find
# a system which will report a broken pipe. Also, is there a pure Perl way of
# doing this?
sub Broken_Pipe
{
  my $script_path = catfile($TEMPDIR,'broken_pipe.pl');
  my $dev_null = devnull();

  write_text($script_path, <<EOF, undef, 1);
unless (open B, '-|')
{
  open(F, "|$^X -pe 'print' 2>$dev_null");
  print F 'x';
  close F;
  exit;
}
EOF

  my $result = `$^X $script_path 2>&1 1>$dev_null`;

  $result = '' unless defined $result;

  return $result;
}

# ---------------------------------------------------------------------------

1;
