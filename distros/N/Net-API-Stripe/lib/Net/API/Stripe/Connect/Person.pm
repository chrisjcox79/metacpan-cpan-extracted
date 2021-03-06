##----------------------------------------------------------------------------
## Stripe API - ~/lib/Net/API/Stripe/Connect/Person.pm
## Version v0.200.1
## Copyright(c) 2020 DEGUEST Pte. Ltd.
## Author: Jacques Deguest <@sitael.tokyo.deguest.jp>
## Created 2019/11/02
## Modified 2020/05/21
## 
##----------------------------------------------------------------------------
package Net::API::Stripe::Connect::Person;
BEGIN
{
	use strict;
	use parent qw( Net::API::Stripe::Generic );
	use DateTime;
	use DateTime::Format::Strptime;
	use Nice::Try;
	our( $VERSION ) = 'v0.200.1';
};

sub id { return( shift->_set_get_scalar( 'id', @_ ) ); }

sub object { return( shift->_set_get_scalar( 'object', @_ ) ); }

sub account { return( shift->_set_get_scalar_or_object( 'account', 'Net::API::Stripe::Connect::Account', @_ ) ); }

sub address { return( shift->_set_get_object( 'address', 'Net::API::Stripe::Address', @_ ) ); }

sub address_kana { return( shift->_set_get_object( 'address_kana', 'Net::API::Stripe::Address', @_ ) ); }

sub address_kanji { return( shift->_set_get_object( 'address_kanji', 'Net::API::Stripe::Address', @_ ) ); }

sub created { return( shift->_set_get_datetime( 'created', @_ ) ); }

sub dob
{
	my $self = shift( @_ );
	if( @_ )
	{
		## There may be a hash provided with undefined values for each of the properties, so we need to check that
		my $ref = shift( @_ );
		my $dt;
		if( $self->_is_object( $ref ) && $ref->isa( 'DateTime' ) )
		{
			$dt = $ref;
		}
		elsif( $self->_is_hash( $ref ) )
		{
			return if( !length( $ref->{year} ) && !length( $ref->{month} ) && !length( $ref->{day} ) );
		
			foreach my $k ( qw( year month day ) )
			{
				return( $self->error( "Hash provided for person date of birth is missing the $k property" ) ) if( !$ref->{ $k } );
			}
			@$ref{ qw( hour minute second ) } = ( 0, 0, 0 );
			try
			{
				$dt = DateTime->new( %$ref );
			}
			catch( $e )
			{
				return( $self->error( "An error occurred while trying to create a datetime object from this person's date of birth (year = '$ref->{year}', month = '$ref->{month}', day = '$ref->{day}'." ) );
			}
		}
		my $fmt = DateTime::Format::Strptime->new(
			pattern => '%Y-%m-%d',
			locale => 'en_GB',
			time_zone => 'local',
		);
		$dt->set_formatter( $fmt );
		$self->{dob} = $dt;
	}
	return( $self->{dob} );
}

sub email { return( shift->_set_get_scalar( 'email', @_ ) ); }

sub first_name { return( shift->_set_get_scalar( 'first_name', @_ ) ); }

sub first_name_kana { return( shift->_set_get_scalar( 'first_name_kana', @_ ) ); }

sub first_name_kanji { return( shift->_set_get_scalar( 'first_name_kanji', @_ ) ); }

sub gender { return( shift->_set_get_scalar( 'gender', @_ ) ); }

sub id_number_provided { return( shift->_set_get_boolean( 'id_number_provided', @_ ) ); }

sub last_name { return( shift->_set_get_scalar( 'last_name', @_ ) ); }

sub last_name_kana { return( shift->_set_get_scalar( 'last_name_kana', @_ ) ); }

sub last_name_kanji { return( shift->_set_get_scalar( 'last_name_kanji', @_ ) ); }

sub maiden_name { return( shift->_set_get_scalar( 'maiden_name', @_ ) ); }

sub metadata { return( shift->_set_get_hash( 'metadata', @_ ) ); }

sub phone { return( shift->_set_get_scalar( 'phone', @_ ) ); }

sub relationship { return( shift->_set_get_object( 'relationship', 'Net::API::Stripe::Connect::Account::Relationship', @_ ) ); }

sub requirements { return( shift->_set_get_object( 'requirements', 'Net::API::Stripe::Connect::Account::Requirements', @_ ) ); }

sub ssn_last_4_provided { return( shift->_set_get_boolean( 'ssn_last_4_provided', @_ ) ); }

sub verification { return( shift->_set_get_object( 'verification', 'Net::API::Stripe::Connect::Account::Verification', @_ ) ); }

1;

__END__

=encoding utf8

=head1 NAME

Net::API::Stripe::Connect::Person - A Stripe Person Object

