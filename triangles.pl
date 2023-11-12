#!/usr/bin/env perl

use strict;
use warnings; 
use diagnostics; 

use lib '.';
use lib '../lib';
use Modules::Triangles;
use Term::ANSIColor qw(:constants);
use Math::Trig;
use Data::Printer;

#           /|
#         / b|
#    C  /    |
#     /      |A
#   /       _| 
# /a       |.|
# ------------
#      B

# A = B*tan(a)
# B = A*tan(b)
# C = sqrt((A*A)+(B*B))

my $a = 35;
my $b = 55;
my $c = 90;

my $A = 10.50;
my $B = 15.00;
my $C = 18.31;


# disable autoflush (I/O buffer)
$| = 1;

my $DEBUG = 0;
my $o_triangle  = Modules::Triangles->new();

if ($DEBUG) {
    my $f_height    =  sprintf("%.2f", $o_triangle->calc_side_a_90($B, $a));
    my $f_distance  =  sprintf("%.2f", $o_triangle->calc_side_b_90($A, $b));
    my $f_diagonale =  sprintf("%.2f", $o_triangle->calc_side_c_90($A, $B));

    print("Result Height:    $f_height\n");
    print("Result Distance:  $f_distance\n");
    print("Result Diagonale: $f_diagonale\n");

    p $f_height;
    p $o_triangle;
}

while (!$DEBUG) {
    print("Please enter the side letter you want to calculate: \n");
    print("\t           /|\n\t         / b|\n\t    C  /    |\n\t     /      |A\n\t   /       _|\n\t /a       |.|\n\t ------------\n\t      B\n\te for exit\n");

    my $s_operation = <STDIN>;
    chomp($s_operation);

    if ($s_operation eq 'a') {
        print("Get a-side\n");
        print("\tEnter side-b:  ");
        my $f_side_b  = <STDIN>;
        chomp($f_side_b);
        print("\tEnter angle-a: ");
        my $f_angle_a = <STDIN>;
        chomp($f_angle_a);
        my $f_result = sprintf("%.2f", $o_triangle->calc_side_a_90($f_side_b, $f_angle_a));
        print(RED, "\t$f_side_b(side-b) * tan($f_angle_a)(angle-a) = $f_result(side-a)\n\n", RESET);
    }
    elsif ($s_operation eq 'b') {
        print("Get b-side\n");
        print("\tEnter side-a:  ");
        my $f_side_a  = <STDIN>;
        chomp($f_side_a);
        print("\tEnter angle-b: ");
        my $f_angle_b = <STDIN>;
        chomp($f_angle_b);
        my $f_result = sprintf("%.2f", $o_triangle->calc_side_b_90($f_side_a, $f_angle_b));
        print(RED, "\t$f_side_a(side-a) * tan($f_angle_b)(angle-b) = $f_result(side-b)\n\n", RESET);
    }
    elsif ($s_operation eq 'c') {
        print("Get a-side\n");
        print("\tEnter side-a:  ");
        my $f_side_a  = <STDIN>;
        chomp($f_side_a);
        print("\tEnter side-b:  ");
        my $f_side_b = <STDIN>;
        chomp($f_side_b);
        my $f_result = sprintf("%.2f", $o_triangle->calc_side_c_90($f_side_a, $f_side_b));
        print(RED, "\tsquare root of $f_side_a²(side-a) + $f_side_b²(side-b) = $f_result(side-a)\n\n", RESET);
    }
    elsif ($s_operation eq 'e') {
        print("Exiting programm... \n");
        last;
    }
    else {
        print(RED, "Error: Invalide input. \n\n", RESET);
    }
}


