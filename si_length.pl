#!/usr/bin/env perl

use diagnostics;
use strict;
use warnings;

use lib '.';
use lib '../lib';

use Modules::Length;
use Term::ANSIColor qw(:constants);


sub from_mm {
    my ($o_length, $f_length) = @_; 

    my $f_mm   = $f_length;
    my $f_m    = $o_length->mm_to_meter($f_mm);

    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_mm($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_mile($f_m); 

    print(RED, "\t$f_mm mm\n", RESET);
    print("\t$f_cm cm\n");
    print("\t$f_m m\n");
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

sub from_cm {
    my ($o_length, $f_length) = @_; 

    my $f_cm   = $f_length;
    my $f_m    = $o_length->cm_to_meter($f_cm);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_mile($f_m); 

    print("\t$f_mm mm\n");
    print(RED, "\t$f_cm cm\n", RESET);
    print("\t$f_m m\n");
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


sub from_meter {
    my ($o_length, $f_length) = @_;

    my $f_m    = $f_length;

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_mile($f_m); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print(RED, "\t$f_m m\n", RESET);
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

    my $f_km   = $f_length;
    my $f_m    = $o_length->km_to_meter($f_km);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_mile($f_m); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print("\t$f_m m\n");
    print(RED, "\t$f_km km\n", RESET);
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

    my $f_au   = $f_length;
    my $f_m    = $o_length->au_to_meter($f_au);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_mile($f_m); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print("\t$f_m m\n");
    print("\t$f_km km\n");
    print(RED, "\t$f_au au\n", RESET);
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

    my $f_ly   = $f_length;
    my $f_m    = $o_length->ly_to_meter($f_ly);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_mile($f_m); 

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

sub from_parsec {
    my ($o_length, $f_length) = @_;

    my $f_ps   = $f_length; 
    my $f_m    = $o_length->parsec_to_meter($f_ps);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_mile($f_m); 

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

sub from_inch {
    my ($o_length, $f_length) = @_;

    my $f_inch = $f_length; 
    my $f_m    = $o_length->inch_to_meter($f_inch);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_mile($f_m); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print("\t$f_m m\n");
    print("\t$f_km km\n");
    print("\t$f_au au\n");
    print("\t$f_ly ly\n");
    print("\t$f_ps ps\n");
    print(RED, "\t$f_inch inch\n", RESET);
    print("\t$f_feet feet\n");
    print("\t$f_yard yard\n");
    print("\t$f_mile mile\n");

    return 1;
}

sub from_feet {
    my ($o_length, $f_length) = @_;

    my $f_feet = $f_length; 
    my $f_m    = $o_length->feet_to_meter($f_feet);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 
    my $f_mile = $o_length->meter_to_mile($f_m); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print("\t$f_m m\n");
    print("\t$f_km km\n");
    print("\t$f_au au\n");
    print("\t$f_ly ly\n");
    print("\t$f_ps ps\n");
    print("\t$f_inch inch\n");
    print(RED, "\t$f_feet feet\n", RESET);
    print("\t$f_yard yard\n");
    print("\t$f_mile mile\n");

    return 1;
}

sub from_yard {
    my ($o_length, $f_length) = @_;

    my $f_yard = $f_length; 
    my $f_m = $o_length->yard_to_meter($f_yard);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_mile = $o_length->meter_to_mile($f_m); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print("\t$f_m m\n");
    print("\t$f_km km\n");
    print("\t$f_au au\n");
    print("\t$f_ly ly\n");
    print("\t$f_ps ps\n");
    print("\t$f_inch inch\n");
    print("\t$f_feet feet\n");
    print(RED, "\t$f_yard yard\n", RESET);
    print("\t$f_mile mile\n");

    return 1;
}

sub from_mile {
    my ($o_length, $f_length) = @_;

    my $f_mile = $f_length; 
    my $f_m = $o_length->mile_to_meter($f_mile);

    my $f_mm   = $o_length->meter_to_mm($f_m); 
    my $f_cm   = $o_length->meter_to_cm($f_m); 
    my $f_km   = $o_length->meter_to_km($f_m); 
    my $f_au   = $o_length->meter_to_au($f_m); 
    my $f_ly   = $o_length->meter_to_ly($f_m); 
    my $f_ps   = $o_length->meter_to_parsec($f_m); 
    my $f_inch = $o_length->meter_to_inch($f_m); 
    my $f_feet = $o_length->meter_to_feet($f_m); 
    my $f_yard = $o_length->meter_to_yard($f_m); 

    print("\t$f_mm mm\n");
    print("\t$f_cm cm\n");
    print("\t$f_m m\n");
    print("\t$f_km km\n");
    print("\t$f_au au\n");
    print("\t$f_ly ly\n");
    print("\t$f_ps ps\n");
    print("\t$f_inch inch\n");
    print("\t$f_feet feet\n");
    print("\t$f_yard yard\n");
    print(RED, "\t$f_mile mile\n", RESET);

    return 1;
}


my $o_length = Modules::Length->new();

while(1){
    system('clear');

    print("\n\n[mm]: millimeter \n[cm]: centimeter \n[m ]: meter \n[km]: kilometer \n[au]: astronomical unit \n[ly]: light year \n[ps]: parsec \n[in]: inch \n[ft]: feet \n[yd]: yard \n[ml]: mile" );
    print("\nPlease enter a unit to convert from: ");
    my $s_unit = <STDIN>;
    chomp($s_unit);
    $s_unit = lc($s_unit);

    print("Please enter a length in your selected unit: ");
    my $f_length = <STDIN>;
    chomp($f_length);


    if (!($f_length =~ /\d/)) {
        die(RED, "Error: \"$f_length\" is not a valide lenght!", RESET);
    }
    elsif ($s_unit eq 'mm') {
        from_mm($o_length, $f_length);
    }
    elsif ($s_unit eq 'cm') {
        from_cm($o_length, $f_length);
    }
    elsif ($s_unit eq 'm') {
        from_meter($o_length, $f_length);
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
        from_parsec($o_length, $f_length);
    }
    elsif ($s_unit eq 'in') {
        from_inch($o_length, $f_length);
    }
    elsif ($s_unit eq 'ft') {
        from_feet($o_length, $f_length);
    }
    elsif ($s_unit eq 'yd') {
        from_yard($o_length, $f_length);
    }
    elsif ($s_unit eq 'ml') {
        from_mile($o_length, $f_length);
    }
    else {
        die(RED, "Error: \"$s_unit\" is not a valide unit of length!", RESET);
    }

    print("\n\n\t-- Enter 'q' to quit --\n");
    my $s_hold = <STDIN>;
    chomp($s_hold);
    last if $s_hold eq 'q';
}


