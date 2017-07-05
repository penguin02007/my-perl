#!/usr/bin/env perl
#
# Capture process with ps
#
use v5.10.0;
use warnings;
use strict;
use DateTime;

my $proc_result = get_proc();
create_log(get_proc());

sub create_log {
  my $fh;
  my $sum = 0;
  my $result = shift(@_); #  subroutine argument
  my $today = DateTime->now->strftime('%m%d%Y');
  my $diag_file = "/tmp/diag_$today.txt";
  open ($fh, '+>', $diag_file) #  open filehandle for read-write 
    || die "Can't open $diag_file $!";
  print $fh $result;
  open ($fh, '<', $diag_file) #  reopen file handle to count lines
    || die "Can't open $diag_file $!";
  while (<$fh>) {
    $sum++;
  }
  say "Written $sum line in $diag_file";
  close $fh;
}

sub get_proc {
  my $cmd = `ps aux`;
# return $cmd;
}