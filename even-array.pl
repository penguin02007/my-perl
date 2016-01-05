$n = shift @ARGV;
foreach $i (1..$n) {
	push (@even, $i) if not $i % 2; 
}
print "@even \n";