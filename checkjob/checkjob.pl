#!/usr/bin/env perl

use Modern::Perl;
use Getopt::Compact;
use IPC::System::Simple qw(capture);
use CheckJob;
use Mdiag;

## no tidy
my $opts = Getopt::Compact->new(
  struct => [
    [[qw(j jobid)], q{Job id}, q{=i}],
  ]
)->opts();
## use tidy

(my $checkjob_xml = capture(qq(checkjob -v --xml $opts->{jobid}))) =~ s/^\s+|\s+$//g;
my $checkjob = CheckJob->new(xml => $checkjob_xml);

(my $mdiag_xml = capture(qq(mdiag --xml -j $opts->{jobid}))) =~ s/^\s+|\s+$//g;
my $mdiag = Mdiag->new(xml => $mdiag_xml);

say $checkjob->block_reason;
say $mdiag->block_reason;
