package Data::Dump::PHP;
use strict;
use vars qw(@EXPORT @EXPORT_OK $DEBUG);
use subs qq(dump);

our $VERSION = '0.10'; # VERSION

require Exporter;
*import = \&Exporter::import;
@EXPORT = qw(dd_php ddx_php);
@EXPORT_OK = qw(dump_php pp_php quote_php);

$DEBUG = 0;

use overload ();
use vars qw(%seen %refcnt @dump @fixup %require $TRY_BASE64 $USE_LAMBDA);

$USE_LAMBDA = 0;
$TRY_BASE64 = 50 unless defined $TRY_BASE64;

my %is_perl_keyword = map { $_ => 1 }
qw( __FILE__ __LINE__ __PACKAGE__ __DATA__ __END__ AUTOLOAD BEGIN CORE
DESTROY END EQ GE GT INIT LE LT NE abs accept alarm and atan2 bind
binmode bless caller chdir chmod chomp chop chown chr chroot close
closedir cmp connect continue cos crypt dbmclose dbmopen defined
delete die do dump each else elsif endgrent endhostent endnetent
endprotoent endpwent endservent eof eq eval exec exists exit exp fcntl
fileno flock for foreach fork format formline ge getc getgrent
getgrgid getgrnam gethostbyaddr gethostbyname gethostent getlogin
getnetbyaddr getnetbyname getnetent getpeername getpgrp getppid
getpriority getprotobyname getprotobynumber getprotoent getpwent
getpwnam getpwuid getservbyname getservbyport getservent getsockname
getsockopt glob gmtime goto grep gt hex if index int ioctl join keys
kill last lc lcfirst le length link listen local localtime lock log
lstat lt m map mkdir msgctl msgget msgrcv msgsnd my ne next no not oct
open opendir or ord pack package pipe pop pos print printf prototype
push q qq qr quotemeta qw qx rand read readdir readline readlink
readpipe recv redo ref rename require reset return reverse rewinddir
rindex rmdir s scalar seek seekdir select semctl semget semop send
setgrent sethostent setnetent setpgrp setpriority setprotoent setpwent
setservent setsockopt shift shmctl shmget shmread shmwrite shutdown
sin sleep socket socketpair sort splice split sprintf sqrt srand stat
study sub substr symlink syscall sysopen sysread sysseek system
syswrite tell telldir tie tied time times tr truncate uc ucfirst umask
undef unless unlink unpack unshift untie until use utime values vec
wait waitpid wantarray warn while write x xor y);


sub dump
{
    local %seen;
    local %refcnt;
    local %require;
    local @fixup;

    my $name = "a";
    my @dump;

    for my $v (@_) {
	my $val = _dump($v, $name, [], tied($v));
	push(@dump, [$name, $val]);
    } continue {
	$name++;
    }

    my $out = "";
    if (%require) {
	die "BUG: should not require() for PHP";
        for (sort keys %require) {
	    $out .= "require $_;\n";
	}
    }
    if (%refcnt) {
	# output all those with refcounts first
	for (@dump) {
	    my $name = $_->[0];
	    if ($refcnt{$name}) {
		$out .= "\$$name = $_->[1];\n";
		undef $_->[1];
	    }
	}
	for (@fixup) {
	    $out .= "$_;\n";
	}
    }

    my $paren = (@dump != 1);
    $out .= (@fixup ? "return ":"")."array(" if $paren;
    $out .= format_list($paren, undef,
			map {defined($dump[$_][1]) ? $dump[$_][1] : (!$paren && $_ == @dump-1 ? "return ":"")."\$".$dump[$_][0]}
			    0..$#dump
		       );
    $out .= ")" if $paren;

    if (%refcnt || %require) {
        $out .= ";\n";
	$out =~ s/^/  /gm;  # indent
	if ($USE_LAMBDA) {
            $out = "call_user_func(function() { ".$out." })";
        } else {
            $out = "call_user_func(create_function('', ".quote($out)."))";
        }
    }

    #use Data::Dumper;   print Dumper(\%refcnt);
    #use Data::Dumper;   print Dumper(\%seen);

    print STDERR "$out\n" unless defined wantarray;
    $out;
}

*dump_php = \&dump;
*pp_php = \&dump;

