#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

my $mod = 'Magnetic::Declination';

BEGIN {
    use_ok( 'Magnetic::Declination' ) || print "Bail out!\n";
}

diag( "Testing Magnetic::Declination $Magnetic::Declination::VERSION, Perl $], $^X" );

can_ok($mod, 'mag_dec');
can_ok($mod, 'mag_inc');

done_testing;
