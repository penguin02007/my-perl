use feature qw(say);
use File::Basename;

# This script assume input use space as seperator, it will fail otherwise.

my $rex3 = qr/[^\w\s\-_.]+/;
my $matched = 0;
my $parsed = fileparse($ARGV[0]);
my $file1 = "$parsed.fixed";

#$^|=".bak";
#$\ = $/;

while ( my $line = <> ) {
        chomp $line;
        $line =~ s/$rex3//g && $matched++;
        open my $fh1, '>>:encoding(UTF-8)', $file1 or die "Could not open $file1";
        say $fh1 $line;
        close $fh1;        
}
say "$matched fields replaced";
say "Output file: $file1";
