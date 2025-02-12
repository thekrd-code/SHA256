use warnings;
use strict;

use Digest::SHA qw(sha256);
my $input_hash = shift;
my $sha256 = Digest::SHA->new(256);
$sha256->add($input_hash);
my $out = $sha256->hexdigest;
print "SHA256:$out\n";
