use feature qw(say);

#  POSIX for non-printable characters
# my $rex1 = qr/[^[:print:]]/;
my $rex2 = qr/[^a-zA-Z\d\s\n\-_.]/;
my $rex3 = qr/[^\w\-_.]+/;
my $matched = 0;
my $file1 = 'replaced.txt';

while (my $line = <>) {
	chomp $line;
#	@fields =  split /\s/, $line;
#	die "$line is invalid\n" if $line !~ /^$rex3\s$rex3\s$rex3$/;
	$line =~ s/$rex2//g && say $line && $matched++;
	say $line;
#	foreach my $field (@fields) {
#	$field =~ s/$rex1//g && $matched++;
#    }
#	open my $fh1, '>>:encoding(UTF-8)', $file1 or die "Could not open $file1";
	close $fh1;	
}
say "$matched fields replaced";

