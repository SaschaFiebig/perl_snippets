#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use lib '.';
use lib '..';

use Modules::Electricity;
use Test::More tests => 8;


my %h_test_params = (
    'amps'       =>    10.00,
    'ohms'       =>    24.00, 
    'volts'      =>   240.00,
    'amp-hours'  =>     4.17,
    'volts2'     =>   239.81,
    'watt-hours' => 1_000.01,
);

use_ok('Modules::Electricity');  # test 01

# instantiate electricity object 
my $o_electricity = Modules::Electricity->new();
my $nothing       = undef;

# check definition 
ok(defined $o_electricity, 'New electricity object has been defined');  # test 02
ok(!$nothing             , 'No object has been defined'             );  # test 03

# check object type 
ok($o_electricity->isa('Modules::Electricity'), 'Object is of type Modules::Electricity');  # test 04

### test v, o, a subroutines ############################################
subtest 'Test Volt, Ohm, Amp Subroutines' => sub {
    plan tests => 3;

    is(sprintf("%.2f", $o_electricity->calc_amps( $h_test_params{'volts'}, $h_test_params{'ohms'})), sprintf("%.2f", $h_test_params{'amps' }), 'calc_amps() ');
    is(sprintf("%.2f", $o_electricity->calc_ohms( $h_test_params{'volts'}, $h_test_params{'amps'})), sprintf("%.2f", $h_test_params{'ohms' }), 'calc_ohms() ');
    is(sprintf("%.2f", $o_electricity->calc_volts($h_test_params{'ohms' }, $h_test_params{'amps'})), sprintf("%.2f", $h_test_params{'volts'}), 'calc_volts()');
};  # test 05

subtest 'Negative Test Volt, Ohm, Amp Subroutines' => sub {
    plan tests => 3;

    isnt(sprintf( "%.2f", $o_electricity->calc_amps( $h_test_params{'volts'}, $h_test_params{'ohms'})), sprintf("%.2f", $h_test_params{'volts'}), 'calc_amps() ');
    isnt(sprintf( "%.2f", $o_electricity->calc_ohms( $h_test_params{'volts'}, $h_test_params{'amps'})), sprintf("%.2f", $h_test_params{'amps' }), 'calc_ohms() ');
    isnt(sprintf( "%.2f", $o_electricity->calc_volts($h_test_params{'ohms' }, $h_test_params{'amps'})), sprintf("%.2f", $h_test_params{'ohms' }), 'calc_volts()');
};  # test 06


### test amp-hours, volt, watt-hours ####################################
subtest 'Test Amp-Hour, Volt, Watt-Hour Subroutines' => sub {
    plan tests => 3;

    is(sprintf( "%.2f", $o_electricity->calc_amp_hours( $h_test_params{'watt-hours'}, $h_test_params{'volts2'   })), sprintf("%.2f", $h_test_params{'amp-hours' }), 'calc_amp_hours() ');
    is(sprintf( "%.2f", $o_electricity->calc_volts2(    $h_test_params{'watt-hours'}, $h_test_params{'amp-hours'})), sprintf("%.2f", $h_test_params{'volts2'    }), 'calc_volts2()    ');
    is(sprintf( "%.2f", $o_electricity->calc_watt_hours($h_test_params{'volts2'    }, $h_test_params{'amp-hours'})), sprintf("%.2f", $h_test_params{'watt-hours'}), 'calc_watt_hours()');
};  # test 07 

subtest 'Negative Test Amp-Hour, Volt, Watt-Hour Subroutines' => sub {
    plan tests => 3;

    isnt(sprintf( "%.2f", $o_electricity->calc_amp_hours( $h_test_params{'watt-hours'}, $h_test_params{'volts2'   })), sprintf("%.2f", $h_test_params{'watt-hours'}), 'calc_amp_hours() ');
    isnt(sprintf( "%.2f", $o_electricity->calc_volts2(    $h_test_params{'watt-hours'}, $h_test_params{'amp-hours'})), sprintf("%.2f", $h_test_params{'amp-hours' }), 'calc_volts2()    ');
    isnt(sprintf( "%.2f", $o_electricity->calc_watt_hours($h_test_params{'volts2'    }, $h_test_params{'amp-hours'})), sprintf("%.2f", $h_test_params{'volts2'    }), 'calc_watt_hours()');
};  # test 08


