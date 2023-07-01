#!/usr/bin/env perl 

use diagnostics;
use strict;
use warnings;

use File::Copy;

my $s_working_dir = '</path/to/working/dir/>';
opendir(my $DH, $s_working_dir) or die "Could not open directory: $!";

print('Starting operation.' . "\n");
while (my $s_filename_original = readdir($DH)) {
    next if ($s_filename_original eq "." || $s_filename_original eq "..");

    # convert to lowercase
    # replace spaces with underscores
    # remove unwanted symbols
    my $s_filename_new = lc($s_filename_original);
    $s_filename_new =~ s/'//g;
    $s_filename_new =~ s/"//g;
    $s_filename_new =~ s/\s+/_/g;
    $s_filename_new =~ s/_-_/-/g;
    $s_filename_new =~ s/_+_/+/g;

    my $s_old_path = "$s_working_dir/$s_filename_original";
    my $s_new_path = "$s_working_dir/$s_filename_new";

    move($s_old_path, $s_new_path) or die "Failed to rename file: $!";
}
closedir($DH);

print "All files have been renamed successfully!\n";

