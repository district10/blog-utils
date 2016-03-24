#!/usr/bin/perl

use 5.010;
use strict;
use Digest::MD5 qw(md5_hex);
use autodie;
 
# my $digest = &md5_hex('abcdefg1234567890'); print $digest;

if (@ARGV < 3) {
    print $ARGV;
    die "Not enough arguments\n";
}

open IMD, '<', $ARGV[0];
open OMD, '>', $ARGV[1];
open TAGS, '>', $ARGV[2];

my $hdr = <<__;
% Reads | 斋读
% TANG ZhiXiong
% 2015-12-07

Reads | 斋读
============
__

print OMD $hdr . "\n";

my $curAnchor;
while (<IMD>) {
    my $line = $_;

    # tags
    if (/\s*<#>(.*)/) {
        $line =~ s/.*<#>//;
        print TAGS $curAnchor, ': ', $line;
        next;
    }

    # one reading material
    if (/^\[.*?\](.*)$/) {
        $line =~ s/\r?\n?$//;
        my $url = $line =~ s/dogs/cats/r;
        my $hex = &md5_hex($url);
        print OMD '- ', $line, ' `@`{.tzx-anchor #', $hex, '}', "\n";
        $curAnchor = $hex;
        next;
    }
}

close IMD;
close OMD;
close TAGS;
