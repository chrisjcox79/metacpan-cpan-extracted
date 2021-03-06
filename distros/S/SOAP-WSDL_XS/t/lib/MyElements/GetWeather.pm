package MyElements::GetWeather;
use strict;
use warnings;

{ # BLOCK to scope variables

sub get_xmlns { 'http://www.webserviceX.NET' }

__PACKAGE__->__set_name('GetWeather');
__PACKAGE__->__set_nillable();
__PACKAGE__->__set_minOccurs();
__PACKAGE__->__set_maxOccurs();
__PACKAGE__->__set_ref();

use base qw(
	SOAP::WSDL::XSD::Typelib::Element
	SOAP::WSDL::XSD::Typelib::ComplexType
);
use Class::Std::Storable;
use base qw(SOAP::WSDL::XSD::Typelib::ComplexType);

{ # BLOCK to scope variables

my %CityName_of :ATTR(:get<CityName>);
my %CountryName_of :ATTR(:get<CountryName>);

__PACKAGE__->_factory(
    [ qw(
        CityName
        CountryName
    ) ],
    { 
		CityName => \%CityName_of, 
		CountryName => \%CountryName_of, 
    },
    {
        CityName => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        CountryName => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
    }
);

} # end BLOCK







} # end of BLOCK
1;

# __END__

=pod

=head1 NAME

MyElements::GetWeather

=head1 DESCRIPTION

Perl data type class for the XML Schema defined element
GetWeather from the namespace http://www.webserviceX.NET.

=head1 METHODS

=head2 new

 my $element = MyElements::GetWeather->new($data);

Constructor. The following data structure may be passed to new():

 {
   CityName =>  $some_value, # string
   CountryName =>  $some_value, # string
 }

=head1 AUTHOR

Generated by SOAP::WSDL

=cut

