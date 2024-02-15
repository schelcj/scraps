#!/usr/bin/env perl
#

use Modern::Perl;

use LWP::UserAgent;
use HTTP::Request;
use XML::Parser;

# Update these values to match your user settings and instance URL. This example will work against Secret Server Online.
my $username         = "";
my $password         = "";
my $organizationCode = "";           # Can be left blank for Secret Server Installed (on-premise) edition
my $domain           = "";               # Only needed for AD login
my $WebServiceUrl = "https://tss.merit.edu/webservices/SSWebService.asmx";    # Or URL to your server and to the SSWebService.asmx file

# The main script calls
my $authtoken = GetToken($username, $password, $organizationCode, $domain);
my $secretInXML = GetSecretLegacy($authtoken, "88395");
print $secretInXML;

# 1) Authentication Token
sub GetToken() {
    my ($username, $password, $organizationCode, $domain) = @_;
    my $url = $WebServiceUrl . "/Authenticate?username=$username&password=$password&organization=$organizationCode&domain=$domain";
    my $response = WSRequest($url);
    my $token    = "";
    if ($response->is_success) {
        my $tokenXML = $response->content;
        if ($tokenXML =~ m/<Token>(.+)<\/Token>/) {
            $token = $1;
        }
        if ($token eq "") {
            die "Login failed";
        }
    } else {
        print $response->content;
    }
    return $token;
}

# 2) Load a Secret
# Note: The SecretId can be found by going to the SecretView page and in the QueryString will be SecretId=#
sub GetSecretLegacy() {
    my ($token, $secretId) = @_;
    my $url      = $WebServiceUrl . "/GetSecretLegacy?token=" . $token . "&secretId=" . $secretId;
    my $response = WSRequest($url);
    my $secret;
    if ($response->is_success) {
        $secret = $response->content;
    }
    return $secret;
}

sub WSRequest() {
    my ($url) = @_;
    my $agent = LWP::UserAgent->new(env_proxy => 1, keep_alive => 1, timeout => 30);
    my $header = HTTP::Request->new(GET => $url);
    my $request = HTTP::Request->new('GET', $url, $header);
    my $response = $agent->request($request);
    return $response;
}
