#!usr/bin/env perl 

package Modules::Triangles;

use strict;
use warnings;
use diagnostics;

use Math::Trig;


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


sub new {
    my $o_class = shift;
    return bless({}, $o_class);
}

### 90° triangle ########################################################
sub calc_side_a_90 {
    my ($self, $f_side_b, $f_angle_a) = @_;
    my $f_height = $f_side_b*tan(deg2rad($f_angle_a));
    return $f_height;
}

sub calc_side_b_90 {
    my ($self, $f_side_a, $f_angle_b) = @_;
    my $f_distance = $f_side_a*tan(deg2rad($f_angle_b));
    return $f_distance;
}

sub calc_side_c_90 {
    my ($self, $f_side_a, $f_side_b) = @_;
    my $f_diagonale = sqrt(($f_side_a*$f_side_a)+($f_side_b*$f_side_b));
    return $f_diagonale;
}


return 1;

