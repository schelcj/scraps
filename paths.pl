#!/usr/bin/env perl

use Modern::Perl;
use Data::Dumper;
use Path::Class;

my $path = q{/tmp/topmed/foo/bar/baz.txt};
my $file = Path::Class->file($path);
my @comps = $file->components;

if (-l q{/tmp/topmed/foo}) {
  print Dumper $comps[3];
}
