use warnings;
use strict;

use Magnetic::Declination qw(mag_dec);
use Test::More;

my $year;
(undef, undef, undef, undef, undef, $year) = localtime;
$year += 1900;

my @t = (51.0486, -114.0708, 1100, $year);

my $ok = eval {
    mag_dec(@t);
    1;
};

is $ok, 1, "data year is within spec";

done_testing;

