#!/usr/bin/env perl

use Test::More tests => 8;

my $samples = [
  qw(
    12-23:45:67
    1-23:45:67
    12:16:56:67
    1:23:34:56
    12:34:45
    12:34
    12
    123
  )
];

my $formats = [
  # dd-hh:mm:ss
  qr/(?<days>\d{1,2})\-(?<hours>\d{2}):\d{2}:\d{2}/,

  # dd:hh:mm:ss
  qr/(?<days>\d{1,2}):(?<hours>\d{2}):\d{2}:\d{2}/,

  # hh:mm:ss
  qr/(?<hours>\d{1,2}):\d{2}:\d{2}/,

  # hh:mm
  qr/(?<hours>\d{1,2}):\d{2}/,
];

sub parse_format {
  my ($time) = @_;

  for my $format (@{$formats}) {
    if ($time =~ $format) {
      return (($+{days} * 24) + $+{hours}) if $+{days} and $+{hours};
      return $+{hours} if $+{hours};
    }
  }

  return;
}

is(parse_format($samples->[0]), ((12 * 24) + 23), 'sample 1 matched');
is(parse_format($samples->[1]), ((1 * 24) + 23),  'sample 2 matched');
is(parse_format($samples->[2]), ((12 * 24) + 16), 'sample 3 matched');
is(parse_format($samples->[3]), ((1 * 24) + 23),  'sample 4 matched');
is(parse_format($samples->[4]), 12,               'sample 5 matched');
is(parse_format($samples->[5]), 12,               'sample 6 matched');
is(parse_format($samples->[6]), undef,            'sample 7 matched');
is(parse_format($samples->[7]), undef,            'sample 8 matched');
