use feature qw(say);

#  POSIX for non-printable characters
my $inv_rex = qr/[^[:print:]]/;
my $matched = 0;
my $file1 = 'replaced.txt';

while (<>) {
	chomp;
	@fields =  split;
	foreach my $field (@fields) {
	$field =~ s/$inv_rex//g && $matched++;
    }
    open my $fh1, '>>:encoding(UTF-8)', $file1 or die "Could not open $file1";
 }
say "$matched fields replaced";

