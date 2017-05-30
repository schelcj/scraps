#!/usr/bin/env perl

use strict;
use warnings;

my %id = ();
while (<>) {
  chomp;
  my ($h) = grep {/^SM:/} split(/\t/);
  $id{$h} = 1;
}

exit((scalar keys %id == 1) ? 0 : 1);
