#!/usr/bin/env perl

use Modern::Perl;
use List::MoreUtils qw(part first_index);
use Data::Dumper;

my $id        = $ARGV[0];
my $i         = 0;
my $max_parts = 1000;
my @list      = 1 .. 100000;
my @part      = part {$i++ % $max_parts} @list;
my @index     = ();
my @ids       = ();

for my $chunk (@part) {
  push @index, [map +{$_ => int(rand(3))}, @{$chunk}];
}

my $hunk = ($id % $max_parts) - 1;
my $pos  = first_index {exists $_->{$id}} @{$index[$hunk]};

$index[$hunk][$pos]->{$id} = 42;

for my $chunk (@index) {
  for my $hunk (@{$chunk}) {
    my ($bamid, $state) = each $hunk;

    push @ids, $bamid if $state == 42;
  }
}

print Dumper $hunk, $pos, $index[$hunk][$pos], \@ids;
