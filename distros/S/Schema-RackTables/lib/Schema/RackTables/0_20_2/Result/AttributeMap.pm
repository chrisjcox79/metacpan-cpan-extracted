use utf8;
package Schema::RackTables::0_20_2::Result::AttributeMap;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::RackTables::0_20_2::Result::AttributeMap

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<AttributeMap>

=cut

__PACKAGE__->table("AttributeMap");

=head1 ACCESSORS

=head2 objtype_id

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 attr_id

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 chapter_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "objtype_id",
  {
    data_type => "integer",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "attr_id",
  {
    data_type => "integer",
    default_value => 1,
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "chapter_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<objtype_id>

=over 4

=item * L</objtype_id>

=item * L</attr_id>

=back

=cut

__PACKAGE__->add_unique_constraint("objtype_id", ["objtype_id", "attr_id"]);

=head1 RELATIONS

=head2 attr

Type: belongs_to

Related object: L<Schema::RackTables::0_20_2::Result::Attribute>

=cut

__PACKAGE__->belongs_to(
  "attr",
  "Schema::RackTables::0_20_2::Result::Attribute",
  { id => "attr_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 attribute_values

Type: has_many

Related object: L<Schema::RackTables::0_20_2::Result::AttributeValue>

=cut

__PACKAGE__->has_many(
  "attribute_values",
  "Schema::RackTables::0_20_2::Result::AttributeValue",
  {
    "foreign.attr_id"    => "self.attr_id",
    "foreign.object_tid" => "self.objtype_id",
  },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 chapter

Type: belongs_to

Related object: L<Schema::RackTables::0_20_2::Result::Chapter>

=cut

__PACKAGE__->belongs_to(
  "chapter",
  "Schema::RackTables::0_20_2::Result::Chapter",
  { id => "chapter_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-10-22 23:01:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QmdsJRRTZ4dv3EinEqCUGw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
