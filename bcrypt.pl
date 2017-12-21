#!/usr/bin/env perl

use Modern::Perl;
use Data::Dumper;

use Data::Entropy::Algorithms qw(rand_bits);
use Digest;    # XXX - Digest::Bcrypt
use String::Random qw(random_string);

use Test::More;

for (1 .. 1000) {
  my $pass   = random_string("." x 100);
  my $hash   = encrypt($pass);
  my $digest = Digest->new('Bcrypt', settings => $hash);

  $digest->add($pass);

  diag($pass);
  diag($hash);

  is($digest->settings . $digest->bcrypt_b64digest, $hash);
}

sub encrypt {
  my $digest = Digest->new('Bcrypt', cost => 12, salt => rand_bits(16 * 8));
  $digest->add(shift);
  return $digest->settings . $digest->bcrypt_b64digest;
}

done_testing();
