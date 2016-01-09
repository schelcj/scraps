#!/usr/bin/env perl

use Modern::Perl;
use XML::XPath;
use Getopt::Compact;
use IPC::System::Simple qw(capture);
use CheckJob;

## no tidy
my $opts = Getopt::Compact->new(
  struct => [
    [[qw(j jobid)], q{Job id}, q{=i}],
  ]
)->opts();
## use tidy

(my $checkjob = capture(qq(checkjob -v --xml $opts->{jobid}))) =~ s/^\s+|\s+$//g;
my $chkjob = CheckJob->new(xml => $checkjob);

say $chkjob->block_reason;
