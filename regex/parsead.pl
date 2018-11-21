#!/usr/bin/perl

use strict;
use warnings;

my $filename = shift;
open(my $fh, $filename)
     or die "Could not open file '$filename'";

my %hash;

while (my $row = <$fh>) {
  chomp $row;
  #$row =~ s|<br\s+\/>||g;
  #$row =~ s/^\s+//;
  #$row =~ s/\s+$//;
  # try to remove all new lines;
  #print "$row\n";
 
  if ($row =~ m/<title>(.*?)<\/title>/){
  	my ($title) = ( $row =~  m/<title>(.*?)<\/title>/ );
  	# remove excess tags
  	# $row = $1;
  	# remove excess information / tags
  	$title =~ s/\s+\|.*//;
  	#print "$title\n";
	$hash{'title'} = $title;
  }

  if ($row =~ m/<span itemprop="jobLocation">(.*?)<br\s+\/>/){
  	my ($location) = ( $row =~  m/<span itemprop="jobLocation">(.*?)<br\s+\/>/ );
  	# remove excess information / tags
  	$location =~ s/<.+?>//;
  	#print "$row\n";
  	#print "$location\n";
  	$hash{'location'} = $location;
  }


  # need to find a way to pass multiple lines 
  if ($row =~ m/<span itemprop="description">(.*)/){
  	my ($description) = ( $row =~  m/<span itemprop="description">(.*)/);
  	$description =~ s/<.+?>//;
  	$description =~ s/\s$//;
  	print "$description\n";
  	#print "$row\n";
  	#^[a-zA-Z].*<\/span>
  	#<br\s+\/>
  	#$hash{'description'} = $description;
  }
 
   #$string =~ /(Start Here.*)End Here/s;
   #print $1;

   if ($row =~ m/<span itemprop="Industry">/){
  	#fetch the data into a seperate variable 
  	my ($sector) = ( $row =~  m/<span itemprop="Industry">(.*?)<br\s+\/>/ );
  	$sector =~ s/<.+?>//;
  	$sector =~ s/^\s+//;
  	#print "$sector\n";
  	$hash{'sector'} = $sector;
  }

  # need to find how to get ID (got it but in a dodgy way)
  if ($row =~ m/var\s+currentURL/){
  	#$row = $1;
    #$1 =~ s/[^a-zA-Z]+//; 
    #$row =~ s/^\s+//; 
    $row =~ s/\-.*//; 	
    $row =~ s/.*\///; 	
    #$row =~ s/[^a-zA-Z]+//;
    $hash{'id'} = $row;
  	#print "$row\n";
  }

}

foreach my $k (sort keys %hash) {
    #print "$k => $hash{$k}\n";
}

#my $var1 =  'Some <h2>markup</h2>';
#my ($var2) = ( $var1 =~ m{<h2>(.*?)</h2>}msi );
#print $var2;

