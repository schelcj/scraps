#!/usr/bin/env perl

use Modern::Perl;
use Data::Dumper;

use Data::Entropy::Algorithms qw(rand_bits);
use Digest; # XXX - Digest::Bcrypt

use Test::More;

for (1..1000) {
  my $pass = join('', (map +(0..9,'a'..'z','A'..'Z', ' ')[rand(10+26*2)], 1..50));
  my $hash = encrypt($pass);

  my $settings = substr($hash, 0, 29);
  my $known    = substr($hash, 29);
  my $digest   = Digest->new('Bcrypt', settings => $settings);

  # diag($pass);
  # diag($settings);
  # diag($known);
  # diag($hash);

  is($digest->add($pass)->bcrypt_b64digest, $known);
}

sub encrypt {
  my $digest = Digest->new('Bcrypt', cost => 12, salt => rand_bits(16 * 8));
  $digest->add(shift);
  return $digest->settings . $digest->bcrypt_b64digest;
}

done_testing();
