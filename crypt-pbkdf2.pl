#!/usr/bin/env perl

use Modern::Perl;
use PBKDF2::Tiny;
use Data::Entropy::Algorithms qw(rand_bits);
use String::Random qw(random_string);
use Test::More;

my $TYPE  = 'SHA-256';
my $ITERS = 2 ^ 32;

for (1 .. 1000) {
  my $pass = random_string("." x int(rand(100)));
  my $hash = encrypt($pass);

  diag($pass);
  diag($hash);

  ok(verify($hash, $pass), 'password matches');
}

sub encrypt {
  my $pass = shift;
  my $salt = rand_bits(16 * 8);

  return unpack('H*', $salt) . PBKDF2::Tiny::derive_hex($TYPE, $pass, $salt, $ITERS);
}

sub verify {
  my ($hash, $pass) = @_;

  my $salt = pack('H*', substr($hash, 0, 32));
  my $dk   = pack('H*', substr($hash, 32));

  return PBKDF2::Tiny::verify($dk, $TYPE, $pass, $salt, $ITERS);
}

done_testing;
