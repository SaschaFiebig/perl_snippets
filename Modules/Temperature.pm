#!usr/bin/env perl

package Modules::Temperature;

use strict;
use warnings;
use diagnostics;



sub new {
    my $o_class = shift;
    return bless({}, $o_class);
}

sub kelvin_to_celsius {
    my ($self, $f_kelvin) = @_;
    my $f_celsius = $f_kelvin - 273.15;
    return $f_celsius;
}

sub kelvin_to_fahrenheit {
    my ($self, $f_kelvin) = @_;
    my $f_fahrenheit = 9 / 5 * ($f_kelvin - 273.15) + 32;
    return $f_fahrenheit;
}

sub celsius_to_kelvin {
    my ($self, $f_celsius) = @_;
    my $f_kelvin = $f_celsius + 273.15;
    return $f_kelvin;
}

sub fahrenheit_to_kelvin {
    my ($self, $f_fahrenheit) = @_;
    my $f_kelvin =  5 / 9 * ($f_fahrenheit - 32) + 273.15;
    return $f_kelvin;
}


return 1

