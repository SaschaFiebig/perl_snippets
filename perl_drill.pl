#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use feature 'say';

## 00 *package manager ( pip, cpan )
    # add packages 
    # remove packages 
    # update packages 
## 01 variables
## 02 arrays
## 03 hashes
## 04 conditionals
## 05 loops
## 06 *string operations
## 07 *math
    # basic math 
    # https://perldoc.perl.org/Math::BigFloat
## 08 I/O
## 09 file I/O
## 10 *error handling
## 11 *encoding
## 12 functions
## 13 *usefull functions
## 14 tests 
    # Test::More
## 15 classes & objects

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
if(1){
    say( "\n## MATH #############################################################" );

    my $f_num00 = 3125.3125;
    my $f_num01 =    5.00;
    my $f_num02 =   10.10;
    my $f_num03 =   17.17;
    my $f_num04 =   20.20;
    my $f_num05 =   25.25;
    my $f_num06 =   30.30;
    my $f_num07 =   35.35;
    my $f_num08 =    3.141_547_499_200_292_847_757_589_302_346_453_465_363_542_666_234;

    print( 'Addition:       ' . $f_num07 . ' + ' . $f_num01 . ' = ' . ( $f_num07+$f_num01) . "\n" );
    print( 'Subtraction:    ' . $f_num06 . ' - ' . $f_num02 . ' = ' . ( $f_num06-$f_num02) . "\n" );
    print( 'Multiplication: ' . $f_num05 . ' * ' . $f_num05 . ' = ' . ( $f_num05*$f_num05) . "\n" );
    print( 'Division:       ' . $f_num04 . ' / ' . $f_num08 . ' = ' . ( $f_num04/$f_num08) . "\n" );
    print( 'Moudlus:        ' . $f_num03 . ' % ' . $f_num01 . ' = ' . ( $f_num03%$f_num01) . "\n" );
    print( 'Nth Power:      ' . $f_num01 . ' ** ' . $f_num01 . ' = ' . ( $f_num01**$f_num01) . "\n" );
    #print( 'Nth Root:       ' . $f_num01 . ' // ' . $f_num03 . ' = ' . ( $f_num01-$f_num03) . "\n" );


    print( "\n\n");


    use Math::BigFloat;
    my $o_big_float00 = Math::BigFloat->new( '3125.00' );
    my $o_big_float01 = Math::BigFloat->new(    '5.00' );
    my $o_big_float02 = Math::BigFloat->new(   '10.10' );
    my $o_big_float03 = Math::BigFloat->new(   '17.17' );
    my $o_big_float04 = Math::BigFloat->new(   '20.20' );
    my $o_big_float05 = Math::BigFloat->new(   '25.25' );
    my $o_big_float06 = Math::BigFloat->new(   '30.30' );
    my $o_big_float07 = Math::BigFloat->new(   '35.35' );
    my $o_big_float08 = Math::BigFloat->new(    '3.141_547_499_200_292_847_757_589_302_346_453_465_363_542_666_234');

    print( 'Addition:       ' . $o_big_float07 . ' + ' . $f_num01 . ' = ' );
    $o_big_float07->badd( $f_num01 );
    print( $o_big_float07 . "\n" );

    print( 'Subtraction:    ' . $o_big_float06 . ' - ' . $f_num02 . ' = ' );
    $o_big_float06->bsub( $f_num02 );
    print( $o_big_float06 . "\n" );

    print( 'Multiplication: ' . $o_big_float05 . ' * ' . $f_num05 . ' = ' );
    $o_big_float05->bmul( $f_num05 );
    print( $o_big_float05 . "\n" );

    print( 'Division:       ' . $o_big_float04 . ' / ' . $o_big_float08 . ' = ' );
    $o_big_float04->bdiv( $o_big_float08 );
    print( $o_big_float04 . "\n" );

    print( 'Modulus:        ' . $o_big_float03 . ' % ' . $f_num01 . ' = ' );
    $o_big_float03->bmod( $f_num01 );
    print( $o_big_float03 . "\n" );

    print( 'Nth power:      ' . $o_big_float01 . ' ** ' . $f_num01 . ' = ' );
    $o_big_float01->bpow( $f_num01 );
    print( $o_big_float01 . "\n" );

    print( 'Nth root:       ' . $o_big_float00 . ' // ' . $f_num01 . ' = ' );
    $o_big_float00->broot( $f_num01 );
    print( $o_big_float00 . "\n" );



    # life expectency 10_000
    my $o_life = Math::BigFloat->new( '10_000' );
    $o_life->bdiv(30);
    print("\n\n" . $o_life . "\n\n");


}


