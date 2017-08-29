#
# check for stale images and email
#
# Run create_img() every 5 minutes if there is image files in stage.
# if there are 2< files, delete and run create_img().
# if there are 2 files, run cmp_img(). 
#

use warnings;
use strict;
my ($screenshot_dir, $stage_dir);
my $sharex_cmd;
my $fh1;
my $fh2;

sub cmp_img {
  ...
}

sub create_img {
  ...
}

sub del_img {
  ...
}