#! /usr/bin/env perl


BEGIN {
       @INC = ( @INC, ".." );
};

use strict;
use WSRF::Lite +trace =>  debug => sub {};
#use WSRF::Lite;

#need to point to users certificates - these are only used
#if https protocal is being used.
$ENV{HTTPS_CA_DIR} = "/etc/grid-security/certificates/";
$ENV{HTTPS_CERT_FILE} = $ENV{HOME}."/.globus/usercert.pem";
$ENV{HTTPS_KEY_FILE}  = $ENV{HOME}."/.globus/userkey.pem";

# Tells WSRF::Lite to Sign the SOAP message
# Uses the X509 above, private key must be unencrypted
#$ENV{WSS_SIGN} = 'true';

if ( @ARGV lt 1 )
{
  print "  Script to retrieve mutiple properties of a WS-Resource\n\n";	
  print "Usage:\n wsrf_getMultipleResourceProperties.pl URL Property Property\n\n";
  print "     URL is the endpoint of the Service\n";
  print "     Property is the ResourceProperty to retrieve eg. TerminationTime, CurrentTime, count or foo\n\n";
  print "wsrf_getResourceMultipleProperties.pl http://localhost:50000/MultiSession/Counter/Counter/19501981104038050279 count TerminationTime\n";
 exit;
}


#get the location of the service
my $target = shift @ARGV;


#get the property name to retrieve
my @props = @ARGV;

my $searchTerm  = "";

print "   Trying to get multiple Resource Properties <";
foreach my $item (@props) {
  print "$item ";
  $searchTerm .= "<wsrp:ResourceProperty xmlns:wsrp=\"$WSRF::Constants::WSRP\">$item</wsrp:ResourceProperty>"; 
}

print "> from $target \n";


my $ans=  WSRF::Lite
       -> uri($WSRF::Constants::WSRP)
       -> wsaddress(WSRF::WS_Address->new()->Address($target))   
       -> GetMultipleResourceProperties( SOAP::Data->value($searchTerm)->type('xml') );             #function + args to invoke



#check if the ans has been signed
eval{
   # the WSRF::WSS::verify checks for a signature, if the message is not 
   # signed or not signed correctly verify will die. verify returns a 
   # hash containing the the X509 used to sign the message, the timestamp 
   # and the names of the elements used to sign the message  
   my %results = WSRF::WSS::verify($ans);

   # The X509 certificate that signed the message
   print "X509 certificate=>\n$results{X509}\n" if $results{X509};

   #print the name of each element that is signed
   foreach my $key ( keys %{$results{PartsSigned}} )
   {
     print "\"$key\" of message is signed.\n";
   }

   #print the creation and expiration time of the message
   print "Message Created at \"$results{Created}\".\n" if $results{Created};
   print "Message Expires at \"$results{Expires}\".\n" if $results{Expires}; 
};
if ($@) 
{ 
   print STDERR "WARNING: SOAP Message not signed.\nWARNING $@\n"; 
}

       
if ($ans->fault) {  die "\nERROR: ".$ans->faultcode." ".$ans->faultstring."\n\n"; }

foreach my $prop_name (@props) { 
  $prop_name =~ s/\w*://;
  if(defined($ans->valueof("//$prop_name"))) {
	 foreach my $item ($ans->valueof("//$prop_name")) {
     	       print "   Returned value \"$item\" for \"$prop_name\"\n";
     	 }
  }
  else {
    print "   No \"$prop_name\" returned\n\n";
  }
}


