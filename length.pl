#!/usr/bin/env perl

use diagnostics;
use strict;
use warnings;

use lib '.';
use lib '../lib';

use Modules::Length;
use Term::ANSIColor qw(:constants);


sub from_meters {
    my ($o_length, $f_length) = @_;

    my $f_mm   = $o_length->meter_to_mm($f_length); 
    my $f_cm   = $o_length->meter_to_cm($f_length); 
    my $f_km   = $o_length->meter_to_km($f_length); 
    my $f_au   = $o_length->meter_to_au($f_length); 
    my $f_ly   = $o_length->meter_to_ly($f_length); 
    my $f_ps   = $o_length->meter_to_parsec($f_length); 
    my $f_inch = $o_length->meter_to_inch($f_length); 
    my $f_feet = $o_length->meter_to_feet($f_length); 
    my $f_yard = $o_length->meter_to_yard($f_length); 
    my $f_mile = $o_length->meter_to_miles($f_length); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print(RED, "\t$f_length m\n", RESET);
    print("\t$f_km km\n");
    print("\t$f_au au\n");
    print("\t$f_ly ly\n");
    print("\t$f_ps ps\n");
    print("\t$f_inch inch\n");
    print("\t$f_feet feet\n");
    print("\t$f_yard yard\n");
    print("\t$f_mile mile\n");

    return 1;
}

sub from_km {
    my ($o_length, $f_length) = @_;

    my $f_m = $o_length->km_to_meter($f_length);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_miles($f_m); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print("\t$f_m m\n");
print(RED, "\t$f_length km\n", RESET);
    print("\t$f_au au\n");
    print("\t$f_ly ly\n");
    print("\t$f_ps ps\n");
    print("\t$f_inch inch\n");
    print("\t$f_feet feet\n");
    print("\t$f_yard yard\n");
    print("\t$f_mile mile\n");

    return 1;
}

sub from_au {
    my ($o_length, $f_length) = @_;

    my $f_m = $o_length->au_to_meter($f_length);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_miles($f_m); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print("\t$f_m m\n");
    print("\t$f_km km\n");
    print(RED, "\t$f_length au\n", RESET);
    print("\t$f_ly ly\n");
    print("\t$f_ps ps\n");
    print("\t$f_inch inch\n");
    print("\t$f_feet feet\n");
    print("\t$f_yard yard\n");
    print("\t$f_mile mile\n");

    return 1;
}

sub from_ly {
    my ($o_length, $f_length) = @_;

    my $f_m = $o_length->ly_to_meter($f_length);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_miles($f_m); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print("\t$f_m m\n");
    print("\t$f_km km\n");
    print("\t$f_au au\n");
    print(RED, "\t$f_ly ly\n", RESET);
    print("\t$f_ps ps\n");
    print("\t$f_inch inch\n");
    print("\t$f_feet feet\n");
    print("\t$f_yard yard\n");
    print("\t$f_mile mile\n");

    return 1;
}

sub from_ps {
    my ($o_length, $f_length) = @_;

    my $f_m = $o_length->ps_to_meter($f_length);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_miles($f_m); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print("\t$f_m m\n");
    print("\t$f_km km\n");
    print("\t$f_au au\n");
    print("\t$f_ly ly\n");
    print(RED, "\t$f_ps ps\n", RESET);
    print("\t$f_inch inch\n");
    print("\t$f_feet feet\n");
    print("\t$f_yard yard\n");
    print("\t$f_mile mile\n");

    return 1;
}


my $o_length = Modules::Length->new();

while(1){
    system('clear');
    print("\n\n\n[m]:meter, [km]:kilometer, [au]:astronomical unit, [ly]: light year, [ps]: parsec");
    print("\nPlease enter a unit to convert from: ");
    my $s_unit = <STDIN>;
    chomp($s_unit);
    print("Please enter a length in your selected unit: ");
    my $f_length = <STDIN>;
    chomp($f_length);

    last unless($f_length =~ /\d/);

    if ($s_unit eq 'm') {
        from_meters($o_length, $f_length);
    }
    elsif ($s_unit eq 'km') {
        from_km($o_length, $f_length);
    }
    elsif ($s_unit eq 'au') {
        from_au($o_length, $f_length);
    }
    elsif ($s_unit eq 'ly') {
        from_ly($o_length, $f_length);
    }
    elsif ($s_unit eq 'ps') {
        from_ps($o_length, $f_length);
    }
    else {
        die('Error: Invalide input ');
    }
    print("\n\n\t-- Enter 'q' to quit --\n");
    my $hold = <STDIN>;
    chomp($hold);
    last if $hold eq 'q';
}


