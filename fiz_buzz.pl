#	Write a program to loop 1 through 100,
#	print Fiz if number is divisible by 3,
#	print Buzz if number is divisible by 5,
#	print FizBuzz if number is divisible by 15.
#	print number for everything else.

use 5.16.0;
# Remainder is true and 0 is false
foreach my $n ( 1..100 ) {
# 0 is False
	if (!($n % 15)) {
		say "$n Fiz Buzz FizBuzz";
	} elsif	(!($n % 3)) {
		say "$n Fiz";
	} elsif (!($n % 5)) {
		say "$n Buzz";
	} else {
		say $n;
	}
}