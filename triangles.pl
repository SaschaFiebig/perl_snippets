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

my $f_A_result = sprintf("%.2f", $B*tan(deg2rad($a)));
my $f_B_result = sprintf("%.2f", $A*tan(deg2rad($b)));
my $f_C_result = sprintf("%.2f", sqrt(($A*$A)+($B*$B)));

print("Result A:         $f_A_result\n");
print("Result B:         $f_B_result\n");
print("Result C:         $f_C_result\n\n");



my $o_triangle  = Modules::Triangles->new();

my $f_height    =  sprintf("%.2f", $o_triangle->calc_side_a_90($B, $a));
my $f_distance  =  sprintf("%.2f", $o_triangle->calc_side_b_90($A, $b));
my $f_diagonale =  sprintf("%.2f", $o_triangle->calc_side_c_90($A, $B));

print("Result Height:    $f_height\n");
print("Result Distance:  $f_distance\n");
print("Result Diagonale: $f_diagonale\n");


p $f_height;
p $o_triangle;



