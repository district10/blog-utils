#!/usr/bin/perl

use 5.010;
use strict;

sub inList {
    my $needle = shift;
    my @haystack = @_;
    foreach my $hay (@haystack) {
        if ( $needle eq $hay ) {
            return 1;
        }
    }
    return 0;
}

# unfold(padding, prefix, filename), print to stdout.
sub unfold {
    my($PADDING)  = shift @_;
    my($PREFIX)   = shift @_;
    my($FILENAME) = shift @_;

    if (&inList($FILENAME, @_) == 1) {
        # print "\t\t\tJust ignore it, $FILENAME is already in (@_)!!!\n";
        return;
    }
    unshift(@_, $FILENAME); # @_: processed file.

    # print "\t\t\t\t\t\tcur file: $FILENAME, file stack: (@_), padding: '$PADDING', prefix: '$PREFIX'\n";
    open my $INPUT, '<', $FILENAME;
    while(<$INPUT>) {
        #   padding         prefix   filename
        if (/^(\s*)\@include <-(.*)=(.*)=/) {
            &unfold(
                     $PADDING . $1,
                     $PREFIX . $2,
                     $3, @_ );
        } else {
            print $PADDING . $PREFIX . $_;
        }
    }
}

&unfold("", "", $ARGV[0]);
