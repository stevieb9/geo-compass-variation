#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Magnetic::Declination' ) || print "Bail out!\n";
}

diag( "Testing Magnetic::Declination $Magnetic::Declination::VERSION, Perl $], $^X" );
