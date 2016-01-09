#!/usr/bin/env perl

package Foo {
  use Modern::Perl;
  use Data::Dumper;
  use feature 'signatures';

  sub foo($bar) {
    print Dumper $bar;
  }
}

Foo::foo('hello');
