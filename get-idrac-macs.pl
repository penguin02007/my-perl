#! /usr/bin/env perl
#
#  Pull mac address from Dell iDracs
#  
#  Credentials must be passed from the command line
#
use v5.014;
use Net::SSH::Perl;
use Data::Dumper;

my @matches,;
my $idrac_cmd = "racadm racdump";
my ($user, $pass) = @ARGV;

foreach my $ip (137..144) {
    my $ssh = Net::SSH::Perl->new( "172.20.230.$ip" );
    $ssh->login( "$user", "$pass" );
    my ( $stdout, $stderr, $exit ) = $ssh->cmd( "$idrac_cmd" );
    my @text = split '\n+', $stdout;
    push @matches, "172.20.230.$ip";
    foreach (@text) {
        push @matches, grep( /^MAC.+?$|(Ethernet.+?$)/, $_);
    }
}
foreach my $match (@matches) {
    say $1,$2 if $match =~ m/(172.20.230.\d+)|((?:\w\w:){5}\w\w)/;
}
