package NerdBlog::Profile;
use strict;
use warnings;
use Carp;

my $defaults = {};

sub new {
    my ($class, $no) = @_;

    my $self = {};
    
    unless (-e $no->{nerdhome}) {
        my $res = $no->confirm("No profile found. Create one?");
        print "RES: $res\n";
    }
}

__END__

1;