=head1 SYNOPSIS

    my $pers = $stripe->person({
        account => $account_object,
        address => $address_object,
        address_kana => $address_kana_object,
        address_kanji => $address_kanji_object,
        # or:
        # dob => DateTime->new( year => 1985, month => 8, day => 15 )
        dob => 
        {
        	day => 15
        	month => 8,
        	year => 1985,
        },
        email => 'nadeshiko.yamato@example.com',
        first_name => 'Nadeshiko',
        last_name => 'Yamato',
        first_name_kana => 'なでしこ',
        last_name_kana => 'やまと',
        first_name_kanji => '撫子',
        last_name_kanji => '大和',
        gender => 'female',
        metadata => { transaction_id => 123, customer_id => 456 },
        phone => '+81-(0)90-1234-5678',
    });

See documentation in L<Net::API::Stripe> for example to make api calls to Stripe to create those objects.

=head1 VERSION

    v0.200.1

=head1 DESCRIPTION

This is an object representing a person associated with a Stripe account.

=head1 CONSTRUCTOR

=over 4

=item B<new>( %ARG )

Creates a new L<Net::API::Stripe::Connect::Person> object.
It may also take an hash like arguments, that also are method of the same name.

=back

=head1 METHODS

=over 4

=item B<id> string

Unique identifier for the object.

=item B<object> string, value is "person"

String representing the object’s type. Objects of the same type share the same value.

=item B<account> string

The account the person is associated with. If expanded (currently not implemented in Stripe API), this will be a L<Net::API::Stripe::Connect::Account> object.

=item B<address> hash

The person’s address.

This is L<Net::API::Stripe::Address> object.

=item B<address_kana> hash

The Kana variation of the person’s address (Japan only).

This is L<Net::API::Stripe::Address> object.

=item B<address_kanji> hash

The Kanji variation of the person’s address (Japan only).

This is L<Net::API::Stripe::Address> object.

=item B<created> timestamp

Time at which the object was created. Measured in seconds since the Unix epoch.

=item B<dob> L<DateTime> object or hash

The person’s date of birth.

This returns a C<DateTime> object. It can take either a L<DateTime> object or an hash with the following properties:

=over 8

=item I<day> positive integer

The day of birth, between 1 and 31.

=item I<month> positive integer

The month of birth, between 1 and 12.

=item I<year> positive integer

The four-digit year of birth.

=back

=item B<email> string

The person’s email address.

=item B<first_name> string

The person’s first name.

=item B<first_name_kana> string

The Kana variation of the person’s first name (Japan only).

=item B<first_name_kanji> string

The Kanji variation of the person’s first name (Japan only).

=item B<gender> string

The person’s gender (International regulations require either “male” or “female”).

=item B<id_number_provided> boolean

Whether the person’s id_number was provided.

=item B<last_name> string

The person’s last name.

=item B<last_name_kana> string

The Kana variation of the person’s last name (Japan only).

=item B<last_name_kanji> string

The Kanji variation of the person’s last name (Japan only).

=item B<maiden_name> string

The person’s maiden name.

=item B<metadata> hash

Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.

=item B<phone> string

The person’s phone number.

=item B<relationship> hash

Describes the person’s relationship to the account.

This is a L<Net::API::Stripe::Connect::Account::Relationship> object.

=item B<requirements> hash

Information about the requirements for this person, including what information needs to be collected, and by when.

This is a L<Net::API::Stripe::Connect::Account::Requirements> object.

=item B<ssn_last_4_provided> boolean

Whether the last 4 digits of this person’s SSN have been provided.

=item B<verification> hash

The persons’s verification status.

This is a L<Net::API::Stripe::Connect::Account::Verification> object.

=back

=head1 API SAMPLE

	{
	  "id": "person_fake123456789",
	  "object": "person",
	  "account": "acct_fake123456789",
	  "created": 1571602397,
	  "dob": {
		"day": null,
		"month": null,
		"year": null
	  },
	  "first_name_kana": null,
	  "first_name_kanji": null,
	  "gender": null,
	  "last_name_kana": null,
	  "last_name_kanji": null,
	  "metadata": {},
	  "relationship": {
		"director": false,
		"executive": false,
		"owner": false,
		"percent_ownership": null,
		"representative": false,
		"title": null
	  },
	  "requirements": {
		"currently_due": [],
		"eventually_due": [],
		"past_due": [],
		"pending_verification": []
	  },
	  "verification": {
		"additional_document": {
		  "back": null,
		  "details": null,
		  "details_code": null,
		  "front": null
		},
		"details": null,
		"details_code": null,
		"document": {
		  "back": null,
		  "details": null,
		  "details_code": null,
		  "front": null
		},
		"status": "unverified"
	  }
	}

=head1 HISTORY

=head2 v0.1

Initial version

=head2 v0.2

Update the method B<dob> to accept L<DateTime> objects

=head1 AUTHOR

Jacques Deguest E<lt>F<jack@deguest.jp>E<gt>

=head1 SEE ALSO

Stripe API documentation:

L<https://stripe.com/docs/api/persons/object>, L<https://stripe.com/docs/connect/identity-verification-api#person-information>

=head1 COPYRIGHT & LICENSE

Copyright (c) 2020-2020 DEGUEST Pte. Ltd.

You can use, copy, modify and redistribute this package and associated
files under the same terms as Perl itself.

=cut
