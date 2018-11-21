#!/usr/bin/perl

use strict;
use warnings;

use XML::Twig;

#buffers for the twig
my $categorybuffer = '';
my $itembuffer = '';

#create the twig with handlers for node processing 
my $twig = new XML::Twig(TwigHandlers => {
    	"/inventory/category"    => \&category,
    	"name[\@style='latin']"  => \&latin_name,
    	"name[\@style='common']" => \&common_name,
    	"category/item"          => \&item,
	});

#parse the twig to the handler 
$twig->parsefile( shift @ARGV );

#handle a category element
sub category{
   my ($tree,$element) = @_;
   print "\n"."Category:", $element->att('type'), "\n\n", $categorybuffer;
   $categorybuffer = '';
}

#handle a item element
sub item{
   my ($tree,$element) = @_;
   #$categorybuffer = "Item: " . $element->att('id') ."\n" . $itembuffer . "\n";
   $categorybuffer .= "Item: " . $element->att('id') ."\n" . $itembuffer . "\n";
   $itembuffer = '';
}

#handle an item with a latin name
sub latin_name{
	my ($tree,$element) = @_;
	#print "Latin Names:" . $element->text . "\n";
	$itembuffer .= "Latin name: " . $element->text . "\n";
}


#handle an item with a common name 
sub common_name{
	my($tree, $element) = @_;
	#$itembuffer = "Common Name: " .$element->text ."\n";
	$itembuffer .= "Common name: " . $element->text . "\n";
}





