#!/usr/bin/env perl

use Modern::Perl;
use Data::Dumper;

sub foo {
  my @keys = (qw(foo bar baz));
  #@vals{@keys} = @_;

  my $a = 1;
  my $b = 2;
  my $c = 3;

  my %vals = ();
  @vals{@keys} = ($a, $b, $c);

  return %vals;
}

my %return = foo();

print Dumper \%return;
