#!/bin/env perl

use strict;
use warnings;
use diagnostics;

use feature 'say';

## 00 *package manager ( pip, cpan )
## 01 variables
## 02 arrays
## 03 hashes
## 04 conditionals
## 05 loops
## 06 *string operations
## 07 *math
## 08 I/O
## 09 file I/O
## 10 *error handling
## 11 *encoding
## 12 *functions
## 13 *usefull functions
## 14 classes & objects

## 00 package management
if(0) {
    say( "\n## CPAN #############################################################" );
    # cpan is a convenient way to download perl packages
    # after installing cpan you can get packages by typing: cpan <package>::<class>
    # there are also other package managers for perl
    # install, update and delete packages
}

## 01 variables
if(0) {
    say( "\n## VARIABLES, aka Scalars ###########################################" );
    # declare and initialize variables
    my $s_string_variable   = 'The string';
    my $i_integer_variable  = 42;
    my $f_float_variable    = 3.1415;
    my $b_boolean_variable  = 0; # false values: 0, '0', '', (), undef; anything else is considered true
    my $unassigned_variable;
    $unassigned_variable    = undef;

    # output variables
    say( 'My String = ' . $s_string_variable . ', My Integer = ' . $i_integer_variable . ', My Float = ' . $f_float_variable );
}

## 02 arrays
if(0) {
    say( "\n## ARRAYS, aka Lists ################################################" );
    # declare and initialize arrays
    my @a_single_type_array = ( 1, 4, 3, 2 );
    my @a_mixed_type_array  = ( 1, 3.14, 'a', 'Hello' );
    my @a_multi_level_array = ( 1, 3, [ 4, 2 ]);
    my $ar_anon_array       = [ 1, 3.14, [ 'c', 'b', 'a' ]]; # also known as array reference, hence the prefix
    my @a_experiment_array  = ();

    # making a deep copy of an array
    use Storable qw(dclone);
    my @a_array_deep_copy = @{ dclone( \@a_single_type_array )}; # deep copy using Storable::dclone

    my @a_array_deep_copy2;
    foreach my $copy_value ( @a_single_type_array ){ push @a_array_deep_copy2, $copy_value } # deep copy using loop

    # auto generate arrays
    my @a_auto_number_array = ( 0..100   );
    my @a_auto_char_array   = ( 'A'..'Z' );

    # array operations
    say( 'array length: ' . scalar( @a_auto_char_array ));         # get array length
    @a_single_type_array  = map({ $_ + 3 } @a_single_type_array ); # perform '+ 3' operation on any value in the array
    say( 'Slicing array: ' . @a_auto_char_array[10 .. 15]);        # slice from index 10 up to including 15
    my @a_sorted_array    = sort( @a_single_type_array );          # sorting array, returns sorted list, no change to original array
    my $s_array_to_string = join( ', ', @a_mixed_type_array );     # turn array to string, using ', ' as a delimiter
    say( 'array to string: ' . $s_array_to_string );
    # wantarray()
    # exists()
    # grep()

    # add/remove from arrays
    push    @a_experiment_array, @a_mixed_type_array;             # add scalar or list to end of an array
    unshift @a_experiment_array, @a_mixed_type_array;             # add scalar or list to beginning of an array
    say( 'popped value: '  . pop( @a_auto_char_array   ));        # remove and return last value of an array
    say( 'shifted value: ' . shift( @a_auto_char_array ));        # remove and return first value of an array

    # access arrays
    say( 'Access array by index: ' . $a_single_type_array[2] );
    say( 'Access multilevel array by index: ' . $a_multi_level_array[2][0] );
    say( 'Access anonymous array by index: ' . @$ar_anon_array[0] );
    say( 'Access anonymous multilevel array by index: ' . @$ar_anon_array[2]->[1] );

    # iterate trough arrays
    for my $array_value ( @a_single_type_array ){ say( $array_value     )} # simple iteration trough array
    foreach my $array_value ( @a_single_type_array ){ say( $array_value )} # simple iteration trough array

    for( my $i_count = 0; $i_count < scalar( @a_mixed_type_array ); $i_count++ ){ # count trough array
        say( "$i_count: $a_mixed_type_array[$i_count]" );
    }

    my $i_counter = 0;
    while( $i_counter < scalar( @a_single_type_array )){
        $i_counter++;
        say("NR. $i_counter = $a_single_type_array[$i_counter-1]" );
    }
}

