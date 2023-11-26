#!usr/bin/env perl

package Modules::Length;

use strict;
use warnings;
use diagnostics; 


sub new {
    my $o_class = shift;
    return bless({}, $o_class);
}


# units 
    # meter 
    # mm 
    # cm 
    # km 
    # astronomical units 
    # light year
    # parsec 
    # inch 
    # feed 
    # yard 
    # miles 

sub meter_to_mm {
    my ($self, $f_meter) = @_;
    my $f_mm = $f_meter * 100 * 10;
    return $f_mm;
}


sub meter_to_cm {
    my ($self, $f_meter) = @_;
    my $f_cm = $f_meter * 100;
    return $f_cm;
}


sub meter_to_km {
    my ($self, $f_meter) = @_;
    my $f_km = $f_meter / 1_000;
    return $f_km;
}
sub km_to_meter {
    my ($self, $f_km) = @_;
    my $f_m = $f_km * 1_000;
    return $f_m;
}


sub meter_to_au {
    my ($self, $f_meter) = @_;
    my $f_au = $f_meter / 149_597_870_700; 
    return $f_au;
}
sub au_to_meter {
    my ($self, $f_au) = @_;
    my $f_meter = $f_au * 149_597_870_700;
}

sub meter_to_ly {
    my ($self, $f_meter) = @_;
    my $f_ly = $f_meter / 9_460_730_472_580_800;
    return $f_ly;
}
sub ly_to_meter {
    my ($self, $f_ly) = @_;
    my $f_meter = $f_ly * 9_460_730_472_580_800;
}


sub meter_to_parsec {
    my ($self, $f_meter) = @_;
    my $f_parsec = $f_meter / 30_856_775_814_913_673;
    return $f_parsec;
}
sub ps_to_meter {
    my ($self, $f_ps) = @_;
    my $f_meter = $f_ps * 30_856_775_814_913_673;
}


sub meter_to_inch {
    my ($self, $f_meter) = @_;
    my $f_inch = $f_meter * 39.37008;
    return $f_inch;
}

sub meter_to_feet {
    my ($self, $f_meter) = @_;
    my $f_feet = $f_meter * 3.28084;
    return $f_feet; 
}

sub meter_to_yard {
    my ($self, $f_meter) = @_;
    my $f_yard = $f_meter / 1.093613;
    return $f_yard;
}

sub meter_to_miles {
    my ($self, $f_meter) = @_;
    my $f_miles = $f_meter * 0.0006213712;
    return $f_miles;
}

return 1;

