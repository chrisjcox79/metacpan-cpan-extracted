package OpusVL::AppKit::Schema::AppKitAuthDB::Result::RoleAllowed;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("roles_allowed");


__PACKAGE__->add_columns(
  "role",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "role_allowed",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("role", "role_allowed");


__PACKAGE__->belongs_to(
  "role_allowed",
  "OpusVL::AppKit::Schema::AppKitAuthDB::Result::Role",
  { id => "role_allowed" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->belongs_to(
  "role",
  "OpusVL::AppKit::Schema::AppKitAuthDB::Result::Role",
  { id => "role" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-10 11:58:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Fm3ouMScUWfvv8UV1adWXA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

OpusVL::AppKit::Schema::AppKitAuthDB::Result::RoleAllowed

=head1 VERSION

version 6

=head1 NAME

OpusVL::AppKit::Schema::AppKitAuthDB::Result::RoleAllowed

=head1 ACCESSORS

=head2 role

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 role_allowed

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 role_allowed

Type: belongs_to

Related object: L<OpusVL::AppKit::Schema::AppKitAuthDB::Result::Role>

=head2 role

Type: belongs_to

Related object: L<OpusVL::AppKit::Schema::AppKitAuthDB::Result::Role>

=head1 AUTHOR

Colin Newell <colin@opusvl.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2016 by OpusVL.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
