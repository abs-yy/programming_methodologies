#!/usr/env/bin perl
use strict;
use warnings;

foreach ( 1..100 ) {
  my $str = q{};
  if( $_ % 3 == 0 || $_ % 5 == 0 ) {
    if( $_ % 3 == 0 ) {
      $str .= "Fizz ";
    }
    if ( $_ % 5 == 0 ) {
      $str .= "Buzz ";
    }
  }
  else {
      $str.= $_;
  }
  print $str,"\n";
}
