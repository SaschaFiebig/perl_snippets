#!/usr/bin/env perl

package Modules::Mass;

use strict;
use warnings;
use diagnostics;

sub new {
    my $o_class = shift;
    return bless({}, $o_class);
}

# units 
    # mg (miligram)
    # g  (gram)
    # kg (kilogram)
    # kt (kiloton)
    # lb (pound)
    # oz (ounce)
    # gr (grain)

sub kilogram_to_milligram {
    my ($self, $f_kilogram) = @_;
    my $f_milligram = $f_kilogram * 1_000_000;
    return $f_milligram;
}
sub milligram_to_kilogram {
    my ($self, $f_milligram) = @_;
    my $f_kilogram = $f_milligram / 1_000_000;
    return $f_kilogram;
}

sub kilogram_to_gram {
    my ($self, $f_kilogram) = @_;
    my $f_gram = $f_kilogram * 1_000;
    return $f_gram;
}
sub gram_to_kilogram {
    my ($self, $f_gram) = @_;
    my $f_kilogram = $f_gram / 1_000;
    return $f_kilogram;
}

sub kilogram_to_kiloton {
    my ($self, $f_kilogram) = @_;
    my $f_kiloton = $f_kilogram / 1_000;
    return $f_kiloton;
}
sub kiloton_to_kilogram {
    my ($self, $f_kiloton) = @_;
    my $f_kilogram = $f_kiloton * 1_000;
    return $f_kilogram;
}

sub kilogram_to_pound {
    my ($self, $f_kilogram) = @_;
    my $f_pound = $f_kilogram / 0.4535924;
    return $f_pound;
}
sub pound_to_kilogram {
    my ($self, $f_pound) = @_;
    my $f_kilogram = $f_pound * 0.4535924;
    return $f_kilogram;
}

sub kilogram_to_ounce {
    my ($self, $f_kilogram) = @_;
    my $f_ounce = $f_kilogram / 0.02834952;
    return $f_ounce;
}
sub ounce_to_kilogram {
    my ($self, $f_ounce) = @_;
    my $f_kilogram = $f_ounce * 0.02834952;
    return $f_kilogram;
}

sub kilogram_to_grain {
    my ($self, $f_kilogram) = @_;
    my $f_grain = $f_kilogram / 0.00006479891; 
    return $f_grain;
}
sub grain_to_kilogram {
    my ($self, $f_grain) = @_;
    my $f_kilogram = $f_grain * 0.00006479891;
    return $f_kilogram;
}

return 1;

