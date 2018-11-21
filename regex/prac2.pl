#!/usr/bin/perl

@family = ('Homer', 'Moe', 'Maggie', 'Marge', 'bobobo');
%shoe_color = ('Lisa' => 'red', 'Homer' => 'brown', 
	           'Maggie' => 'pink', 'Marge' => 'blue', 
	           'Bart' => 'yellow');
%shoe_size = ('Moe' => 9, 'Lisa' => 7, 'Homer' => 12, 'Bart' => 8, 'Maggie' => 4);
# start your code here

foreach $person (@family){

	if ( exists $family[$person] && $shoe_color{$person} && $shoe_size{$person}){
	
		if ($shoe_size{$person} > 10){
       	 	print "$person wears large $shoe_color{$person} shoes size $shoe_size{$person}\n"
		}
		else {
			print "$person wears small $shoe_color{$person} shoes size $shoe_size{$person}\n"
		}
		
	}
	elsif (exists $family[$person] && !exists $shoe_color{$person} && exists $shoe_size{$person}){
        
        #adding the shoe colour to the $shoe_color hash variable  
		$shoe_color{$person} = 'black';

		if ($shoe_size{$person} > 10 ){
       	 	print "$person wears large $shoe_color{$person} shoes size $shoe_size{$person}\n"
		}
		else {
			print "$person wears small $shoe_color{$person} shoes size $shoe_size{$person}\n"
		}

	}
	elsif (exists $family[$person] && !exists $shoe_size{$person} && exists $shoe_color{$person}){
		
		#adding the shoe size to the $shoe_size hash variable 
		$shoe_size{$person} = '99';

		if ($shoe_size{$person} > 10 ){
       	 	print "$person wears large $shoe_color{$person} shoes size $shoe_size{$person}\n"
		}
		else {
			print "$person wears small $shoe_color{$person} shoes size $shoe_size{$person}\n"
		}

	}
	elsif (exists $family[$person] && !exists $shoe_size{$person} && !exists $shoe_color{$person}){
		print "$person does not exists\n";
	}

}

