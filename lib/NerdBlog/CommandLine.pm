package NerdBlog::CommandLine;

use strict;
use warnings;

use Carp;

use NerdBlog::Profile;

my $HOME = '.nerdblog';

sub new {
    my ($class, $params) = @_;

    my $self = {};

    $self->{home} = $ENV{HOME};
    $self->{nerdhome} = $ENV{HOME} . '/' . '$HOME';

    bless $self, $class;
    return $self;
}

sub start {
    my ($self, $params) = @_;

    $self->init();
}


sub init {
    my ($self) = @_;

    $self->{profile} = NerdBlog::Profile->new($self);

}


sub confirm {
    my ($self, $question, $default) = @_;

    $question =~ s/\n*$//is;
    
    $default ||= 'y';

    my $tail = '';

    if ($default !~ m/^(?:y|n)$/is) {
        croak "Unknown defaults";
    }

    if ($default =~ m/y/is) {
        $tail = '[Y/n]';
    }
    else {
        $tail = '[y/N]';
    }

    $default = lc $default;

    print $question . $tail . "\n";
    my $res = <>;
    chomp $res;
    unless ($res) {
        my $resp = $default eq 'y' ? 1 : 0;
        return $resp;
    }

    if ($res !~ m/^(?:y|n)$/is) {
        $res = $self->confirm($question, $default);
    }

    if ($res eq 'y') {
        return 1;
    }

    return 0;
}

sub ask {
    my ($self, $question) = @_;
}

1;

__END__
