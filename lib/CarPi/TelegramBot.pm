package CarPi::TelegramBot;
no warnings 'experimental::signatures';
use feature 'signatures';

use Mojo::Base 'Telegram::Bot::Brain';
use Config::General;
use Data::Dumper;
use lib "$ENV{BOT_HOME}/lib";

has _token => undef;
has token => sub {
    my ($self) = @_;
    if (!$self->_token) {
        $self->_token($self->mainconfig->{'Telegram::Bot'}{'api'});
    };
    return $self->_token();
};

has _mainconfig => undef;
has 'mainconfig' => sub ($self) {
    if (!$self->_mainconfig) {
        $self->_mainconfig({Config::General->new("$ENV{BOT_HOME}/keys.conf")->getall()});
    }

    if (wantarray) {
        return %{$self->_mainconfig};
    } else {
        return $self->_mainconfig;
    }
};

has bot_name => '';
has me => undef;

sub init {
    my $self = shift;
    $self->add_listener(\&read_message);
}

sub read_message {
}

1;
