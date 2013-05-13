#!/usr/bin/env perl
use strict;
use warnings;

change2al('abc');
change2al("a\tc");
change2al("ab\n");
change2al("\x1b\x00");
change2al("a\"b");

sub change2al {
  my @query = split //, shift;
  my @results;
  foreach my $letter ( @query ) {
    push @results , "0x".sprintf("%x", ord($letter));
  }

  my $result = "\"@query\""." => "."[ ";
  foreach ( @results ) {
    $result .= $_.", ";
  }
  print $result."]\n";
}