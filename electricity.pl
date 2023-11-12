#!/bin/env perl

#########################################################################
#
# code for doing math related to electronics 
#
#########################################################################

use strict;
use warnings;
use diagnostics;

use Term::ANSIColor qw(:constants);

use lib '.';
use Modules::Electricity;

#      A
#     / \
#    / V \
#   /-----\ 
#  / O | A \
# /____|____\

#      /\
#     /  \
#    / Wh \
#   /------\ 
#  / Ah | V \
# /_____|____\


my $o_elec = Modules::Electricity->new();

while(1){
    print("Please enter the operation you want to execute: \n");
    print("\tv: get volts\n\to: get ohms\n\ta: get ampere\n\te: exit\n");

    my $s_operation = <STDIN>;
    chomp($s_operation);

    if ($s_operation eq 'v') {
        print(UNDERLINE, "Volt operation\n", RESET);
        print("\tEnter Ohm: ");
        my $f_ohm = <STDIN>;
        print("\tEnter Amp: ");
        my $f_amp = <STDIN>;
        chomp($f_ohm);
        chomp($f_amp);
        my $f_result = $o_elec->calc_volts($f_ohm, $f_amp);
        print(RED, "\t$f_ohm Ohm x $f_amp Amp = $f_result Volt\n\n\n\n", RESET);
    }
    elsif ($s_operation eq 'o') {
        print(UNDERLINE, "Ohm operation.\n", RESET);
        print("\tEnter Volt: ");
        my $f_volt = <STDIN>;
        print("\tEnter Amp: ");
        my $f_amp  = <STDIN>;
        chomp($f_volt);
        chomp($f_amp);
        my $f_result = $o_elec->calc_ohms($f_volt, $f_amp);
        print(RED, "\t$f_volt Volt / $f_amp Amp = $f_result Ohm\n\n\n\n", RESET);
    }
    elsif ($s_operation eq 'a') {
        print(UNDERLINE, "Amp operation.\n", RESET);
        print("\tEnter Volt: ");
        my $f_volt = <STDIN>;
        print("\tEnter Ohm: ");
        my $f_ohm  = <STDIN>;
        chomp($f_volt);
        chomp($f_ohm);
        my $f_result = $o_elec->calc_amps($f_volt, $f_ohm);
        print(RED, "\t$f_volt Volt / $f_ohm Ohm = $f_result Amp\n\n\n\n", RESET);
    }
    elsif ($s_operation eq 'e') {
        print("Exiting programm...\n");
        last;
    }
    else {
        print(UNDERLINE, RED, "Error: Invalide input.\n\n", RESET);
    }
}


