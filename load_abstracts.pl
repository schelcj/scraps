#!/usr/bin/env perl

use local::lib qq(./);
use Biostat::Publications::Base qw(biostat files www);
use File::Slurp;
use JSON;

my $dir = q{/afs/umich.edu/group/s/sph/web/htdocs/biostat/dev/publications/json/abstracts};
my $db  = Biostat::Publications::DB->new();

for my $file (read_dir($dir)) {
  (my $pmid = $file) =~ s/\.json$//g;

  my $abstract = from_json(read_file(qq{$dir/$file}));

  unless ($db->resultset('Abstract')->count({pmid => $pmid})) {
    $db->resultset('Abstract')->create(
      {
        pmid => $pmid,
        text => $abstract->{abstract},
      }
    );
  }
}
