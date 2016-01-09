#!/usr/bin/env perl

use Modern::Perl;
use Data::Dumper;
use Class::CSV;
use File::Path qw(make_path);
use autodie;

my $csv = Class::CSV->parse(
  filename => $ARGV[0],
  fields   => [qw(piname sample_id)]
);

my @lines = @{$csv->lines()};
shift @lines;

for my $line (@lines) {
  my $out_dir    = sprintf 'working/schelcj/results/uw/%s/%s',                        $line->piname, $line->sample_id;
  my $t1_out_dir = sprintf '/net/topmed/%s',                                          $out_dir;
  my $t2_out_dir = sprintf '/net/topmed2/%s',                                         $out_dir;
  my $target     = sprintf '../../../../../../topmed2/working/schelcj/results/uw/%s/%s', $line->piname, $line->sample_id;

  if (-e $t1_out_dir) {
    die "$t1_out_dir already exists";
  }

  make_path($t2_out_dir, {verbose => 1, mode => 0755});

  unlink($t1_out_dir);

  if (not symlink($target, $t1_out_dir)) {
    die "Failed to create link for $target to $t1_out_dir [$!]";
  }
}
