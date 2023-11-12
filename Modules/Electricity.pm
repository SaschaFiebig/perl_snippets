#!/usr/bin/env perl

package Modules::Electricity;

use strict;
use warnings;
use diagnostics;


# constructor 
sub new {
    my $o_class = shift;

    return bless({}, $o_class);
}


### Amps, Ohms, Volts ###################################################

sub calc_amps {
    my ($self, $f_volt, $f_ohm) = @_; 
    my $f_amps = $f_volt / $f_ohm;
    return $f_amps;
}

sub calc_ohms {
    my ($self, $f_volt, $f_amp) = @_; 
    my $f_ohms = $f_volt / $f_amp;
    return $f_ohms;
}

sub calc_volts {
    my ($self, $f_amp, $f_ohm) = @_;
    my $f_volts = $f_ohm * $f_amp;
    return $f_volts;
}


### Amp-Hours, Volt, Whatt-Hours ########################################

sub calc_amp_hours {
    my ($self, $f_w_hours, $f_volts) = @_;
    my $f_amp_hours = $f_w_hours / $f_volts;
    return $f_amp_hours;
}

sub calc_volts2 {
    my ($self, $f_w_hours, $f_a_hours) = @_;
    my $f_volts = $f_w_hours / $f_a_hours;
    return $f_volts;
}

sub calc_watt_hours {
    my ($self, $f_a_hours, $f_volts) = @_;
    my $f_watt_hours = $f_a_hours * $f_volts;
    return $f_watt_hours;
}


return 1;

