#!/usr/bin/perl
use strict;
use warnings;

my $filename = shift or die "$0 FILENAME\n";
open my $fh, '<', $filename or die "Could not open '$filename'\n";

while (my $line = <$fh>) {

	if ($line =~ /a/) {
        print "has an a: $line";
    }

    if ($line =~ /^q/) {
        print "has a start q: $line";
    }

    if ($line =~ /th/) {
        print "has a th: $line";
    }
    
    if ($line =~ /[qQ]/){
    	print "has lower/upper q: $line";
    }

    if ($line =~ /\*/){
    	print "has a * character: $line";
    }

    if ($line =~ /^[qQ]/){
    	print "has lower/upper q: $line";
    }

    if ($line =~ /a/ and $line =~ /e/){
    	print "has an a or an e character: $line";
    }
}


