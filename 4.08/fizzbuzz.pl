#!/usr/env/bin perl
use strict;
use warnings;
foreach ( 1..100 ) { print my $str .= $_ % 15 == 0 ? "Fizz Buzz\n" : $_ % 3 == 0 ? "Fizz\n" : $_ % 5 == 0 ? "Buzz\n" : "$_\n"; }
