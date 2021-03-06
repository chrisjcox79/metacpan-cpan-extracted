
require "../CGIChecker.pm";
require "readfile.inc";

$TEST = "badpre";

print "$TEST\n";

$checker = new HTML::CGIChecker (
	mode => 'allow'
);

$html = readfile("$TEST.in");
$res = readfile("$TEST.res");

($out, $Errors) = $checker->checkHTML($html);

if ($ARGV[0] eq "out") {
    open(RES, ">$TEST.res");
    $, = "\n";
    print RES @{$Errors};
    close RES;
}


if (join("\n", @{$Errors}) eq $res) {
    print "ok";
}
else {
    print "not ok";
    exit 1;
}