## 03 hashes
if(0) {
    say( "\n## HASHES ###########################################################" );
    # declare and initialize hashes
    my %h_evil_corporations = (
        'alien'           => 'Weyland-Yutani',
        'blade_runner'    => 'Tyrell Corporation',
        'hackers'         => 'Ellingson Mineral Company',
        'mr_robot'        => 'E-Corp',
        'terminator'      => 'Cyberdyne Systems',
        'johnny_mnemonic' => 'PharmaCon',
    );

    # declare and initialize multi-level hash
    my %h_cyberpunk_entertainment = (
        'altered_carbon' => { 'media' => 'TV Show', 'genre' => 'Cyberpunk', 'rating' => '3 of 5' },
        'cyberpunk_2077' => { 'media' => 'Game'   , 'genre' => 'Cyberpunk', 'rating' => '4 of 5' },
        'the_matrix'     => { 'media' => 'Movie'  , 'genre' => 'Cyberpunk', 'rating' => '5 of 5' },
    );

    # declare and initialize a hash reference 
    my $hr_robots = {
        'Number 5' => 'Short Circuit',
        'R2-D2'    => 'Star Wars',
        'Robby'    => 'Forbidden Planet',
        'WALL-E'   => 'WALL-E',
        'Bishop'   => 'Aliens',
    };

    # making a hash deep copy
    use Storable qw(dclone);
    my %h_deep_copy           = %{ dclone( \%h_evil_corporations )};
    my %h_deep_copy_to_delete = %{ dclone( \%h_evil_corporations )};

    # hash operations
    # hash length (we count the keys by using scalar())
    say( "\nThe hash contains " . scalar( keys( %h_evil_corporations )) . " elements\n" );

    # slicing hash
    my @a_slice_of_hash           = @h_evil_corporations{( 'alien'  , 'blade_runner' )};
    my ( $s_value01, $s_value02 ) = @h_evil_corporations{( 'hackers', 'mr_robot'     )};

    # check hash for value
    exists( $h_evil_corporations{ 'mr_robot' }) ? say( "\nValue exists\n" ) : say( "\nValue does not exist\n" );

    # extract keys or values from hash to array
    my @a_array_of_keys   = keys(   %h_evil_corporations );
    my @a_array_of_values = values( %h_evil_corporations );

    # add, update and remove values to hash
    $h_evil_corporations{ 'resident_evil' } = 'Umbrella';             # add resident evil to evil corporations
    $h_evil_corporations{ 'resident_evil' } = 'Umbrella Corporation'; # update resident evil value
    delete( $h_evil_corporations{ 'johnny_mnemonic' });               # remove key-value pair from evil corporations

    # empty hash content
    %h_deep_copy_to_delete = ();

    # access hash values
    say( 'Evil Corporations Deep Copy:  ' . $h_deep_copy{ 'terminator' });
    say( 'Evil Corporations:            ' . $h_evil_corporations{ 'terminator' });
    say( 'My Multi Hash Entertainment:  ' . $h_cyberpunk_entertainment{ 'cyberpunk_2077' }{ 'rating' });

    say( '' );

    # access hash reference values 
    print( "Number 5 franchise: $hr_robots->{'Number 5'}\n" );
    print( "R2-D2 franchise:    $hr_robots->{'R2-D2'}\n" );

    say( '' );

    # iterate trough hash
    say( 'test' );
    for( sort( keys( %h_evil_corporations ))){ # sort() is for sorting the output by keys
        say( $_ . ' = ' . $h_evil_corporations{$_} );
    }

    say( '' );

    # iterate trough hash better readable
    while ( my ( $s_key, $s_value ) = each( %h_evil_corporations )) {
        say( "$s_key = $s_value" );
    }

    say( '' );

    # iterate trough multi-level hash
    while ( my ( $key, $value ) = each( %h_cyberpunk_entertainment )) {
        say( "$key {" );
        while ( my ( $key2, $value2 ) = each( %$value )) {
            say( "   $key2 = $value2," );
        }
        say( "}," );
    }
}

## 04 conditionals + comparison operators
if(0) {
    say( "\n## DECISIONS ########################################################" );
    if (1) { say( 'IF statement' ); }
    say( 'IF statement reversed' ) if (1);

    say( '' );

    say( 'UNLESS statement') unless(0);
    unless (0) { say( 'UNLESS statement reversed' )};    # please do not start a condition with an unless

    say( '' );

    if (0) {
        say( 'IF, elsif, else' );
    }
    elsif (1) {
        say( 'if, ELSIF, else' );
    }
    else {
        say( 'if, elsif, ELSE' );
    }

    # switch, case statements, are not really supportet in perl 5

    say( '' );

}

## 05 loops
if(0) {
    say( "\n## LOOPS ############################################################" );

    my @a_elements = ( 1, 4, 3, 2 );

    for ( my $i_counter_00 = 0; $i_counter_00 <= 3; $i_counter_00++ ) {
        say( "FOR Loop: $i_counter_00" );
    }

    say( '' );

    foreach my $s_element (@a_elements){
        say( "s_element: $s_element");
    }

    my $i_counter_01 = 3;
    while ( $i_counter_01 >= 0 ) {
        say( "WHILE Loop: $i_counter_01" );
        $i_counter_01--;
    }

    say( '' );

    my $i_counter_02 = 0;
    do {
        say( "DO WHILE Loop: $i_counter_02" );
        $i_counter_02++;
    } while ( $i_counter_02 <= 3 );

    say( '' );

    my $i_counter_03 = 3;
    do {
        say ( "DO UNTIL Loop: $i_counter_03" );
        $i_counter_03--;
    } until ( $i_counter_03 == 0 );

    say( '' );
}

