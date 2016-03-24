#!/usr/bin/perl

use 5.010;
use strict;
use Digest::MD5 qw(md5_hex);
use autodie;

if (@ARGV < 3) {
    print $ARGV;
    die "Usage:\n\tperl eoar.pl in.md out.md out.tags\n";
}

open IMD,  '<', $ARGV[0];
open OMD,  '>', $ARGV[1];
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
my $level = 0;
my $codeId = 0;
while (<IMD>) {
    my $line = $_;

    # code, verbatim
    if ($level > 0) {
        if ( $line =~ /^\s*(```[`\s]*)$/ ||
             $line =~ /^\s*(~~~[~\s]*)$/ )
        {
            die if --$level < 0;
            $line =~ s/${1}/~~~\n/;
        }
        print $line;
        next;
    }

    # tags
    if (/(\s*)<#(.*?)>(.*)/) {
        my $prefix = $1 // "";
        my $anchor = $2 // "";
        $line =~ s/.*<#.*?>//;
        if ($anchor) {
            print TAGS '#', $anchor, ': ', $line;
            print $prefix . '`@`{.tzx-anchor #' . $anchor . '}' . "\n";
            next;
        }
        print TAGS '#', $curAnchor, ': ', $line;
        next if <IMD> =~ /^\s*$/;
        next;
    }

    # one reading material
    if (/^\[.*?\](.*)$/) {
        $line =~ s/\r?\n?$//;
        my $url = $line;
        my $hex = &md5_hex($url);
        my $suffix = ' `@`{.tzx-anchor #' . $hex . '}' . "\n";
        print OMD '- ', $line, $suffix;
        print $line, $suffix;
        $curAnchor = $hex;
        next;
    }

    # assume $level = 0;
    if ( $line =~ /^\s*(```)(.*)$/ ) {
        ++$level;
        $line =~ s/${1}.*\r?\n?$/~~~/;
        my @options = ();
        my $lang = ${2} // "";
        if ($lang) { $lang = '.' . $lang; }
        my $id = '#auto-listing-' . ++$codeId;
        push @options, $lang;
        push @options, $id;
        my $suffix = join(' ', @options);
        $suffix =~ s/^\s+|\s+$//g;
        $suffix = ' {' . $suffix . '}';
        print $line, $suffix, "\n";
        next;
    }

    if ($line =~ /^\s*(~~~~*)(.*)$/) {
        ++$level;
        my $options = ${2} // "";
        $line =~ s/${1}.*\r?\n?$/~~~/;
        $options =~ s/.*{//g;
        $options =~ s/}.*//g;
        if (! /#/) {
            my $id = '#auto-listing-' . ++$codeId;
            $options = $id . ' ' . $options;
        }
        $options =~ s/^\s+|\s+$//g;
        if ($options) {
            $options = ' {' . $options . '}';
        }
        print $line, $options, "\n";
        next;
    }

    print $line;
}

close IMD;
close OMD;
close TAGS;
