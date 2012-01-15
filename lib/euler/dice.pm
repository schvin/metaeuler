package euler::dice;

sub pick {

  my $list;
  my $choice;

  $list = shift;

  $choice = int(rand($#{$list} + 1));

  return($choice);

}

sub pick_test {

  my $choice;
  my $count;
  my $i;
  my $list;
  my %choices;
  my @keys;

  $list  = shift;
  $count = shift;

  print "testing...";
  for($i = 0; $i < $count; $i++) {
    $choice = pick($list);
    if($choices{$choice}) {
      $choices{$choice}++;
    } else {
      $choices{$choice} = 1;
    }
    print ".";
  }
  print "\n";

  @keys = sort(keys(%choices));
  for($i = 0; $i <= $#keys; $i++) {
    print "$keys[$i]\t$choices{$keys[$i]}\n";
  }

  return();

}

1;
