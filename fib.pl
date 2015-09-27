#	fibonacci Sequence
#	x=0, 1, 1, 2, 3, 5, 8...
#	n=0, 1, 2, 3, 4, 5, 6...

use v5.012;
my $n = shift @ARGV;
if (! $n or $n < 0) {
	say "Fibonacci Sequence";
	say "Usage:	$0 <POSITIVE INTERGER>";
	exit;
	}
my ($x,$x2);
my $x1 = 1;

if ($n == 0) {
	$x = 0;
} elsif ($n == 1) {
	$x = 1;
} else {
	# Must be greater than 1
	foreach my $i (2..$n) {
		$x = $x1 + $x2;
		$x2 = $x1;
		$x1 = $x;
	}
}
say "Fibonacci Sequence of $n is $x";

