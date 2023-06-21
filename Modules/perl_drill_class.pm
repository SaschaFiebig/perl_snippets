#!/usr/bin/env perl

package Modules::perl_drill_class;

use strict;
use warnings;
use diagnostics;

use feature 'say';


# example class for creating characters and basic math


# constructor
sub new {
    my $class = shift;

    my $self = {
        s_first_name => shift,
        s_last_name  => shift, 
        s_occupation => shift,
        s_ip         => shift,
    };

    bless $self, $class;
    return $self;
}


## getter ################
sub getFirstName {
    my ($self) = @_;
    return $self->{s_first_name};
}

sub getLastName {
    my ($self) = @_;
    return $self->{s_last_name};
}

sub getOccupation {
    my ($self) = @_;
    return $self->{s_occupation};
}

sub getIP {
    my ($self) = @_;
    return $self->{s_ip};
}


## setter ################
sub setFirstName {
    my ($self, $s_first_name) = @_;
    $self->{s_first_name} = $s_first_name if defined($s_first_name);
    return $self->{s_first_name};
}

sub setLastName {
    my ($self, $s_last_name) = @_;
    $self->{s_last_name} = $s_last_name if defined($s_last_name);
    return $self->{s_last_name};
}

sub setOccupation {
    my ($self, $s_occupation) = @_;
    $self->{s_occupation} = $s_occupation if defined($s_occupation);
    return $self->{s_occupation};
}

sub setIP {
    my ($self, $s_ip) = @_;
    $self->{s_ip} = $s_ip if defined($s_ip);
    return $self->{s_ip};
}


## methods ###############
sub getAllData {
    my ($self) = @_;
    my $s_first_name = $self->{s_first_name};
    my $s_last_name  = $self->{s_last_name};
    my $s_occupation = $self->{s_occupation};
    my $s_ip         = $self->{s_ip};
    
    my $s_data_string = "IP: $s_ip\nName: $s_first_name, $s_last_name\nOccupation: $s_occupation";
    return $s_data_string;
}

sub add {
    my ($self, $f_summand1, $f_summand2) = @_;
    my $f_product = $f_summand1+$f_summand2;
    return $f_product;
}

sub sub {
    my ($self, $f_num1, $f_num2) = @_;
    my $f_result = $f_num1-$f_num2;
    return $f_result;
}

sub mul {
    my ($self, $f_num1, $f_num2) = @_;
    my $f_result = $f_num1*$f_num2;
    return $f_result;
}

sub div {
    my ($self, $f_num1, $f_num2) = @_;
    my $f_result = $f_num1/$f_num2;
    return $f_result;
}


1;

