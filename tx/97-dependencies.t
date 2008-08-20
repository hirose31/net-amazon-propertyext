# -*- mode: cperl; -*-
use Test::Dependencies
    exclude => [qw(Test::Dependencies Test::Base Test::Perl::Critic
                   Net::Amazon::Property
                   Net::Amazon::BrowseNode
                 )],
    style   => 'light';
ok_dependencies();
