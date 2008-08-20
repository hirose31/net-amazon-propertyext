package Net::Amazon::PropertyExt;

use strict;
use warnings;
use Carp;

# fixme deleteme
use Data::Dumper;
sub d(@) {
    my $d = Dumper(\@_);
    $d =~ s/\\x{([0-9a-z]+)}/chr(hex($1))/ge;
    print $d;
}

our $VERSION = '0.01';

use base qw(Net::Amazon::Property);
use Net::Amazon::BrowseNode;

sub new {
    my $class = shift;
    my $prop = shift or die;
    my $self = bless $prop, $class;
    $self->_set_browsenodes;
    return $self;
}

sub _set_browsenodes {
    my $self = shift;
    my $browse_nodes = $self->{xmlref}->{BrowseNodes}->{BrowseNode};
    #d $browse_nodes;
    if (ref($browse_nodes) eq "ARRAY") {
        my @nodes;
        for my $node (@{ $browse_nodes }) {
            #warn exists $node->{Ancestors}{BrowseNode}{IsCategoryRoot} ? 'T' : 'F';
            if ($node->{Ancestors}{BrowseNode}{IsCategoryRoot}) {
                push @nodes, Net::Amazon::BrowseNode->new({
                    Name => $node->{Name},
                    BrowseNodeId   => $node->{BrowseNodeId},
                });
                for my $child (@{ $node->{Children}{BrowseNode} }) {
                    push @nodes, Net::Amazon::BrowseNode->new({
                        Name => $child->{Name},
                        BrowseNodeId   => $child->{BrowseNodeId},
                    });
                }
                last;
            }
        }
        $self->browsenodes(\@nodes);
    } elsif (ref($browse_nodes) eq "HASH") {
        $self->browsenode([ Net::Amazon::BrowseNode->new({
            Name => $browse_nodes->{Name},
            BrowseNodeId   => $browse_nodes->{BrowseNodeId},
        }) ]);
    } else {
        $self->browse_nodes([ ]);
    }
}

sub browsenodes {
    my $self = shift;
    @_ ? $self->{__browsenode} = shift: $self->{__browsenode};
}

1;

__END__

=head1 NAME

Net::Amazon::PropertyExt - [One line description of module's purpose here] FIXME

=head1 SYNOPSIS

use Net::Amazon::PropertyExt;

my $foo = Net::Amazon::PropertyExt->new; FIXME
...

=head1 DESCRIPTION

FIXME

=head1 FUNCTIONS

or FIXME

=head1 METHODS

=head2 new

$obj = Net::Amazon::PropertyExt->new( %option )

FIXME ...

=head2 some_method

$ret = $obj->some_method

FIXME ...

=head1 SEE ALSO

L<Some::Module::FIXME>
L<http://www.perl.org/FIXME>

=head1 AUTHOR

HIROSE Masaaki, C<< <hirose31@gmail.com> >>

originally code: Naoya Ito

=head1 BUGS

Please report any bugs or feature requests to
C<bug-net-amazon-propertyext@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically be
notified of progress on your bug as I make changes.

=head1 COPYRIGHT & LICENSE

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
