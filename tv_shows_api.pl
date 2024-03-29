#!/bin/env perl

use strict;
use warnings;
use diagnostics;
use JSON::XS;
use Data::Dumper;
use LWP::Simple;
use Term::ANSIColor qw(:constants);

use feature 'say';

# PLEASE MAKE SURE TO CHECK AN API'S ETIQUETTE BEFORE USING IT

# boolean to activate or deactivate debug function
my $b_enable_dbug = 0;

# array of shows to query for
my @a_shows = (
    #'halo',             # running
    #'star-trek-picard', # running
    #'the-blacklist',    # running
    #'the-rookie',       # running

    #'the-walking-dead',          # returning
    #'archer',                    # returning
    'csi-vegas',                 # returning
    #'foundation',                # returning
    #'loki',                      # returning
    #'rick-and-morty',            # returning
    #'seal-team',                 # returning
    #'the-legend-of-vox-machina', # returning
    #'the-mandalorian',           # returning
    #'south-park',

    #'cyberpunk-edgerunners', # tba
    # 'obi-wan-kenobi',        # 2022-05-27
    #'willow',                # tba
    #'house-of-the-dragon',   # 2022-08-01

    # 'the-last-of-us',       # broken
    #'westworld', # ?

    #'quantum-leap-2022',

    # 'blade-runner-black-lotus', # finished
    # 'clarice',                  # finished
    # 'dexter-new-blood',         # finished
    # 'lucifer',                  # finished
    # 'the-expanse',              # finished
    # 'the-strain',               # finished
);

my $i_arr_length = scalar(@a_shows) - 1;

for ( my $i = 0; $i <= $i_arr_length; $i++ ) {

    # create user agent
    my $o_user_agent = LWP::UserAgent->new();

    # execute api query
    my $o_raw = $o_user_agent->get( "https://catchtheshow.herokuapp.com/api/$a_shows[$i]" )
        or die( 'Get request not successful: ' . $! );

    die Dumper( $o_raw ) if( $b_enable_dbug == 1 );

    # decode to json
    my $j_json = $o_raw->decoded_content()
        or die( 'Decoding not successful: ' . $! );

    die Dumper( $j_json ) if( $b_enable_dbug == 1 );

    # decode json to hash
    my $hr_hash_pl = decode_json( $j_json )
        or die( 'Decoding to json not successful: ' . $! );

    die Dumper( $hr_hash_pl ) if( $b_enable_dbug == 1 ); # have a look at the raw hash

    # fill in variables
    my $s_name      = $hr_hash_pl->{ 'name'   } // '-';
    my $s_status    = $hr_hash_pl->{ 'status' } // '-';
    my $s_ne_name   = $hr_hash_pl->{ 'nextEpisode' }->{ 'name'      } // '-';
    my $s_countdown = $hr_hash_pl->{ 'nextEpisode' }->{ 'countdown' } // '-';
    my $i_episode   = $hr_hash_pl->{ 'nextEpisode' }->{ 'episode'   } // '-';
    my $i_season    = $hr_hash_pl->{ 'nextEpisode' }->{ 'season'    } // '-';
    my $i_day       = $hr_hash_pl->{ 'nextEpisode' }->{ 'date'      }->{ 'day'   } // '-';
    my $i_month     = $hr_hash_pl->{ 'nextEpisode' }->{ 'date'      }->{ 'month' } // '-';
    my $i_year      = $hr_hash_pl->{ 'nextEpisode' }->{ 'date'      }->{ 'year'  } // '-';

    my $s_season_episode    = "S: $i_season, E: $i_episode";
    my $s_date_next_episode = "$i_year-$i_month-$i_day";

    # print out
    print( UNDERLINE, RED, "Show: $s_name\n", RESET );
    print( RED,           "\tStatus:       $s_status\n", RESET);
    print(                "\tEpisode Name: $s_ne_name\n");
    print(                "\tCountdown:    $s_countdown\n");
    print(                "\tNext Episode: $s_season_episode\n", RESET);
    print( RED,           "\tAir Date:     $s_date_next_episode\n\n");

    sleep( 1 );
}

#################################################################
#
# https://catchtheshow.herokuapp.com/api/documentation
# https://www.themoviedb.org/documentation/api/discover
# https://www.tvmaze.com/api
#
#################################################################
# search by show name
# https://api.tvmaze.com/singlesearch/shows?q=csi
#
# get show information (from csi-vegas) 50361
# https://api.tvmaze.com/lookup/shows?tvrage=50361
# https://api.tvmaze.com/lookup/shows?thetvdb=50361
# https://api.tvmaze.com/lookup/shows?imdb=tt050361
# https://api.tvmaze.com/singlesearch/shows?q=csi&embed=episodes
#
# https://catchtheshow.herokuapp.com/api/the-last-of-us
# https://catchtheshow.herokuapp.com/api/archer
#
#################################################################

