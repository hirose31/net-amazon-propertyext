use inc::Module::Install;

name        'Net-Amazon-PropertyExt';
all_from    'lib/Net/Amazon/PropertyExt.pm';

requires 'Net::Amazon'      => 0;

build_requires 'Test::More' => 0;

use_test_base;
auto_install;
WriteAll;

