#!/usr/bin/env perl
use strict;
use warnings;
# $\ = "\n";

print "Hello, enter path you wanna to edit:\n";
print ">";

my $filename = <>;
chomp $filename;
print "Filename: $filename\n";

my $res = system 'vi', $filename;

print "Your file is: $filename\n";
print "Stat: file ", -s $filename;
