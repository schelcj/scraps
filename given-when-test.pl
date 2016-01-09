#!/usr/bin/env perl

use Modern::Perl;
use Data::Dumper;

no warnings 'experimental::smartmatch';

my $foo   = $ARGV[0];
my $state = 'unknown';

given ($foo) {
  when ($_ == 1)  {$state = 'cancelled'}
  when ($_ == 0)  {$state = 'requested'}
  when ($_ == -1) {$state = 'failed'}
  when ($_ == 2)  {$state = 'submitted'}
  when ($_ > 10)  {$state = 'completed'}
  when ($_ < 0)   {$state = 'started'}
}

print Dumper $state;
