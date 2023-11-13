#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use Term::ANSIColor qw(:constants);


sub start_test {
    my ( $s_test_path, $i_spaces ) = @_;

    my $s_header = ( split '/', $s_test_path )[-1];
    chomp($s_header);
    print( RED, "### $s_header ##################################\n", RESET );
    system( "perl $s_test_path" );

    while ( $i_spaces > 0 ) {
        print( "\n" );
        $i_spaces--;
    }
}


# get test files from sub directories 
system( 'tree -fi | grep -P \\.t$ > test_files.csv' );

my @a_test_files;
# open file for reading
open( my $fh, '<', 'test_files.csv' ) or die( "Error: Can't open file: $!" );
    while( my $s_line = <$fh> ) {
        push @a_test_files, $s_line;
    }
    close( $fh ) or die("Error: Can't close file: $!");

# delete file 
unlink 'test_files.csv';

# execute test files 
foreach my $s_test (@a_test_files) {
    start_test($s_test, 3);
    sleep(2);
}


