#!/usr/bin/env perl

use diagnostics;
use strict;
use warnings;

use lib '.';
use lib '../lib';

use Modules::Temperature;
use Term::ANSIColor qw(:constants);


sub convert {
    my ($o_temperature, $f_temperature, $s_unit) = @_;
    # subroutine to convert to relevant units 

    # convert input unit to kelvin
    my $f_kelvin;
    if ($s_unit eq 'c') {
        $f_kelvin = $o_temperature->celsius_to_kelvin($f_temperature);
    }
    elsif ($s_unit eq 'f') {
        $f_kelvin = $o_temperature->fahrenheit_to_kelvin($f_temperature);
    }
    elsif ($s_unit eq 'k') {
        $f_kelvin = $f_temperature;
    }

    my %h_conversions = (
        'f_kelvin'     => $f_kelvin,
        'f_celsius'    => $o_temperature->kelvin_to_celsius($f_kelvin),
        'f_fahrenheit' => $o_temperature->kelvin_to_fahrenheit($f_kelvin),
    );

    return %h_conversions;
}

sub present {
    my ($f_temperature, $s_unit, %h_conversions) = @_;
    # subroutine to print out values to screen

    # extract values
    my $f_celsius    = $h_conversions{'f_celsius'   };
    my $f_fahrenheit = $h_conversions{'f_fahrenheit'};
    my $f_kelvin     = $h_conversions{'f_kelvin'    };

    # print out and highlight source value
    if ($s_unit eq 'c') {
        print(RED, "\n\t$f_temperature °C\n", RESET);
    }
    elsif ($s_unit eq 'f') {
        print(RED, "\n\t$f_temperature °F\n", RESET);
    }
    elsif ($s_unit eq 'k') {
        print(RED, "\n\t$f_temperature  K\n", RESET);
    }

    print("\t$f_celsius °C\n"   ) unless ($s_unit eq 'c');
    print("\t$f_fahrenheit °F\n") unless ($s_unit eq 'f');
    print("\t$f_kelvin K\n"     ) unless ($s_unit eq 'k');

    return 1;
}


my $o_temperature = Modules::Temperature->new();
while (1) {
    system('clear');

    print("\n\n[C]: Celsius \n[F]: Fahrenheit \n[K]: Kelvin\n[q]: quit");
    print("\nPlease enter the unit you want to convert from: ");
    my $s_unit = <STDIN>;
    chomp($s_unit);
    $s_unit = lc($s_unit);
    die(RED, "Error: \"$s_unit\" is not a valide temperature unit!", RESET) 
        unless($s_unit eq 'c' || $s_unit eq 'f' || $s_unit eq 'k'); 

    print("Please enter the temperature you want to convert from: ");
    my $f_temperature = <STDIN>;
    chomp($f_temperature);
    die(RED, "Error: \"$f_temperature\" is not a valide temperature!", RESET) 
        unless($f_temperature =~ /\d/); 

    my %h_conversions = convert($o_temperature, $f_temperature, $s_unit);
    present($f_temperature, $s_unit, %h_conversions);

    print("\n\n\t-- Enter 'q' to quit --\n");
    my $s_hold = <STDIN>;
    chomp($s_hold);
    last if $s_hold eq 'q';
}

