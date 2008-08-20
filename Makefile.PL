use inc::Module::Install;

name        'Net-Amazon-PropertyExt';
all_from    'lib/Net/Amazon/PropertyExt.pm';

requires 'UNIVERSAL::require'    => 0;

build_requires 'Test::More'      => 0;
build_requires 'Test::Base'      => 0;

use_test_base;
auto_install;
WriteAll;

