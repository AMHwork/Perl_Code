#!/usr/bin/perl

@car_prices = (78, 100, 250, 95, 1300, 4534, 102, 100, 97);
@flight_prices = (85.20, 79.99, 45.30, 130, 45.34, 110.25, 100, 917);

#reference to make them scalar
my $car_arrayref = \@car_prices; 
my $flight_arrayref = \@flight_prices; 

# define subroutines
sub min {
	my $min = $_[0];
	my $array = $_[0];

	@my_array = @$array;
	#print "@$array\n";
	foreach $element (@my_array) {
        if ($element < $min) {
        	$min = $element;
        }
    }
	
	#print "The min value is $min\n";
	return $min;
}

sub max {
	my $max = 0;
	my $array = $_[0];

	@my_array = @$array;
	
	foreach $element (@my_array) {
        if ($element > $max) {
        	$max = $element;
        }
    }

	#print "The max value is $max\n";
	return $max;
}

sub range {
	$max = max(@_);
    $min = min(@_);
    return($max - $min);
}

# write code below
$mincar = min($car_arrayref);
$maxcar = max($car_arrayref);

$minflight = min($flight_arrayref);
$maxflight = max($flight_arrayref);

print "The max value of car is $maxcar\n";
print "The min value of car is $mincar\n";

print "The max value of flight is $maxflight\n";
print "The min value of flight is $minflight\n";

print "the difference in price for car is ".range($car_arrayref)."\n";
print "the difference in price for flight is ".range($flight_arrayref)."\n";

#$difference_car = $maxcar - $mincar;
#print "the difference in price for car is $difference_car\n";
#$difference_flight = $maxflight - $minflight;
#print "the difference in price for flight is $difference_flight\n";

#this works too, I just wanted to make the code look nice
#$difference_flight = max($flight_arrayref) - min($flight_arrayref);





