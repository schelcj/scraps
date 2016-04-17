#!/usr/bin/env perl

# apt-get install libgd3 libgd-dev
# cpanm GD Barcode::Code128
#
use Modern::Perl;
use Barcode::Code128;
use IO::All;

my $code = 'C3534';
my $barcode = Barcode::Code128->new();

print io('barcode.png')->print($barcode->png($code));
