#!/usr/bin/perl

use warnings;
use strict;

my $var1 =  'Some <h2>markup</h2>';
my ($var2) = ( $var1 =~ m{<h2>(.*?)</h2>}msi );
print $var2;