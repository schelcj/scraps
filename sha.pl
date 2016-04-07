#!/usr/bin/env perl

use Modern::Perl;
use Data::Dumper;
use File::Spec;
use Digest::SHA qw(sha1_hex);

my $name = 'foo';
my $sha  = sha1_hex($name);
my @bits = split(//, $sha);
my $path = File::Spec->join('working', 'slots', @bits[0..3], $name);

print Dumper $path;
