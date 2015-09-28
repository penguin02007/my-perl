=pod

=head1 DESCRIPTION

Download perlmaven beginner videos in a perl style,
Pass argument with a directory with list of urls.
wget -r -A "beginner-perl-maven*" http://perlmaven.com/

=cut

use v5.012;
use LWP::Simple;

die "Usage: $0 DIR" if not @ARGV;
my $basedir = shift @ARGV;
opendir my $dh1, $basedir;
my @urls = readdir $dh1;

foreach my $url (@urls) {
	next unless $url =~ /^beginner-perl-maven/;
	open (my $fh, "<", "$basedir\\$url")
		or die $!;
	while (my $line = <$fh>) {
		chomp $line;
		next unless $line =~ m!<a href="(/media/videos/beginner-perl/(.+?\.mp4))">!;
		my $content = "http://perlmaven.com$1";
		my $file = "$2";
		say "Downloading $content to $file";
		getstore($content,$file);
	}

}
closedir $dh1;
