#!/bin/env perl

use warnings;
use strict; 
use diagnostics;
use POSIX qw(strftime);
use Term::ANSIColor qw(:constants);

my $s_download_url     = 'http://rathaus-hildesheim.de/webcam/webcam.jpg';
my $s_prefix           = 'hildesheim_marktplatz_';
my $s_suffix           = '.jpg';
my $i_pause_in_seconds = 60;


print( RED, "----------[ STARTING DOWNLOAD ]----------\n\n", RESET );

while(1){
    # generate timestamp
    my $i_current_unix_time = 7200+time();
    my $s_timestamp    = strftime '%Y-%m-%d_%H%M%S', gmtime( $i_current_unix_time );
    # assemble filename 
    my $s_filename     = $s_prefix . $s_timestamp . $s_suffix;
    # assemble wget command 
    my $s_wget_command = 'wget -O ' . $s_filename . " --user-agent='Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0' " . $s_download_url;

    # print progress 
    print( RED, 'Download file: ' . $s_filename );
    print( 'From: ' . $s_download_url, RESET    );

    # execute wget command 
    my $EXECUTE = `$s_wget_command`;
    sleep( $i_pause_in_seconds );
    print( "\n"                );

} 

print( RED, "----------[ DOWNLOAD COMPLETE ]----------\n", RESET );

