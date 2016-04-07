#!/usr/bin/env perl

use Modern::Perl;
use URI;
use Data::Dumper;

my $uri = URI->new('nfs://foo/some/path');

print Dumper $uri->scheme, $uri->path;
