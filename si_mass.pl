#!/usr/bin/env perl

use diagnostics;
use strict; 
use warnings;

use lib '.';
use lib '../lib';

use Modules::Mass;
use Term::ANSIColor qw(:constants);

sub convert {
    my ($o_mass, $f_mass, $s_unit) = @_;

    my $f_kilogram;
    if ($s_unit eq 'mg') {
        $f_kilogram = $o_mass->milligram_to_kilogram($f_mass);
    }
    elsif ($s_unit eq 'g') {
        $f_kilogram = $o_mass->gram_to_kilogram($f_mass);
    }
    elsif ($s_unit eq 'kg') {
        $f_kilogram = $f_mass;
    }
    elsif ($s_unit eq 'kt') {
        $f_kilogram = $o_mass->kiloton_to_kilogram($f_mass);
    }
    elsif ($s_unit eq 'lb') {
        $f_kilogram = $o_mass->pound_to_kilogram($f_mass);
    }
    elsif ($s_unit eq 'oz') {
        $f_kilogram = $o_mass->ounce_to_kilogram($f_mass);
    }
    elsif ($s_unit eq 'gr') {
        $f_kilogram = $o_mass->grain_to_kilogram($f_mass);
    }

    my %h_conversions = (
        'f_kilogram'  => $f_kilogram,
        'f_milligram' => $o_mass->kilogram_to_milligram($f_kilogram),
        'f_gram'      => $o_mass->kilogram_to_gram($f_kilogram     ),
        'f_kiloton'   => $o_mass->kilogram_to_kiloton($f_kilogram  ),
        'f_pound'     => $o_mass->kilogram_to_pound($f_kilogram    ),
        'f_ounce'     => $o_mass->kilogram_to_ounce($f_kilogram    ),
        'f_grain'     => $o_mass->kilogram_to_grain($f_kilogram    ),
    );

    return %h_conversions;
}

sub present {
    my ($f_mass, $s_unit, %h_conversions) = @_;

    my $f_kilogram  = $h_conversions{'f_kilogram' };
    my $f_milligram = $h_conversions{'f_milligram'};
    my $f_gram      = $h_conversions{'f_gram'     };
    my $f_kiloton   = $h_conversions{'f_kiloton'  };
    my $f_pound     = $h_conversions{'f_pound'    };
    my $f_ounce     = $h_conversions{'f_ounce'    };
    my $f_grain     = $h_conversions{'f_grain'    };

    if ($s_unit eq 'kg') {
        print(RED, "\n\t$f_mass kg\n", RESET);
    }
    elsif ($s_unit eq 'mg') {
        print(RED, "\n\t$f_mass mg\n", RESET);
    }
    elsif ($s_unit eq  'g') {
        print(RED, "\n\t$f_mass  g\n", RESET);
    }
    elsif ($s_unit eq 'kt') {
        print(RED, "\n\t$f_mass kt\n", RESET);
    }
    elsif ($s_unit eq 'lb') {
        print(RED, "\n\t$f_mass lb\n", RESET);
    }
    elsif ($s_unit eq 'oz') {
        print(RED, "\n\t$f_mass oz\n", RESET);
    }
    elsif ($s_unit eq 'gr') {
        print(RED, "\n\t$f_mass gr\n", RESET);
    }

    print("\t$f_kilogram kg\n" ) unless ($s_unit eq 'kg');
    print("\t$f_milligram mg\n") unless ($s_unit eq 'mg');
    print("\t$f_gram  g\n"     ) unless ($s_unit eq  'g');
    print("\t$f_kiloton kt\n"  ) unless ($s_unit eq 'kt');
    print("\t$f_pound lb\n"    ) unless ($s_unit eq 'lb');
    print("\t$f_ounce oz\n"    ) unless ($s_unit eq 'oz');
    print("\t$f_grain gr\n"    ) unless ($s_unit eq 'gr');

    return 1;
}


my $o_mass = Modules::Mass->new();
while (1) {
    system('clear');

    print("\n\n[MG]: MilliGram \n[G]:  Gram \n[KG]: KiloGram \n[KT]: KiloTon \n[LB]: Pound \n[OZ]: Ounce \n[GR]: Grain");
    print("\nPlease enter the unit you want to convert from: ");
    my $s_unit = <STDIN>;
    chomp($s_unit);
    $s_unit = lc($s_unit);
    die(RED, "Error: \"$s_unit\" is not a valide mass unit!", RESET) 
        unless($s_unit eq 'mg' || $s_unit eq 'g' || $s_unit eq 'kg' || $s_unit eq 'kt' || $s_unit eq 'lb' || $s_unit eq 'oz' || $s_unit eq 'gr'); 

    print("Please enter the mass you want to convert from: ");
    my $f_mass = <STDIN>;
    chomp($f_mass);
    die(RED, "Error: \"$f_mass\" is not a valide mass!", RESET) 
        unless($f_mass =~ /\d/); 

    my %h_conversions = convert($o_mass, $f_mass, $s_unit);
    present($f_mass, $s_unit, %h_conversions);

    print("\n\n\t-- Enter 'q' to quit --\n");
    my $s_hold = <STDIN>;
    chomp($s_hold);
    last if $s_hold eq 'q';

}

