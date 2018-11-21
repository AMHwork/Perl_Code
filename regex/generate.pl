#!/usr/bin/perl

my @array;
my $arrayref = \@array;
my $counter = 0;
my $arrayref2 = \@array2;

foreach my $value (1..20){
	if ($value % 2 == 0){
		if ($value % 4 == 0){
			for (my $i = $value; $i > 0; $i--){
				if ($i % 2){
					$counter++;
					if ($counter <= 4){
						#print "$i, ";
						push(@array2, $i);
						#sort the array in ascending order
						@sort = sort {$a <=> $b} @array2;
					}
				}
			}
			#remove duplicates and push into array
			@uniq = uniq(@sort);
			push(@array, @uniq);
			
			#clear all arrays and counters for the next loop
			@array2 = ();
			$counter = 0;
			#print "\n";
		}
		push (@array, $value);
		#print "$value";
		#print "\n";
	}
}

# function to help remove duplicates
sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

print "@array";

