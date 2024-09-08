#!/usr/bin/env perl

use diagnostics;
use strict;
use warnings;

use lib '.';
use lib '../lib';

use Modules::Temperature;
use Term::ANSIColor qw(:constants);


sub from_celsius {
    my ($o_temperature, $f_temperature) = @_;

    my $f_kelvin     = $o_temperature->celsius_to_kelvin($f_temperature);
    my $f_celsius    = $o_temperature->kelvin_to_celsius($f_kelvin);
    my $f_fahrenheit = $o_temperature->kelvin_to_fahrenheit($f_kelvin);

    print(RED, "\t$f_celsius °C\n", RESET);
    print("\t$f_fahrenheit °F\n");
    print("\t$f_kelvin K\n");

    return 1;
}

sub from_fahrenheit {
    my ($o_temperature, $f_temperature) = @_;

    my $f_kelvin     = $o_temperature->fahrenheit_to_kelvin($f_temperature);
    my $f_celsius    = $o_temperature->kelvin_to_celsius($f_kelvin);
    my $f_fahrenheit = $o_temperature->kelvin_to_fahrenheit($f_kelvin);

    print("\t$f_celsius °C\n");
    print(RED, "\t$f_fahrenheit °F\n", RESET);
    print("\t$f_kelvin K\n");

    return 1;
}

sub from_kelvin {
    my ($o_temperature, $f_temperature) = @_;

    my $f_kelvin     = $f_temperature;
    my $f_celsius    = $o_temperature->kelvin_to_celsius($f_kelvin);
    my $f_fahrenheit = $o_temperature->kelvin_to_fahrenheit($f_kelvin);

    print("\t$f_celsius °C\n");
    print("\t$f_fahrenheit °F\n");
    print(RED, "\t$f_kelvin K\n", RESET);

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

    print("Please enter the temperature: ");
    my $f_temperature = <STDIN>;
    chomp($f_temperature);

    if (!($f_temperature =~ /\d/)) {
        die(RED, "Error: \"$f_temperature\" is not a valide temperature!", RESET);
    }
    elsif ($s_unit eq 'c') {
        from_celsius($o_temperature, $f_temperature);
    }
    elsif ($s_unit eq 'f') {
        from_fahrenheit($o_temperature, $f_temperature);
    }
    elsif ($s_unit eq 'k') {
        from_kelvin($o_temperature, $f_temperature);
    }
    else {
        die(RED, "Error: \"$s_unit\" is not a valide temperature unit!", RESET);
    }

    print("\n\n\t-- Enter 'q' to quit --\n");
    my $s_hold = <STDIN>;
    chomp($s_hold);
    last if $s_hold eq 'q';
}

