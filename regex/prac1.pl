#!/usr/bin/perl

%car_catalog = ("BMW Series 5" => 100000, "Mercedes 2000" => 250000, 
	            "Toyota Corolla" => 20000, "Lexus 3" =>  95000);
@my_wishlist = ("BMW Series 5", "Toyota Corolla");
print "I would like to buy one $my_wishlist[0] for the price of \$$car_catalog{$my_wishlist[0]} Dollars.\n";
print "I would like to buy one $my_wishlist[1] for the price of \$$car_catalog{$my_wishlist[1]} Dollars.\n";