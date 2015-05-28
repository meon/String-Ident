#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use utf8;

use KB::Stats::Test;

use_ok('String::Ident') or die;

my $ident = String::Ident->cleanup('');
is(length($ident),4, 'default min length 4');
is(length(String::Ident->cleanup('x'x100)),30, 'default max length 30');
is(String::Ident->cleanup('Hěλλo wœřľδ!'),'Hello-woerld', 'unidecode');

done_testing();
