#
# check for stale images and email
#
# Run create_img() every 5 minutes if there is image files in stage.
# if there are 2< files, delete and run create_img().
# if there are 2 files, run cmp_img(). 
#

use Image::Compare;
use warnings;
use strict;
my ($screenshot_dir, $stage_dir);
my $sharex_cmd;
my $fh1;
my $fh2;

while (1) {
  if (cmp_img()) {
  # The images are the same and within the threshold
  del_img();
  }
  else {
  # The images differ beyond the threshold
  notify();
  del_img();
  }
  create_img();
}
sub cmp_img {
  my($cmp) = Image::Compare->new();
  $cmp->set_image1(
    img  => 'c:\temp\cmp\1.jpg',
    type => 'jpg',
  );
  $cmp->set_image2(
    img  => 'c:\temp\cmp\2.jpg',
    type => 'jpg',
  );
  $cmp->set_method(
    method => &Image::Compare::THRESHOLD,
    args   => 25,
  );
  return;
}

sub create_img {
  $sharex_cmd = 'sharex commands';
  foreach my $i (0..1) {
    system("$sharex_cmd");
  }
}

sub del_img {
  unlink glob 'c:\temp\cmp\*.jpg';
}

sub notify {
  ...
}