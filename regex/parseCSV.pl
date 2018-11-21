#!/usr/bin/perl


my $csv_data = shift;

my %data;
my @data2;

open(my $fh, $csv_data)
     or die "Could not open file '$filename'";

while (my $row = <$fh>) {

	#my @lines = split( /\n/, $row );
	my ($id,undef,$capital,$population) = split( /,/, $row);

	next if $id == '1:id';

	$data{ $population } = $capital

}

my ($max) = sort {$b <=> $a} keys %data;

print "$data{ $max } is the most populated capital";


sub sort_by_population
{
	my $csv_data = shift;

    my %data;

	#my @lines = split( /\n/, $csv_data );
	foreach my $line (@lines)
	{
		my ($id,undef,$capital,$population) = split( /,/, $line );

		next if $id == '1:id';
        
        #leave this
		$data{ $population } = $capital;
	}
	
	#swap $b = $a
	my ($max) = sort {$b <=> $a} keys %data;

	return "$data{ $max } is the most populated capital";
}




#
#foreach my $line (@lines){
#	
#	my ($id,undef,$capital,$population) = split( /,/, $line );
#	
#	next if $id == '1:id';
#
#	$data{ $population } = $capital;
#
#}
#my ($max) = sort {$a <=> $b} keys %data;
#
#print "$data { $max } is the most populated capital";
   