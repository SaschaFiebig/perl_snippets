#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics; 

use lib '.';
use lib '..';

use Modules::Triangles;
use Data::Printer;
use Test::More tests => 6;

#           /|
#         / b|
#    C  /    |
#     /      |A
#   /       _|
# /a       |.|
# ------------
#      B


use_ok('Modules::Triangles');  # test 01

# set triangle parameters
my %h_sides = (
    'side_a' => 10.50,
    'side_b' => 15.00,
    'side_c' => 18.31,
);

my %h_angles = (
    'angle_a' => 35,
    'angle_b' => 55,
    'angle_c' => 90,
);

# instantiate triangle object 
my $o_triangle = Modules::Triangles->new();
my $nothing    = undef;

# check that object has been defined 
ok(defined $o_triangle, 'New triangle object has been defined');  # test 02 
ok(!$nothing          , 'No object has been defined'          );  # test 03

# check if the object is of the Modules::Triangles type 
ok($o_triangle->isa('Modules::Triangles'), 'Object is of type Modules::Triangles');  # test 04 

# test subroutines 
subtest 'Test Triangle Subroutines' => sub {
    plan tests => 3;

    is(sprintf( "%.2f", $o_triangle->calc_side_a_90($h_sides{'side_b'}, $h_angles{'angle_a'})), 
        sprintf("%.2f", $h_sides{'side_a'}), 'calc_side_a_90()');
    is(sprintf( "%.2f", $o_triangle->calc_side_b_90($h_sides{'side_a'}, $h_angles{'angle_b'})), 
        sprintf("%.2f", $h_sides{'side_b'}), 'calc_side_b_90()');
    is(sprintf( "%.2f", $o_triangle->calc_side_c_90($h_sides{'side_a'}, $h_sides{'side_b'})), 
        $h_sides{'side_c'}, 'calc_side_c_90()');
};  # test 05

subtest 'Negative Test Triangle Subroutines' => sub {
    plan tests => 3;

    isnt($o_triangle->calc_side_a_90($h_sides{'side_b'}, $h_angles{'angle_a'}), 
        $h_sides{'side_a'}, 'calc_side_a_90()');
    isnt($o_triangle->calc_side_b_90($h_sides{'side_a'}, $h_angles{'angle_b'}), 
        $h_sides{'side_b'}, 'calc_side_b_90()');
    isnt($o_triangle->calc_side_c_90($h_sides{'side_a'}, $h_sides{  'side_b'}), 
        $h_sides{'side_c'}, 'calc_side_c_90()');
};  # test 06


