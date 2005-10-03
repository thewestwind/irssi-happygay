#!/usr/bin/env perl
#
# Parses the .mrc file and outputs a bunch of perl code that we can
# happily include in our Irssi perl script

use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my %table;

while(<>) {
    chomp;

    if(my($alias, $text) = /^  \.([^:]+):\s+(.*)\s*$/) {
	$text =~ s~^/me~ctcp \$0 action~;
	$text =~ s~\$+~\$~g;

	$table{$alias} = $text;
    }
}

print Data::Dumper->new([\%table])->Indent(1)->Terse(1)->Dump
