#!/usr/bin/perl -I../lib

# extract language list from https://projecteuler.net/languages; support blacklist
# static list of friends
# list their problems; find set of not-solved for all friends, and generate list

use warnings;
use strict;
use Carp;
require euler::dice;
require euler::data;

main();
exit(0);

sub main {

  my $languages_file;
  my $languages;

  srand(time ^ $$ ^ unpack "%L*", `ps axww | gzip -f`);

  $languages_file = '../etc/languages.txt';

  $languages = euler::data::languages_read($languages_file);

  print $#{$languages} + 1;
  print " languages read in...\n";

  #euler::dice::pick_test($languages, 1000);
  print "for this round, we are going with: ", $languages->[euler::dice::pick($languages)], "\n";

  return();

}
