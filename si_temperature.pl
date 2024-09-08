#!/usr/bin/env perl

use diagnostics;
use strict;
use warnings;

use lib '.';
use lib '../lib';
use Modules::Temperature;
use Term::ANSIColor qw(:constants);


my $o_temperature = Modules::Temperature->new();

while (1) {
    system('clear');
    print("\n\n\nPlease enter the temperature you want to convert from: \n");
    print("[1]: Celsius \n[2]: Fahrenheit \n[3]: Kelvin\n[q]: quit\n");
    my $i_temp_from   = <STDIN>;
    chomp($i_temp_from);

    last unless($i_temp_from =~ /[1-3]/);

    print("Please enter the temperature you want to convert to: \n");
    print("[1]: Celsius \n[2]: Fahrenheit \n[3]: Kelvin\n");
    my $i_temp_to     = <STDIN>;
    chomp($i_temp_to);

    print("Please enter the temperature: \n");
    my $f_temperature = <STDIN>;
    chomp($f_temperature);

    my $s_from_temperature;
    my $s_to_temperature;
    my $f_result;

    if ($i_temp_from eq 1) {
        $s_from_temperature = 'Celsius';
        if ($i_temp_to eq 2) {
            $s_to_temperature = 'Fahrenheit';
            $f_result = $o_temperature->kelvin_to_fahrenheit($o_temperature->celsius_to_kelvin($f_temperature)); 
        }
        elsif ($i_temp_to eq 3) {
            $s_to_temperature = 'Kelvin';
            $f_result = $o_temperature->celsius_to_kelvin($f_temperature); 
        }
        else {
            die("Error: Invalide input!");
        }
    }
    elsif ($i_temp_from eq 2) {
        $s_from_temperature = 'Fahrenheit';
        if ($i_temp_to eq 1) {
            $s_to_temperature = 'Celsius';
            $f_result = $o_temperature->kelvin_to_celsius($o_temperature->fahrenheit_to_kelvin($f_temperature)); 
        }
        elsif ($i_temp_to eq 3) {
            $s_to_temperature = 'Kelvin';
            $f_result = $o_temperature->fahrenheit_to_kelvin($f_temperature); 
        }
        else {
            die("Error: Invalide input!");
        }
    }
    elsif ($i_temp_from eq 3) {
        $s_from_temperature = 'Kelvin';
        if ($i_temp_to eq 1) {
            $s_to_temperature = 'Celsius';
            $f_result = $o_temperature->kelvin_to_celsius($f_temperature); 
        }
        elsif ($i_temp_to eq 2) {
            $s_to_temperature = 'Fahrenheit';
            $f_result = $o_temperature->kelvin_to_fahrenheit($f_temperature); 
        }
        else {
            die("Error: Invalide input!");
        }
    }
    else {
        die("Error: Invalide input!");
    }

    my $f_formattet_result = sprintf("%.2f", $f_result);
    print(RED, "$f_temperature $s_from_temperature = $f_formattet_result $s_to_temperature\n\n\n", RESET);
    print('Please press enter to continue.');
    my $hold = <STDIN>;
}