## 08 I/O
if(0) {
    say( "\n## INPUT OUTPUT #####################################################" );
    print( "Please enter your name: " );
    my $my_input = <STDIN>;
    chomp( $my_input );  # we use 'chomp()' to remove 'new line' at the end of a string
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

    # eval{}
    # <code> or die 'message';
    # warn 'warn message';

    # use Carp;
    # carp 'error message';
    
    # use Carp qw(cluck);
    # cluck 'error message';

    # use carp; 
    # croak 'error message';

    # use Carp;
    # confess 'error message';

    # use Error ':try';
    # try {
    #   <code>;
    #} catch <exception> with {
    #   <code>;
    #}:

    # 1. carp    - does not stop execution 
         # My carp error from method at main.pl line 140.

    # 2. warn    - does not stop execution 
        # My warn error from method at lib/Tools/ErrorTesting.pm line 48.

    # 3. cluck   - does not stop execution
        # My cluck error from method at lib/Tools/ErrorTesting.pm line 43.
        #         Tools::ErrorTesting::cluckError(Tools::ErrorTesting=HASH(0x55dd1ade74e8)) called at main.pl line 154

    # 4. croak   - does stop execution 
        # Uncaught exception from user code:
        #         My croak error from method at main.pl line 154.
        #         Tools::ErrorTesting::croakError(Tools::ErrorTesting=HASH(0x55c7066d74e8)) called at main.pl line 154

    # 5. die     - does stop execution 
        # Uncaught exception from user code:
        #         My die error from method at lib/Tools/ErrorTesting.pm line 53.
        #         Tools::ErrorTesting::dieError(Tools::ErrorTesting=HASH(0x55d87caed4e8)) called at main.pl line 157

    # 6. confess - kills execution
        # Uncaught exception from user code:
        #         My confess error from method at lib/Tools/ErrorTesting.pm line 38.
        #                 Tools::ErrorTesting::confessError(Tools::ErrorTesting=HASH(0x557df12464e8)) called at main.pl line 157
        #         Tools::ErrorTesting::confessError(Tools::ErrorTesting=HASH(0x557df12464e8)) called at main.pl line 157

}


## 11 encoding (ASCII, ISO/IEC 10646, unicode UTF-8 (16, 32))
if(0) {
    say( "\n## ENCODING #########################################################" );
    # encoding to json, yaml, xml, csv

}


## 12 functions
if(0){
    use POSIX qw(strftime);

    sub date_timestamp{
        my ($self) = @_;
        my $s_date_timestamp = strftime( "%Y-%m-%d_%H:%M:%S", localtime );

        return $s_date_timestamp;
    }
    say( 'Current date-timestamp: ' . date_timestamp( ));


    #print('Please enter a number to determan if it is even or odd: ');
    #my $i_my_number = <STDIN>;
    #chomp( $i_my_number );
    sub even_odd{
        my ($i_number) = @_;
        # add check for number
        if( $i_number % 2 == 0 ){
            say( $i_number . ' is even.' );
        }elsif( $i_number % 2 != 0 ){
            say( $i_number . ' is odd.' );
        }else{
            say( 'An error has occured.' );
        }
    }
    #even_odd( $i_my_number );


    sub addition{
        my ($i_summand_a, $i_summand_b) = @_;
        # add check for number 
        my $i_sum = $i_summand_a + $i_summand_b;

        return $i_sum;
    }
    say( 'My sum is: ' . addition( 5, 5 ));


    sub muzzle_energy{
        my ($f_mass_g, $f_velocity_msec) = @_;
        my $f_mass_kg = $f_mass_g / 1_000;
        my $f_joule = 0.5 * $f_mass_kg * ($f_velocity_msec ** 2);

        return $f_joule;
    }
    say( 'Barret .50 cal = ' . muzzle_energy( 52, 882 ) . ' Joule' );


    sub cm_to_inch{
        my ($f_cm) = @_;
        my $f_inch = $f_cm / 2.54;

        return $f_inch;
    }


    sub inch_to_cm{
        my ($f_inch) = @_;
        my $f_cm = $f_inch * 2.54;

        return $f_cm;
    }
    my $f_inch2 = 20.0;
    my $f_cm2   = 50.8;
    say( $f_cm2   . ' cm   = ' . cm_to_inch( $f_cm2   ) . ' inch' );
    say( $f_inch2 . ' inch = ' . inch_to_cm( $f_inch2 ) . ' cm'   );

}


## 13 useful functions
if(0){

    # date time stamp 
    use POSIX qw(strftime);
    my $s_time_stamp = strftime( "%Y-%m-%d_%H:%M:%S", localtime );
    say( 'Date-Timestamp: ' . $s_time_stamp );

}


## 14 classes & objects
if(0){
    use lib '.';  # set application root folder
    use Modules::perl_drill_class;  # import class

    # create objects 
    my $o_harry_dresden = Modules::perl_drill_class->new( 'Harry', 'Dresden', 'Wizard' , 'The Dresden Files' );
    my $o_sarah_connor  = Modules::perl_drill_class->new( 'Sarah', 'Connor' , 'Fighter', 'Terminator' );

    # get data 
    print( '[' . $o_harry_dresden->getIP() . "]\n" );
    print( "\tName: " . $o_harry_dresden->getFirstName() . ', ' . $o_harry_dresden->getLastName() . "\n" );
    print( "\tJob:  " . $o_harry_dresden->getOccupation() . "\n\n" );

    print( '[' . $o_sarah_connor->getIP() . "]\n" );
    print( "\tName: " . $o_sarah_connor->getFirstName() . ', ' . $o_sarah_connor->getLastName() . "\n" );
    print( "\tJob:  " . $o_sarah_connor->getOccupation() . "\n\n" );

    # change data   
    $o_harry_dresden->setOccupation( 'Wizard, Private Detective, Warden of the White Counsile, Warden of Deamonreach, Teacher, Winter Knight' );

    # get changed data
    print( $o_harry_dresden->getAllData() . "\n\n" );

    # use methods 
    my $f_number = 5.5;
    my $f_result = $o_sarah_connor->mul( $f_number, $f_number );
    print( "Multiplicating $f_number with $f_number results in: $f_result\n\n" );    

}


