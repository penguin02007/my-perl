#! /usr/bin/env perl
use v5.014;
use Net::SSH::Perl;
use Data::Dumper;

my @matches,;
my $idrac_cmd = "racadm racdump";
foreach my $ip (137..168) {
    my $ssh = Net::SSH::Perl->new( "172.20.230.$ip" );
    say "looping 172.20.230.$ip";
    push @matches, "172.20.230.$ip";
    $ssh->login( "root", "calvin" ) ;
    my ( $stdout, $stderr, $exit ) = $ssh->cmd( "$idrac_cmd" );
    my @text = split '\n+', $stdout;
    foreach (@text) {
        push @matches, grep( /^MAC.+?$|(Ethernet.+?$)/, $_);
    }
}
foreach (@matches) {
    say $1 if $_ =~ m/((?:\w\w:){5}\w\w)/;
}