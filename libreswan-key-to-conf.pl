#!/usr/bin/perl

#use strict;
use warnings;

sub usage {
    $0 =~ /([^\/]+)$/;
    my $name = $&;
    print "$name [host+keyfile]
    each line of host+keyfile should contain the short hostname,
    IP address,
    and the key returned from 'ipsec showhostkey --left'\n
    This program then outputs ipsec.conf content to support
    all of the connections.
    \n";
    exit 1;
}

if ( !defined $ARGV[0] ) {
    usage;
}

open (STDI, "$ARGV[0]") or die "Can't open your lame input file: $!";

my $section=0;

my @hosts = <STDI> ;
my (@a, @b) ;

#foreach $i (@hosts) {

for ($i = 0; $i < $#hosts ; $i++) {
    for ($j = $i+1 ; $j <= $#hosts ; $j++) {
	@a = split(/,/,$hosts[$i]);
	@b = split(/,/,$hosts[$j]);
	print "conn $a[0]+$b[0]\n";
	print "\tleftid=\@$a[0]\n";
	print "\tleft=$a[1]\n";
	print "\tleftrsasigkey=$a[2]";
	print "\trightid=\@$b[0]\n";
	print "\tright=$b[1]\n";
	print "\trightrsasigkey=$b[2]";
	print "\tauthby=rsasig\n";
	print "\tauto=start\n\n";
    }
}

close STDI;
