#!/home/varunr/perl/bin/perl
#temp.pl
#sample perl client for temperature web service
#xml file = ITempConverter.xml
#edward kim
#8/8/03

#location of xml file
my $WSDL = 
"http://developerdays.com/cgi-bin/tempconverter.exe/wsdl/ITempConverter";
my $NS="http://www.borland.com/soapServices/";
my
$HOST="http://developerdays.com/cgi-bin/tempconverter.exe/soap/ITempConverter";

use strict;
use SOAP::Lite +trace => qw (debug);

my $search = SOAP::Lite
->readable(1)
->xmlschema('http://www.w3.org/2001/XMLSchema')
->on_action( sub { return '""';} )
->proxy($HOST)
->uri($NS);

# celcius variable
my $cel = 25;

my $method = SOAP::Data->name('CtoF')
->uri($NS);

my $params =
SOAP::Data->name('temp' => $cel)->type('xsd:int');

my $results = $search->call($method => $params);

# print result
print $results;

1;