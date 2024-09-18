#!/usr/bin/env perl

use diagnostics;
use strict;
use warnings;

use lib '.';
use lib '../lib';

use Modules::Length;
use Term::ANSIColor qw(:constants);


sub convert {
    my ($o_length, $f_length, $s_unit) = @_;

    my $f_meter;
    if ($s_unit eq 'mm') {
        $f_meter = $o_length->mm_to_meter($f_length);
    }
    elsif ($s_unit eq 'cm') {
        $f_meter = $o_length->cm_to_meter($f_length);
    }
    elsif ($s_unit eq 'm') {
        $f_meter = $f_length;
    }
    elsif ($s_unit eq 'km') {
        $f_meter = $o_length->km_to_meter($f_length);
    }
    elsif ($s_unit eq 'au') {
        $f_meter = $o_length->au_to_meter($f_length);
    }
    elsif ($s_unit eq 'ly') {
        $f_meter = $o_length->ly_to_meter($f_length);
    }
    elsif ($s_unit eq 'ps') {
        $f_meter = $o_length->parsec_to_meter($f_length);
    }
    elsif ($s_unit eq 'in') {
        $f_meter = $o_length->inch_to_meter($f_length);
    }
    elsif ($s_unit eq 'ft') {
        $f_meter = $o_length->feet_to_meter($f_length);
    }
    elsif ($s_unit eq 'yd') {
        $f_meter = $o_length->yard_to_meter($f_length);
    }
    elsif ($s_unit eq 'ml') {
        $f_meter = $o_length->mile_to_meter($f_length);
    }

    my %h_conversions = (
        'f_meter' => $f_meter,
        'f_mm'    => $o_length->meter_to_mm($f_meter    ),
        'f_cm'    => $o_length->meter_to_cm($f_meter    ),
        'f_km'    => $o_length->meter_to_km($f_meter    ),
        'f_au'    => $o_length->meter_to_au($f_meter    ),
        'f_ly'    => $o_length->meter_to_ly($f_meter    ),
        'f_ps'    => $o_length->meter_to_parsec($f_meter),
        'f_inch'  => $o_length->meter_to_inch($f_meter  ),
        'f_feet'  => $o_length->meter_to_feet($f_meter  ),
        'f_yard'  => $o_length->meter_to_yard($f_meter  ),
        'f_mile'  => $o_length->meter_to_mile($f_meter  ),
    );

    return %h_conversions;
}

sub present {
    my ($f_length, $s_unit, %h_conversions) = @_;

    my $f_meter = $h_conversions{'f_meter'};
    my $f_mm    = $h_conversions{'f_mm'   };
    my $f_cm    = $h_conversions{'f_cm'   };
    my $f_km    = $h_conversions{'f_km'   };
    my $f_au    = $h_conversions{'f_au'   };
    my $f_ly    = $h_conversions{'f_ly'   };
    my $f_ps    = $h_conversions{'f_ps'   };
    my $f_inch  = $h_conversions{'f_inch' };
    my $f_feet  = $h_conversions{'f_feet' };
    my $f_yard  = $h_conversions{'f_yard' };
    my $f_mile  = $h_conversions{'f_mile' };

    if ($s_unit eq 'm') {
        print(RED, "\n\t$f_length meter\n", RESET);
    }
    elsif ($s_unit eq 'mm') {
        print(RED, "\n\t$f_length mm\n", RESET);
    }
    elsif ($s_unit eq 'cm') {
        print(RED, "\n\t$f_length cm\n", RESET);
    }
    elsif ($s_unit eq 'km') {
        print(RED, "\n\t$f_length km\n", RESET);
    }
    elsif ($s_unit eq 'au') {
        print(RED, "\n\t$f_length au\n", RESET);
    }
    elsif ($s_unit eq 'ly') {
        print(RED, "\n\t$f_length ly\n", RESET);
    }
    elsif ($s_unit eq 'ps') {
        print(RED, "\n\t$f_length ps\n", RESET);
    }
    elsif ($s_unit eq 'in') {
        print(RED, "\n\t$f_length inch\n", RESET);
    }
    elsif ($s_unit eq 'ft') {
        print(RED, "\n\t$f_length feet\n", RESET);
    }
    elsif ($s_unit eq 'yd') {
        print(RED, "\n\t$f_length yard\n", RESET);
    }
    elsif ($s_unit eq 'ml') {
        print(RED, "\n\t$f_length mile\n", RESET);
    }

    print("\t$f_meter meter\n") unless ($s_unit eq 'm' );
    print("\t$f_mm mm\n"      ) unless ($s_unit eq 'mm');
    print("\t$f_cm cm\n"      ) unless ($s_unit eq 'cm');
    print("\t$f_km km\n"      ) unless ($s_unit eq 'km');
    print("\t$f_au au\n"      ) unless ($s_unit eq 'au');
    print("\t$f_ly ly\n"      ) unless ($s_unit eq 'ly');
    print("\t$f_ps ps\n"      ) unless ($s_unit eq 'ps');
    print("\t$f_inch inch\n"  ) unless ($s_unit eq 'in');
    print("\t$f_feet feet\n"  ) unless ($s_unit eq 'ft');
    print("\t$f_yard yard\n"  ) unless ($s_unit eq 'yd');
    print("\t$f_mile mile\n"  ) unless ($s_unit eq 'ml');

    return 1;
}


my $o_length = Modules::Length->new();
while(1){
    system('clear');

    print("\n\n[mm]: millimeter \n[cm]: centimeter \n[m ]: meter \n[km]: kilometer \n[au]: astronomical unit \n[ly]: light year \n[ps]: parsec");
    print("\n[in]: inch \n[ft]: feet \n[yd]: yard \n[ml]: mile" );
    print("\nPlease enter the unit you want to convert from: ");
    my $s_unit = <STDIN>;
    chomp($s_unit);
    $s_unit = lc($s_unit);
    die(RED, "Error: \"$s_unit\" is not a valide length unit!", RESET) 
        unless($s_unit eq 'mm' || $s_unit eq 'cm' || $s_unit eq 'm' || $s_unit eq 'km' || $s_unit eq 'au' || $s_unit eq 'ly' || $s_unit eq 'ps' || $s_unit eq 'in' || $s_unit eq 'ft' || $s_unit eq 'yd' || $s_unit eq 'ml');

    print("Please enter the length you want to convert from: ");
    my $f_length = <STDIN>;
    chomp($f_length);
    die(RED, "Error: \"$f_length\" is not a valide length!", RESET)
        unless($f_length =~ /\d/);

    my %h_conversions = convert($o_length, $f_length, $s_unit);
    present($f_length, $s_unit, %h_conversions);

    print("\n\n\t-- Enter 'q' to quit --\n");
    my $s_hold = <STDIN>;
    chomp($s_hold);
    last if $s_hold eq 'q';
}


