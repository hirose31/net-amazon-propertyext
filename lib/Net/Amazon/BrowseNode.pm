package Net::Amazon::BrowseNode;

use strict;
use warnings;
use Carp;

our $VERSION = '0.01';

sub new {
    my ($class, $args) = @_;
    my $self = bless {}, $class;
    $self->{BrowseNodeId} = $args->{BrowseNodeId};
    $self->{Name} = $args->{Name};
    $self;
}

sub BrowseNodeId {
    my $self = shift;
    @_ ? $self->{BrowseNodeId} = shift : $self->{BrowseNodeId};
}

sub Name {
    my $self = shift;
    @_ ? $self->{Name} = shift : $self->{Name};
}

1;

__END__

=head1 NAME

Net::Amazon::BrowseNode - [One line description of module's purpose here] FIXME

=head1 SYNOPSIS

    use Net::Amazon::BrowseNode;

    my $foo = Net::Amazon::BrowseNode->new; FIXME
    ...

=head1 DESCRIPTION

FIXME

=head1 FUNCTIONS

or FIXME

=head1 METHODS

=head2 new

  $obj = Net::Amazon::BrowseNode->new( %option )

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
