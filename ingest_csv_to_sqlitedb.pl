#!/usr/bin/env perl

use diagnostics;
use strict;
use warnings;
use DBI;

# set target sqlite database
my $s_database = '<database.db>';

# set source csv file
my $s_csv_file = '<data.csv>';

# database connection
my $o_database_handler = DBI->connect("dbi:SQLite:dbname=$s_database", "", "", { RaiseError => 1, AutoCommit => 0 });

#  set name of the target table
my $s_table_name = '<table_name>';

# prepaired statement, NOTE: do not forget to adjust the name and amount of the column headers eg: string01 = column_header_xyz
my $o_insert_statement = $o_database_handler->prepare("INSERT INTO $s_table_name (string01, string02, integer03, float04, boolean05) VALUES (?, ?, ?, ?, ?)");

# open csv file
open(my $o_file_handler, '<', $s_csv_file) or die "Could not open file '$s_csv_file' $!";

# iterate through the lines of the csv file
while (my $s_line = <$o_file_handler>) {
    chomp $s_line;  # remove new line from end of the string 
    my ($string01, $string02, $integer03, $float04, $boolean05) = split ',', $s_line;

    # bind values
    $o_insert_statement->execute($string01, $string02, $integer03, $float04, $boolean05) or die "Cannot execute statement: $DBI::errstr";
}

# execute statement
$o_database_handler->commit();

# disconnect from database 
$o_database_handler->disconnect();

# close csv file
close $o_file_handler;