sub dd_php {
    print dump(@_), "\n";
}

sub ddx_php {
    my(undef, $file, $line) = caller;
    $file =~ s,.*[\\/],,;
    my $out = "$file:$line: " . dump(@_) . "\n";
    $out =~ s/^/# /gm;
    print $out;
}

sub _dump
{
    my $ref  = ref $_[0];
    my $rval = $ref ? $_[0] : \$_[0];
    shift;

    my($name, $idx, $dont_remember) = @_;

    my($class, $type, $id);
    if (overload::StrVal($rval) =~ /^(?:([^=]+)=)?([A-Z]+)\(0x([^\)]+)\)$/) {
	$class = $1;
	$type  = $2;
	$id    = $3;
    } else {
	die "Can't parse " . overload::StrVal($rval);
    }
    if ($] < 5.008 && $type eq "SCALAR") {
	$type = "REF" if $ref eq "REF";
    }
    warn "\$$name(@$idx) $class $type $id ($ref)" if $DEBUG;

    unless ($dont_remember) {
	if (my $s = $seen{$id}) {
	    my($sname, $sidx) = @$s;
	    $refcnt{$sname}++;
	    my $sref = fullname($sname, $sidx,
				($ref && $type eq "SCALAR"));
	    warn "SEEN: [\$$name(@$idx)] => [\$$sname(@$sidx)] ($ref,$sref)" if $DEBUG;
	    return $sref unless $sname eq $name;
	    $refcnt{$name}++;
            push(@fixup, fullname($name,$idx) . " =& " . $sref);
	    die "Can't handle returning references for PHP yet" if @$idx && $idx->[-1] eq '$';
            #return "do{my \$fix}" if @$idx && $idx->[-1] eq '$';
	    return "'fix'";
	}
	$seen{$id} = [$name, $idx];
    }

    my $out;
    if ($type eq "SCALAR" || $type eq "REF" || $type eq "REGEXP") {
        if ($ref) {
	    if ($class && $class eq "Regexp") {
		my $v = "$rval";

		my $mod = "";
		if ($v =~ /^\(\?\^?([msix-]*):([\x00-\xFF]*)\)\z/) {
		    $mod = $1;
		    $v = $2;
		    $mod =~ s/-.*//;
		}

		my $sep = '/';
		my $sep_count = ($v =~ tr/\///);
		if ($sep_count) {
		    # see if we can find a better one
		    for ('|', ',', ':', '#') {
			my $c = eval "\$v =~ tr/\Q$_\E//";
			#print "SEP $_ $c $sep_count\n";
			if ($c < $sep_count) {
			    $sep = $_;
			    $sep_count = $c;
			    last if $sep_count == 0;
			}
		    }
		}
		$v =~ s/\Q$sep\E/\\$sep/g;

		$out = quote("$sep$v$sep$mod");
		undef($class);
	    }
	    else {
		die "Can't handle non-Regexp builtin object (class $class) for PHP yet";
                delete $seen{$id} if $type eq "SCALAR";  # will be seen again shortly
		my $val = _dump($$rval, $name, [@$idx, "\$"]);
		$out = $class ? "do{\\(my \$o = $val)}" : "\\$val";
	    }
	} else {
	    if (!defined $$rval) {
		$out = "null";
	    }
	    elsif ($$rval =~ /^-?[1-9]\d{0,9}\z/ || $$rval eq "0") {
		$out = $$rval;
	    }
	    else {
		$out = str($$rval);
	    }
	    if ($class && !@$idx) {
                die "Can't handle nonref, class, nonidx for PHP yet";
                # Top is an object, not a reference to one as perl needs
		$refcnt{$name}++;
		my $obj = fullname($name, $idx);
		my $cl  = quote($class);
		push(@fixup, "bless \\$obj, $cl");
	    }
	}
    }
    elsif ($type eq "GLOB") {
	die "Can't handle glob for PHP yet";
        if ($ref) {
	    delete $seen{$id};
	    my $val = _dump($$rval, $name, [@$idx, "*"]);
	    $out = "\\$val";
	    if ($out =~ /^\\\*Symbol::/) {
		$require{Symbol}++;
		$out = "Symbol::gensym()";
	    }
	} else {
	    my $val = "$$rval";
	    $out = "$$rval";

	    for my $k (qw(SCALAR ARRAY HASH)) {
		my $gval = *$$rval{$k};
		next unless defined $gval;
		next if $k eq "SCALAR" && ! defined $$gval;  # always there
		my $f = scalar @fixup;
		push(@fixup, "RESERVED");  # overwritten after _dump() below
		$gval = _dump($gval, $name, [@$idx, "*{$k}"]);
		$refcnt{$name}++;
		my $gname = fullname($name, $idx);
		$fixup[$f] = "$gname = $gval";  #XXX indent $gval
	    }
	}
    }
    elsif ($type eq "ARRAY") {
	my @vals;
	my $tied = tied_str(tied(@$rval));
	die "Can't handle tied arrayref for PHP yet" if $tied;
	my $i = 0;
	for my $v (@$rval) {
	    push(@vals, _dump($v, $name, [@$idx, "[$i]"], $tied));
	    $i++;
	}
	$out = "array(" . format_list(1, $tied, @vals) . ")";
    }
    elsif ($type eq "HASH") {
	my(@keys, @vals);
	my $tied = tied_str(tied(%$rval));
	die "Can't handle tied hashref for PHP yet" if $tied;

	# statistics to determine variation in key lengths
	my $kstat_max = 0;
	my $kstat_sum = 0;
	my $kstat_sum2 = 0;

	my @orig_keys = keys %$rval;
	my $text_keys = 0;
	for (@orig_keys) {
	    $text_keys++, last unless /^[-+]?(?:0|[1-9]\d*)(?:\.\d+)?\z/;
	}

	if ($text_keys) {
	    @orig_keys = sort @orig_keys;
	}
	else {
	    @orig_keys = sort { $a <=> $b } @orig_keys;
	}

	for my $key (@orig_keys) {
	    my $val = \$rval->{$key};
	    $key = quote($key) if #$is_perl_keyword{$key} ||
		                  !(#$key =~ /^[a-zA-Z_]\w{0,19}\z/ ||
				    $key =~ /^-?[1-9]\d{0,8}\z/
				    );

	    $kstat_max = length($key) if length($key) > $kstat_max;
	    $kstat_sum += length($key);
	    $kstat_sum2 += length($key)*length($key);

	    push(@keys, $key);
	    push(@vals, _dump($$val, $name, [@$idx, "[$key]"], $tied));
	}
	my $nl = "";
	my $klen_pad = 0;
	my $tmp = "@keys @vals";
	if (length($tmp) > 60 || $tmp =~ /\n/ || $tied) {
	    $nl = "\n";

	    # Determine what padding to add
	    if ($kstat_max < 4) {
		$klen_pad = $kstat_max;
	    }
	    elsif (@keys >= 2) {
		my $n = @keys;
		my $avg = $kstat_sum/$n;
		my $stddev = sqrt(($kstat_sum2 - $n * $avg * $avg) / ($n - 1));

		# I am not actually very happy with this heuristics
		if ($stddev / $kstat_max < 0.25) {
		    $klen_pad = $kstat_max;
		}
		if ($DEBUG) {
		    push(@keys, "__S");
		    push(@vals, sprintf("%.2f (%d/%.1f/%.1f)",
					$stddev / $kstat_max,
					$kstat_max, $avg, $stddev));
		}
	    }
	}
	$out = "array($nl";
        $out .= "  # $tied$nl" if $tied;
	while (@keys) {
	    my $key = shift @keys;
	    my $val = shift @vals;
	    my $pad = " " x ($klen_pad + 6);
	    $val =~ s/\n/\n$pad/gm;
	    $key = " $key" . " " x ($klen_pad - length($key)) if $nl;
	    $out .= " $key => $val,$nl";
	}
	$out =~ s/,$/ / unless $nl;
	$out .= ")";
    }
    elsif ($type eq "CODE") {
	if ($USE_LAMBDA) {
            $out = "function() {}";
        } else {
            $out = "create_function('', '')";
        }
    }
    else {
	warn "Can't handle $type data";
	$out = "'#$type#'";
    }

    if ($class && $ref) {
	die "Can't handle object (class $class) for PHP yet";
        $out = "bless($out, " . quote($class) . ")";
    }
    return $out;
}

