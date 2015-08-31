#	Invert cases to upper or lower and send to clipboard.
#
#	Usage: case.pl abc|ABC

use Win32::Clipboard;
$clip = Win32::Clipboard();
if ($ARGV[0] =~ /^$/ ){
	print "\nCase.pl - Translate case and send to clipboard.\n\n\tUsage: case.pl abc|ABC \n";
}
elsif ($ARGV[0] =~ /[[:lower:]]/){
	print uc($ARGV[0]);
	$clip->Set(uc($ARGV[0]));
}
elsif ($ARGV[0] =~ /[[:upper:]]/){
	print lc($ARGV[0]);
	$clip->Set(lc($ARGV[0]));
}
else {
	print "\nLetters only.\n";
}


