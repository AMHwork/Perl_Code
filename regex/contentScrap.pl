#!/usr/bin/perl
print "Content-type: text/html\n\n";

use LWP::Simple;
use HTML::TreeBuilder;
use HTML::FormatText;

$URL = get("http://www.scriptsocket.com/");

$format = HTML::FormatText->new;
$treeBuilder = HTML::TreeBuilder->new;
$treeBuilder->parse($URL);

$parsed = $format->format($treeBuilder);

print "$parsed";

open (FILE, ">stuff.txt");
print FILE "$parsed";
close(FILE);

exit;