## 06 string operations (slicing, regex, ect...)
if(0) {
    say( "\n## STRING OPERATIONS ################################################" );
    # https://www.perltutorial.org/perl-string/
    my $s_string_a = 'Cyberpunk 2077';
    my $s_string_b = 'judy';
    my $s_string_c = 'SABURO';
    my $s_string_d = 'Broccoli is pretty cool.';

    # length
    say( "Length: " . length( $s_string_a ));

    # slicing, substring
    say( 'Slicing: ' . substr( $s_string_a, 0, 9 ));

    # upper, lower case
    say( 'All Uppercase: ' . uc( $s_string_b ));
    say( 'All Lowercase: ' . lc( $s_string_c ));
    say( 'First Uppercase: ' . ucfirst( $s_string_b ));
    say( 'First Lowercase: ' . lcfirst( $s_string_c ));

    # replacing
    $s_string_d =~ s/Broccoli/Bacon/;
    say( "Replaced string: " . $s_string_d );

    # regex extracting
    my ( $s_string_extracted ) = ( $s_string_d =~ /\A(.*?) /);
    say( 'Extracted String: ' . $s_string_extracted); 
}

## 07 math
if(0){}

## 08 I/O
if(0) {
    say( "\n## INPUT OUTPUT #####################################################" );
    print( "Please enter your name: " );
    my $my_input = <STDIN>;
    chomp( $my_input );
    say( "Hello agent $my_input." );
}

## 09 I/O files
if(0) {
    say( "\n## I/O FILES ########################################################" );
    if (1) {
        # <   or r  = Read only
        # >   or w  = Creates, Writes and Truncates
        # >>  or a  = Writes, Appends and Creates
        # +<  or r+ = Reads and Writes
        # +>  or w+ = Reads, Writes and Truncates
        # +>> or a+ = Reads, Writes, Appends and Creates

        # open file for read and write
        if (1) {
            # open file for Reads, Writes, Appends and Creates (read does not work...)
            open( my $o_file_handler, '+>>', "sw_characters.csv" ) or
                die( 'Error: Can not open file' );

            # append to file
            print( $o_file_handler "I like puddin!\n" );

            # read file lines (does not work with +>>)
            #while ( my $s_line = <$o_file_handler> ) { print( $s_line )}

            # close file
            close( $o_file_handler ) or die( "Couldn't close file: $!" );
        }

        # open file for reading
        if (1) {
            # open file for read only
            open( my $o_file_handler, '<', "sw_characters.csv" ) or
                die( "Error: Can't open file" );

            # read file lines
            while ( my $s_line = <$o_file_handler> ) { print( $s_line )}

            # close file
            close( $o_file_handler ) or die( "Couldn't close file: $!" );
        }

    }
}

## 10 error handling
if(0) {
    say( "\n## ERROR HANDLING ###################################################" );

}

## 11 encoding (ASCII, ISO/IEC 10646, unicode UTF-8 (16, 32))
if(0) {
    say( "\n## ENCODING #########################################################" );
    # encoding to json, yaml, xml, csv
}

## 12 functions
if(0){}

## 13 useful functions
if(0){

    # date time stamp 
    use POSIX qw(strftime);
    my $s_time_stamp = strftime("%Y-%m-%d_%H:%M:%S", localtime);
    say( 'Date-Timestamp: ' . $s_time_stamp );


}

## 14 classes & objects
if(1){

    # class files have the '.pm' extension

    # add class package
    package perl_snippets::perl_drill;

    # add imports
    use warnings;
    use diagnostics;
    use strict;

    use feature 'say';

    # add constructor
    sub new {
       my $o_class = shift;

       # hash containing
       my $self = {
          's_name'       => shift,
          'i_age'        => shift,
          's_hair_color' => shift,
       };

       bless  $self, $o_class;
       return $self;
    }

    # getter methods
    sub get_name{
        my ( $self ) = @_;
        return $self->{ 's_name' };
    }

    # setter methods
    sub set_name{
        my ( $self, $s_name ) = @_;
        $self->{ 's_name' } = $s_name if defined( $s_name );
        return $self->{ 's_name' };
    }

    sub set_age{
        my ( $self, $i_age ) = @_;
        $self->{ "i_age" } = $i_age if defined( $i_age );
        return $self->{ i_age  };
    }

    # methods
    sub character_overview{
        my ( $self, $s_name, $i_age, $s_hair_color ) = @_;
        
        print( "\nName: " . $self->{'s_hair_color'} . "\n"   );
        print( 'Age:  '   . $self->{'i_age'}        . "\n"   );
        print( 'Hair: '   . $self->{'s_hair_color'} . "\n\n" );
    }

    1; # classes need to end with a 1

    # the following part should be in a different file than the class declaration

    # import class
    #use perl_snippets::perl_drill;

    # create objects
    my $o_harry = new perl_snippets::perl_drill( 'harry', 42, 'Black' );
    my $o_karen = new perl_snippets::perl_drill( 'karen', 00, 'Blonde'  );

    # use object methods
    my $s_harry_name = $o_harry->get_name(); # extract object name parameter
    $o_karen->set_age( 32 );               # set a new age for the 'karen' object
    say($o_karen->character_overview());
    say( $o_karen->get_name());


}


