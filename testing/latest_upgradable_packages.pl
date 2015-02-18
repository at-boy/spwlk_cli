#!/usr/bin/perl
use Frontier::Client;
use Data::Dumper;

$coder = Frontier::RPC2->new;

my $HOST = 'server';
my $user = 'user';
my $pass = 'password';

my $client = new Frontier::Client(url => "http://$HOST/rpc/api");
my $session = $client->call('auth.login',$user, $pass);

my $packages = $client->call('system.listLatestUpgradablePackages', $session, '<system_id>');

#print Dumper $systems;

foreach my $package (@$packages)
{
   print $package->{'name'}."\n";
}

$client->call('auth.logout', $session);
