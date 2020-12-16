use warnings;
use strict;

use Geo::Compass::Variation qw(mag_inc);
use Test::More;

my $year = 2022.5;

my $data = [
    [51.0486, -114.0708, 1100, $year, 73.0667295172772, "Calgary"],
    [43.6666667, -79.4166667, 76, $year, 69.2159117036211, "Toronto"],
    [34.0522, -118.2437, 71, $year, 58.8444560581494, "Los Angeles"],
    [35.6895, 139.6917, 44, $year, 49.5063996903631, "Tkyo"],
    [-33.8688, 151.2093, 58, $year, -64.3815494454267, "Sydney"],
];

for my $t (@$data){
    like mag_inc(@$t), qr/$t->[4]/, "$t->[5] inclination ok";
}

done_testing;

