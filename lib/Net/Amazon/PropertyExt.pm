package Net::Amazon::PropertyExt;

use strict;
use warnings;
use Carp;

our $VERSION = '0.01';

use base qw(Net::Amazon::Property);
use Net::Amazon::BrowseNode;

sub new {
    my($class, $prop) = @_;

    $prop or croak "missing property";
    my $self = bless $prop, $class;

    $self->{__BrowseNodes} = $self->_build_browsenodes;

    return $self;
}

sub _build_browsenodes {
    my($self) = @_;

    my $browse_nodes = $self->{xmlref}{BrowseNodes}{BrowseNode};

    if (ref($browse_nodes) eq "ARRAY") {
        for my $node (@{ $browse_nodes }) {
            if ($node->{Ancestors}{BrowseNode}{IsCategoryRoot}) {
                return [
                    map {
                        Net::Amazon::BrowseNode->new({
                            Name         => $_->{Name},
                            BrowseNodeId => $_->{BrowseNodeId},
                        })
                        } ($node, @{ $node->{Children}{BrowseNode} })
                       ];
            }
        }
    } elsif (ref($browse_nodes) eq "HASH") {
        return [
            Net::Amazon::BrowseNode->new({
                Name           => $browse_nodes->{Name},
                BrowseNodeId   => $browse_nodes->{BrowseNodeId},
            })
               ];
    } else {
        return [];
    }
}

sub BrowseNodes {
    my($self) = @_;
    croak "cannot alter the value of BrowseNodes on object of this class" if @_ > 1;
    return $self->{__BrowseNodes};
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
