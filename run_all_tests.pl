#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use Term::ANSIColor qw(:constants);


# get test files from sub directories 
system( 'tree -fi | grep -P \\.t$ > test_files.txt' );

my @a_files;
# open file for reading
open( my $fh, '<', 'test_files.txt' ) or die( "Error: Can't open file: $!" );
    while( my $s_line = <$fh> ) {
        push @a_files, $s_line;
    }
    close( $fh ) or die("Error: Can't close file: $!");

# delete file 
unlink 'test_files.txt';

# pop off any non '.t' entry from @a_test_files so we can change test_files.txt to .txt
my @a_test_files = grep{/\.t$/} @a_files;

# execute test files 
foreach my $s_test (@a_test_files) {
    my $s_header = ( split '/', $s_test)[-1];
    chomp($s_header);
    print( RED, "### $s_header ##################################\n", RESET );
    system("perl $s_test");
    sleep(2);
}


