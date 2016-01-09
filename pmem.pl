sub pmem {                                                                      
  my ($self, $procs, $mem) = @_;                                                
  my $human = Number::Bytes::Human->new(bs => 1000, si => 1, round_style => 'round', precision => 0);
  return lc($human->format(($mem / $procs) * 2**20));                           
}
