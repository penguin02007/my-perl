#	Interview Question
#	Write a program to loop 1 through 100,
#	Print Fiz if number is divisible by 3,
#	Print Buzz if number is divisible by 5,
#	Print FizBuzz if number is divisible by 15.

use 5.16.0;
	foreach my $n ( 1..100 ) {
	# 0 is False
	if (!($n % 3)) {
	say "$n - Fiz";
	} elsif	(!($n % 5)) {
	say "$n - Buzz";
	} elsif (!($n % 15)) {
	say "$n - FizBuzz";
	} else {
	say "$n";
	}
}