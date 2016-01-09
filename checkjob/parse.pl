#!/usr/bin/env perl

use Modern::Perl;
use XML::XPath;
use IPC::System::Simple qw(capture);
use IO::Scalar;
use Getopt::Compact;
use Data::Dumper;

my $BLOCKED_REASON_PATH = q{//Data/job/@BlockReason};

my $opts      = Getopt::Compact->new(struct => [[[qw(j jobid)], q{Job id}, q{=i}]])->opts();
my $output    = capture(qq{checkjob -v --xml $opts->{jobid}});
my $output_fh = IO::Scalar->new(\$output);
my $parser    = XML::XPath->new(ioref => $output_fh);
my $reason    = $parser->find($BLOCKED_REASON_PATH)->string_value;

say $reason;
