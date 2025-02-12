use strict;
use warnings;
use Digest::SHA qw(sha256_hex);

my $target_hash = shift or die "Usage: perl crack.pl <hash>\n";

my @chars = ('a' .. 'z', 'A' .. 'Z', '0' .. '9'); 

sub brute_force {
    my ($length, $current) = @_;
    return if length($current) > $length;

    my $hash = sha256_hex($current);
    if ($hash eq $target_hash) {
        print "Match found! Original text: $current\n";
        exit;
    }

    foreach my $char (@chars) {
        brute_force($length, $current . $char);
    }
}

print "Brute force attack started...\n";
for my $len (1..5) { 
    brute_force($len, '');
}
print "Not found.\n";