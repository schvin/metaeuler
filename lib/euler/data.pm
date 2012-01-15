package euler::data;

sub languages_read {

  my $file;
  my $line;
  my @languages;

  local *FD;
  
  $file = shift;

  open(FD, "< $file") || confess("$!: can not read $file\n");
  while($line = <FD>) {
    $line =~ s/\s+/ /g;
    $line =~ s/^\#.*//;
    $line =~ s/\s*$//;
    chomp $line;
    if($line !~ /^\s*$/) {
      push @languages, $line;
    }
  }

  return(\@languages);

}

1;
