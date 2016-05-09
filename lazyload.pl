#!/usr/bin/perl

use 5.010;
use strict;
use autodie;

while (<>) {
    s/<img src="(.*)" \/>/<img data-src="$1" \/>/i;
    print;
}
