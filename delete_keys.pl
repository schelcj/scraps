#!/usr/bin/env perl

use Modern::Perl;
use Data::Dumper;

my $index = {
  foo1 => 1,
  foo2 => 1,
  foo3 => 1,
  foo4 => 1,
  foo5 => 1,
  foo6 => 1,
  foo7 => 1,
  foo8 => 1,
};

my @keys = (qw(foo3 foo6 foo8));
my %new  = %{$index};
delete @new{@keys};

print Dumper $index, \@keys, \%new;
