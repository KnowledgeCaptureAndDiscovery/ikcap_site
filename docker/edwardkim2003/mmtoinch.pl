#!/home/varunr/perl/bin/perl
#temp.pl
#sample perl client for length conversion web service
#edward kim
#8/8/03

#location of xml file
my $WSDL = 
"http://www.xmlbus.com:9010/xmlbus/container/Converter/ConverterService/ConverterPort";
my $NS="urn:target-converter-service";
my $HOST="http://www.xmlbus.com:9010/xmlbus/container/Converter/ConverterService/ConverterPort";

use strict;
use SOAP::Lite +trace => qw (debug);

my $search = SOAP::Lite
->readable(1)
->xmlschema('http://www.w3.org/2001/XMLSchema')
->on_action( sub { return '""';} )
->proxy($HOST)
->uri($NS);

# inch variable
my $mm = 76.2;

my $method = SOAP::Data->name('mmToInch')
->uri($NS);

my $params =
SOAP::Data->name('param0' => $mm)->type('xsd:float');

my $results = $search->call($method => $params);

# print result
print $results;

1;
