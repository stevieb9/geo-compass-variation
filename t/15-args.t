use warnings;
use strict;

use Magnetic::Declination;
use Test::More;

my $m = 'Magnetic::Declination';
my $ok;

{ # not enough args

    $ok = eval {
        Magnetic::Declination::_args();
        1;
    };

    is $ok, undef, "0 args: minimum two args required";
    like $@, qr/Minimum latitude and longitude/, "and error is sane";

    $ok = eval {
        Magnetic::Declination::_args(1);
        1;
    };

    is $ok, undef, "1 args: minimum two args required";
    like $@, qr/Minimum latitude and longitude/, "and error is sane";
}

{ # lat
    $ok = eval {
        Magnetic::Declination::_args(-181, 0);
        1;
    };

    is $ok, undef, "lat can't be less than -180";
    like $@, qr/Latitude must be between/, "and error is sane";

    $ok = eval {
        Magnetic::Declination::_args(181, 0);
        1;
    };

    is $ok, undef, "lat can't be more than 180";
    like $@, qr/Latitude must be between/, "and error is sane";

    for (qw(! a A)) {
        $ok = eval {
            Magnetic::Declination::_args($_, 0);
            1;
        };

        is $ok, undef, "$_: lat has to be a number";
        like $@, qr/Latitude must be a number/, "and error is sane";
    }
}
{ # lon

    $ok = eval {
        Magnetic::Declination::_args(0, -181);
        1;
    };

    is $ok, undef, "lon can't be less than -180";
    like $@, qr/Longitude must be between/, "and error is sane";

    $ok = eval {
        Magnetic::Declination::_args(0, 181);
        1;
    };

    is $ok, undef, "lon can't be more than 180";
    like $@, qr/Longitude must be between/, "and error is sane";

    for (qw(! a A)) {
        $ok = eval {
            Magnetic::Declination::_args(0, $_);
            1;
        };

        is $ok, undef, "$_: lon has to be a number";
        like $@, qr/Longitude must be a number/, "and error is sane";
    }
}
{ # alt

    $ok = eval {
        Magnetic::Declination::_args(0, 0);
        1;
    };

    is $ok, 1, "default alt is set ok";

    $ok = eval {
        Magnetic::Declination::_args(0, 0, 1100);
        1;
    };

    is $ok, 1, "numerical alt ok";

    for (qw(! a A 1.1)) {
        $ok = eval {
            Magnetic::Declination::_args(0, 0, $_);
            1;
        };

        is $ok, undef, "$_: alt has to be an integer";
        like $@, qr/Altitude must be an integer/, "and error is sane";
    }
}
{ # year

    for (qw(! a A)) {
        $ok = eval {
            Magnetic::Declination::_args(0, 0, 0, $_);
            1;
        };

        is $ok, undef, "$_: year has to be a number";
        like $@, qr/Year must be a number/, "and error is sane";
    }
}
done_testing;
