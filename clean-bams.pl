#!/usr/bin/env perl

use Modern::Perl;
use File::Slurp::Tiny qw(read_lines);
use IPC::System::Simple qw(run);
use Data::Dumper;

my @runs = ();

while (<DATA>) {
  chomp;
  my @lines = read_lines($_);

  my ($bam_id, $node);
  my $run_ref = {};
  for my $line (@lines) {

    if ($line =~ /^BAM ID:(.*)$/) {
      ($bam_id = $1) =~ s/^\s+//g;

    } elsif ($line =~ /^NODE:(.*)$/) {
      ($node = $1) =~ s/^\s+//g;

    }

     $run_ref = {
      file => $_,
      bam  => $bam_id,
      node => $node,
    };
  }

  push @runs, $run_ref;
}

for my $run (@runs) {
  my $batch = sprintf "sbatch -J 'cleanup' -w %s -t 10 --wrap 'rm -rf /tmp/topmed/%s'", $run->{node}, $run->{bam};
  run($batch);
}

__DATA__
slurm-9861526.out
slurm-9861527.out
slurm-9861528.out
slurm-9861529.out
slurm-9861530.out
slurm-9861531.out
slurm-9861532.out
slurm-9861533.out
slurm-9861534.out
slurm-9861535.out
slurm-9861536.out
slurm-9861537.out
slurm-9861538.out
slurm-9861539.out
slurm-9861540.out
slurm-9861541.out
slurm-9861542.out
slurm-9861543.out
slurm-9861544.out
slurm-9861545.out
slurm-9861546.out
slurm-9861547.out
slurm-9861548.out
slurm-9861549.out
slurm-9861550.out
slurm-9861551.out
slurm-9861552.out
slurm-9861553.out
slurm-9861554.out
slurm-9861555.out
slurm-9861556.out
slurm-9861557.out
slurm-9861558.out
slurm-9861559.out
slurm-9861560.out
slurm-9861561.out
slurm-9861562.out
slurm-9861563.out
slurm-9861564.out
slurm-9861565.out
slurm-9861566.out
slurm-9861567.out
slurm-9861568.out
slurm-9861569.out
slurm-9861570.out
slurm-9861571.out
slurm-9861572.out
slurm-9861573.out
slurm-9861574.out
slurm-9861575.out
slurm-9861576.out
slurm-9861577.out
slurm-9861578.out
slurm-9861579.out
slurm-9861580.out
slurm-9861581.out
slurm-9861582.out
slurm-9861583.out
slurm-9861584.out
slurm-9861585.out
slurm-9861586.out
slurm-9861587.out
slurm-9861588.out
slurm-9861589.out
slurm-9861590.out
slurm-9861591.out
slurm-9861592.out
slurm-9861593.out
slurm-9861594.out
slurm-9861595.out
slurm-9861596.out
slurm-9861597.out
slurm-9861598.out
slurm-9861599.out
slurm-9861600.out
slurm-9861601.out
slurm-9861602.out
slurm-9861603.out
slurm-9861604.out
slurm-9861605.out
slurm-9861606.out
slurm-9861607.out
slurm-9861608.out
slurm-9861609.out
slurm-9861610.out
slurm-9861611.out
slurm-9861613.out
slurm-9861614.out
slurm-9861615.out
slurm-9861616.out
slurm-9861617.out
slurm-9861618.out
slurm-9861619.out
slurm-9861620.out
slurm-9861621.out
slurm-9861622.out
slurm-9861623.out
slurm-9861624.out
slurm-9861625.out
slurm-9861626.out
slurm-9861627.out
slurm-9861628.out
slurm-9861629.out
slurm-9861630.out
slurm-9861631.out
slurm-9861632.out
slurm-9861633.out
slurm-9861634.out
slurm-9861635.out
slurm-9861636.out
slurm-9861637.out
slurm-9861638.out
slurm-9861639.out
slurm-9861640.out
slurm-9861641.out
slurm-9861642.out
slurm-9861645.out
slurm-9861646.out
slurm-9861647.out
slurm-9861648.out
slurm-9861649.out
slurm-9861650.out
slurm-9861651.out
slurm-9861652.out
slurm-9861653.out
slurm-9861654.out
slurm-9861655.out
slurm-9861656.out
slurm-9861657.out
slurm-9861658.out
slurm-9861659.out
slurm-9861660.out
slurm-9861661.out
slurm-9861662.out
slurm-9861663.out
slurm-9861664.out
slurm-9861665.out
slurm-9861666.out
slurm-9861667.out
slurm-9861668.out
slurm-9861669.out
slurm-9861670.out
slurm-9861671.out
slurm-9861672.out
slurm-9861673.out
slurm-9861674.out
slurm-9861675.out
slurm-9861676.out
slurm-9861677.out
slurm-9861678.out
slurm-9861679.out
slurm-9861680.out
slurm-9861681.out
slurm-9861682.out
slurm-9861683.out
slurm-9861684.out
slurm-9861685.out
slurm-9861686.out
slurm-9861687.out
slurm-9861688.out
slurm-9861689.out
slurm-9861690.out
slurm-9861691.out
slurm-9861692.out
slurm-9861693.out
slurm-9861694.out
slurm-9861695.out
slurm-9861696.out
slurm-9861697.out
slurm-9861698.out
slurm-9861699.out
slurm-9861700.out
slurm-9861701.out
slurm-9861702.out
slurm-9861703.out
slurm-9861704.out
slurm-9861705.out
slurm-9861706.out
slurm-9861707.out
slurm-9861708.out
slurm-9861709.out
slurm-9861710.out
slurm-9861711.out
slurm-9861712.out
slurm-9861713.out
slurm-9861714.out
slurm-9861715.out
slurm-9861716.out
slurm-9861717.out
slurm-9861718.out
slurm-9861719.out
slurm-9861720.out
slurm-9861721.out
slurm-9861722.out
slurm-9861723.out
slurm-9861724.out
slurm-9861725.out
slurm-9861726.out
slurm-9861727.out
slurm-9861728.out
slurm-9861729.out
slurm-9861730.out
slurm-9861731.out
slurm-9861732.out
slurm-9861733.out
slurm-9861734.out
slurm-9861735.out
slurm-9861736.out
slurm-9861737.out
slurm-9861738.out
slurm-9861739.out
slurm-9861740.out
slurm-9861741.out
slurm-9861742.out
slurm-9861743.out
slurm-9861744.out
slurm-9861745.out
slurm-9861746.out
slurm-9861747.out
slurm-9861748.out
slurm-9861749.out
slurm-9861750.out
slurm-9861753.out
slurm-9861755.out
slurm-9861756.out
slurm-9861757.out
slurm-9861758.out
slurm-9861759.out
slurm-9861760.out
slurm-9861761.out
slurm-9861762.out
slurm-9861763.out
slurm-9861764.out
slurm-9861765.out
slurm-9861766.out
slurm-9861767.out
slurm-9861768.out
slurm-9861769.out
slurm-9861770.out
slurm-9861771.out
slurm-9861772.out
slurm-9861773.out
slurm-9861774.out
slurm-9861775.out
slurm-9861776.out
slurm-9861777.out
slurm-9861778.out
slurm-9861779.out
slurm-9861780.out
slurm-9861781.out
slurm-9861782.out
slurm-9861783.out
slurm-9861784.out
slurm-9861789.out
slurm-9861790.out
slurm-9861791.out
slurm-9861792.out
slurm-9861793.out
slurm-9861794.out
slurm-9861795.out
slurm-9861796.out
slurm-9861797.out
slurm-9861798.out
slurm-9861799.out
slurm-9861800.out
slurm-9861801.out
slurm-9861802.out
slurm-9861803.out
slurm-9861804.out
slurm-9861805.out
slurm-9861806.out
slurm-9861807.out
slurm-9861808.out
slurm-9861809.out
slurm-9861810.out
slurm-9861811.out
slurm-9861812.out
slurm-9861813.out
slurm-9861814.out
slurm-9861815.out
slurm-9861816.out
slurm-9861817.out
