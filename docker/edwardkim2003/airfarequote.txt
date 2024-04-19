#!/home/varunr/perl/bin/perl
#
# airfare.pl
# Author: breese at grandcentral.com
print "Content-type:text/html\n\n";

# Location of the WSDL file
my $WSDL
="http://wavendon.dsdata.co.uk:8080/axis/services/SBGGetAirFareQuote?wsdl";
my $NS = "urn:SBGAirFareQuotes.sbg.travel.ws.dsdata.co.uk";
my $HOST = "http://wavendon.dsdata.co.uk:8080/axis/services/SBGGetAirFareQuote";

use strict;
use SOAP::Lite +trace => qw (debug);

my $search = SOAP::Lite
->readable(1)
->xmlschema('http://www.w3.org/2001/XMLSchema')
->on_action( sub { return '""';} )
->proxy($HOST)
->uri($NS);

# CCYY-MM-DDThh:mm:ss
my $outwardDate = "2003-04-28T08:00:00.000Z";
my $returnDate = "2003-05-05T08:00:00.000Z";
my $origin = "LAX";
my $destination = "JFK";

my $method = SOAP::Data->name('getAirFareQuote')
->prefix('air')
->uri($NS);

my $params =
SOAP::Data
->type('air:AirFareQuoteRequest')
->name('in0' =>
\SOAP::Data->value(
SOAP::Data->name('outwardDate' => $outwardDate)->type('xsd:dateTime'),
SOAP::Data->name('returnDate' => $returnDate)->type('xsd:dateTime'),
SOAP::Data->name('originAirport' => $origin),
SOAP::Data->name('destinationAirport' => $destination)
));

my $results = $search->call($method => $params);

# Loop through the results
foreach my $result (@{$results->{'result'}}) {
print $result->{airlineName} . ": " . $result->{fare} . "\n";
}

1;