#!/usr/bin/env perl

use Modern::Perl;
use IO::All;
use IO::File;
use Capture::Tiny qw(:all);
use IPC::System::Simple qw(run);
use Parallel::ForkManager;

for my $group (1..10) {
  my $pm = Parallel::ForkManager->new(5);

  for (1 .. 10) {
    $pm->start and next;

    say "starting group $group proc $_";

    my $out_fh = IO::File->new("capture-${group}_$_.out", 'w+');
    my $err_fh = IO::File->new("capture-${group}_$_.err", 'w+');

    capture {
      run('uptime');
    }
    stdout => $out_fh, stderr => $err_fh;

    $pm->finish;
  }

  $pm->wait_all_children;
}
