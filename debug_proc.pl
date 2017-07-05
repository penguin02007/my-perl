#!/usr/bin/env perl
#
# Capture process with ps and write to file
#
use v5.10.0;
use warnings;
use strict;
use DateTime;

my $proc_result = get_proc();
create_log($proc_result);

sub create_log {
  my $fh;
  my $sum = 0;
  my $result = shift(@_); #  subroutine argument
  my $today = DateTime->now->strftime('%Y%m%d%H%M%S'); #  current time in UTC
  my $debug_file = "/tmp/debug_$today.txt";
  open ($fh, '+>', $debug_file) #  open for read-write
    || die "Can't open $debug_file $!";
  print $fh $result;
  open ($fh, '<', $debug_file) #  reopen to count lines
    || die "Can't open $debug_file $!";
  while (<$fh>) {
    $sum++;
  }
  say "Written $sum line in $debug_file";
  close $fh;
}

sub get_proc {
  my $cmd = `ps aux`;
}
