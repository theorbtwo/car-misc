#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

#use Getopt::Long;

use lib "$ENV{BOT_HOME}/lib";
use CarPi::TelegramBot;

my $message = shift;

my $bot = CarPi::TelegramBot->new();
my $me = $bot->getMe();
use Data::Dumper;
say "Result from getMe call:";
say Dumper($me->as_hashref);
$bot->bot_name($me->as_hashref->{username});
$bot->me($me);

$bot->sendMessage({
    chat_id => $bot->mainconfig->{'Telegram::Bot'}{'car_chat_id'},
    text => $message
});
$bot->think();
