#!/usr/bin/env perl

use Modern::Perl;

package Foo {
  use Moose;
  has 'name' => (
    is      => 'ro',
    isa     => 'Str',
    default => sub {
      'bob'
    },
  );
}

my $foo = Foo->new();

say "Hello, @{[ $foo->name ]} welcome";
