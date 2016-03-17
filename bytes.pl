#!/usr/bin/env perl

use Modern::Perl;
use Number::Bytes::Human qw(parse_bytes);
use Data::Dumper;

my $size = parse_bytes('400Tb');
print Dumper $size;

