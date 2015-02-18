#!/usr/bin/perl
use Frontier::Client;
use Data::Dumper;

$coder = Frontier::RPC2->new;

my $HOST = 'server';
my $user = 'user';
my $pass = 'password';

my $client = new Frontier::Client(url => "http://$HOST/rpc/api");
my $session = $client->call('auth.login',$user, $pass);

my $systems = $client->call('system.listInactiveSystems', $session);

#print Dumper $systems;

foreach my $system (@$systems)
{
   my $date_time = $system->{'last_checkin'};
   $date_time = sprintf("%d-%02d-%02d", unpack('A4A2A2AA8', $date_time->value()));
   print $system->{'name'}." last checked in ".$date_time."\n";
}

$client->call('auth.logout', $session);
