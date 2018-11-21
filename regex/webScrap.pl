#!/usr/bin/perl
# checks if the website is a valid https or https website 
# program to scrap content from websites and put it in a file

use strict;
use warnings;

use LWP::UserAgent;
use HTTP::Request;

my $ua = LWP::UserAgent->new;
my $req = HTTP::Request->new(GET => 'https://www.npr.org/programs/fresh-air/?todayDate=current');
my $res = $ua->request($req);
my $fileContent;

# checks to see if the link actually works
if ($res->is_success) {
	print "The link works!\n";
}	
else {
    print "The link doesn't work!.\n";
}

# checks to see if the content in the valid
if ($res->is_success && $res->content =~ m/jazz/i){
	print "They're talking about jazz today on Fresh Air!\n";
	
	# placing the content in the variable $fileContent
	$fileContent = $res->content;
}
else {
	print "Fresh Air is apparently jazzless today.\n";
}

# write the contents that you obtained onto a file 
my $filename = 'report.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh $fileContent;
close $fh;
print "done\n";



