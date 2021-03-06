package Paws::ApiGateway::EndpointConfiguration;
  use Moose;
  has Types => (is => 'ro', isa => 'ArrayRef[Str|Undef]', request_name => 'types', traits => ['NameInRequest']);
  has VpcEndpointIds => (is => 'ro', isa => 'ArrayRef[Str|Undef]', request_name => 'vpcEndpointIds', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::ApiGateway::EndpointConfiguration

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::ApiGateway::EndpointConfiguration object:

  $service_obj->Method(Att1 => { Types => $value, ..., VpcEndpointIds => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::ApiGateway::EndpointConfiguration object:

  $result = $service_obj->Method(...);
  $result->Att1->Types

=head1 DESCRIPTION

The endpoint configuration to indicate the types of endpoints an API
(RestApi) or its custom domain name (DomainName) has.

=head1 ATTRIBUTES


=head2 Types => ArrayRef[Str|Undef]

  A list of endpoint types of an API (RestApi) or its custom domain name
(DomainName). For an edge-optimized API and its custom domain name, the
endpoint type is C<"EDGE">. For a regional API and its custom domain
name, the endpoint type is C<REGIONAL>. For a private API, the endpoint
type is C<PRIVATE>.


=head2 VpcEndpointIds => ArrayRef[Str|Undef]

  A list of VpcEndpointIds of an API (RestApi) against which to create
Route53 ALIASes. It is only supported for C<PRIVATE> endpoint type.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::ApiGateway>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

