#!/bin/env perl

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
if(0){}

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
if(1){
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
if(0){

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
    my $o_harry = new perl_snippets::perl_drill( 'Harry', 42, 'Black'  );
    my $o_karen = new perl_snippets::perl_drill( 'Karen', 00, 'Blonde' );

    # use object methods
    my $s_harry_name = $o_harry->get_name(); # extract object name parameter
    $o_karen->set_age( 32 );               # set a new age for the 'karen' object
    say( $o_karen->character_overview() );
    say( $o_karen->get_name() );


}