sub tied_str {
    my $tied = shift;
    if ($tied) {
	if (my $tied_ref = ref($tied)) {
	    $tied = "tied $tied_ref";
	}
	else {
	    $tied = "tied";
	}
    }
    return $tied;
}

sub fullname
{
    my($name, $idx, $ref) = @_;
    substr($name, 0, 0) = "\$";

    my @i = @$idx;  # need copy in order to not modify @$idx
    my @ci = @i;
    if ($ref && @i && $i[0] eq "\$") {
	shift(@i);  # remove one deref
	$ref = 0;
    }
    while (@i && $i[0] eq "\$") {
	shift @i;
	$name = "\$$name";
    }

    my $last_was_index;
    for my $i (@i) {
	if ($i eq "*" || $i eq "\$") {
	    $last_was_index = 0;
	    $name = "$i\{$name}";
	} elsif ($i =~ s/^\*//) {
	    $name .= $i;
	    $last_was_index++;
	} else {
	    #$name .= "->" unless $last_was_index++;
	    $name .= $i;
	}
    }
    $name = "\\$name" if $ref;
    "*".join("", map {"<$_>"} @ci)."*$name*"; #X#
    $name;
}

sub format_list
{
    my $paren = shift;
    my $comment = shift;
    my $indent_lim = $paren ? 0 : 1;
    my $tmp = "@_";
    if ($comment || (@_ > $indent_lim && (length($tmp) > 60 || $tmp =~ /\n/))) {
	my @elem = @_;
	for (@elem) { s/^/  /gm; }   # indent
	return "\n" . ($comment ? "  # $comment\n" : "") .
               join(",\n", @elem, "");
    } else {
	return join(", ", @_);
    }
}

sub str {
  if (length($_[0]) > 30) {
      for ($_[0]) {
      # Check for repeated string
      if (/^(.)\1\1\1/s) {
          # seems to be a repating sequence, let's check if it really is
          # without backtracking
          unless (/[^\Q$1\E]/) {
              my $base = quote($1);
              my $repeat = length;
              return "str_repeat($base, $repeat)"
          }
      }
      # Length protection because the RE engine will blow the stack [RT#33520]
      if (length($_) < 16 * 1024 && /^(.{2,5}?)\1*\z/s) {
	  my $base   = quote($1);
	  my $repeat = length($_)/length($1);
	  return "str_repeat($base, $repeat)";
      }
      }
  }

  local $_ = &quote;

  if (length($_) > 40  && !/\\x\{/ && length($_) > (length($_[0]) * 2)) {
      # too much binary data, better to represent as a hex/base64 string

      # Base64 is more compact than hex when string is longer than
      # 17 bytes (not counting any require statement needed).
      # But on the other hand, hex is much more readable.
      if ($TRY_BASE64 && length($_[0]) > $TRY_BASE64 &&
	  eval { require MIME::Base64 })
      {
	  #$require{"MIME::Base64"}++;
	  return "base64_decode(\"" .
	             MIME::Base64::encode($_[0],"") .
		 "\")";
      }
      return "pack(\"H*\",\"" . unpack("H*", $_[0]) . "\")";
  }

  return $_;
}

my %esc = (
    "\t" => "\\t",
    "\n" => "\\n",
    "\f" => "\\014", # \f only since 5.2.5
    "\r" => "\\r",
    "\x0b" => "\\013", # \v only since 5.2.5
);

# put a string value in double quotes
sub quote {
  local($_) = $_[0];
  # If there are many '"' we might want to use qq() instead
  s/([\\\"\$])/\\$1/g;
  return qq("$_") unless /[^\040-\176]/;  # fast exit

  s/([\t\n\f\r\x0b])/$esc{$1}/g;

  # no need for 3 digits in escape for these
  s/([\0-\037])(?!\d)/sprintf('\\%o',ord($1))/eg;

  s/([\0-\037\177-\377])/sprintf('\\x%02X',ord($1))/eg;
  s/([^\040-\176])/sprintf('\\x{%X}',ord($1))/eg;

  return qq("$_");
}

*quote_php = \&quote;

1;
# ABSTRACT: Pretty printing of data structures as PHP code

__END__

=pod

=encoding utf-8

=head1 NAME

Data::Dump::PHP - Pretty printing of data structures as PHP code

=head1 VERSION

version 0.10

=head1 SYNOPSIS

 use Data::Dump::PHP qw(dump_php ddx_php);

 # in Perl
 $str = dump_php($var);
 $str2 = dump_php(@list);

 # in PHP
 $var = eval("return $str;");
 $array = eval("return $str2;");

 # or use it for easy debug printout
 ddx_php localtime;

=head1 DESCRIPTION

This module provide functions that takes a list of values as their
argument and produces a string as its result.  The string contains PHP
code that, when C<eval>ed, produces a deep copy of the original
arguments.

The main feature of the module is that it strives to produce output
that is easy to read.  Example:

    @a = (1, [2, 3], {4 => 5});
    dump_php(@a);

Produces:

    array(1, array(2, 3), array( 4 => 5 ))

If you dump just a little data, it is output on a single line. If
you dump data that is more complex or there is a lot of it, line breaks
are automatically added to keep it easy to read.

The following functions are provided (only the dd* functions are exported by default):

=over

=item dump_php( ... )

=item pp_php( ... )

Returns a string containing a PHP expression/code.  If you pass this
string to PHP's built-in eval() function like this: eval("return
$res;") or eval("\$a = $res;"), it should return a copy of the
arguments you passed to dump_php().

If you call the function with multiple arguments then the output will
be wrapped in an outer array "array( ..., ... )".  If you call the
function with a single argument the output will not have the wrapping.
If you call the function with a single scalar (non-reference) argument
it will just return the scalar quoted if needed, but never break it
into multiple lines.  If you pass multiple arguments or references to
arrays of hashes then the return value might contain line breaks to
format it for easier reading.  The returned string will never be "\n"
terminated, even if contains multiple lines.  This allows PHP code
like this to place the semicolon in the expected place:

   echo print '$obj = ', dump_php($obj), ";\n";

If dump_php() is called in void context, then the dump is printed on
STDERR and then "\n" terminated.  You might find this useful for quick
debug printouts, but the dd*() functions might be better alternatives
for this.

There is no difference between dump_php() and pp_php().

=item quote_php( $string )

Returns a quoted version of the provided string.

It differs from C<dd_php($string)> in that it will quote even numbers
and not try to come up with clever expressions that might shorten the
output.

=item dd_php( ... )

=item ddx_php( ... )

These functions will call dump_php() on their argument and print the
result to STDOUT (actually, it's the currently selected output handle,
but STDOUT is the default for that).

The difference between them is only that ddx_php() will prefix the
lines it prints with "# " and mark the first line with the file and
line number where it was called.  This is meant to be useful for debug
printouts of state within programs.

=back

=head1 FUNCTIONS


None are exported by default, but they are exportable.

=head1 OPTIONS

$Data::Dump::PHP::USE_LAMBDA (default 0) can be set to 1 to generate
PHP code that uses lambda functions instead of create_function(),
which is nicer and faster but requires PHP 5.3 or later.

=head1 LIMITATIONS

Code references will be displayed as simply "create_function('', '')"
(or "function(){}}") when dumped. Thus, C<eval>ing them will not
reproduce the original routine.

Regex objects in Perl will become string in PHP. If you want to use
this string in PHP's PCRE functions, you need to make sure that the
regex will be compatible.

=head1 SEE ALSO

L<Data::Dump> (from which this codebase is based)

L<PHP::Var> (I tried this first before hacking up Data::Dump::PHP, but
it has bugs, doesn't do scalars, and doesn't handle recursion.)

L<JSON>, L<YAML> - Another alternative to exchange data with PHP (and
other languages) is to export/import via YAML and JSON.

L<PHP::Serializer> - Yet another way to exchange data with PHP using
PHP serialization format.

=head1 ACKNOWLEDGEMENTS

Data::Dump::PHP is a quick hack (as I needed it for
L<Data::Schema::Emitter::PHP>). I simply copied the code from Gisle
Ass' wonderful C<Data::Dump> and changed only whatever is necessary.

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Data-Dump-PHP>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-Data-Dump-PHP>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
L<https://rt.cpan.org/Public/Dist/Display.html?Name=Data-Dump-PHP>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
