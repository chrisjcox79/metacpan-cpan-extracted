use utf8;
package Biblio::Zotero::DB::Schema::Result::CreatorData;
$Biblio::Zotero::DB::Schema::Result::CreatorData::VERSION = '0.004';
# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE


use strict;
use warnings;

use base 'DBIx::Class::Core';


__PACKAGE__->table("creatorData");


__PACKAGE__->add_columns(
  "creatordataid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "firstname",
  { data_type => "text", is_nullable => 1 },
  "lastname",
  { data_type => "text", is_nullable => 1 },
  "shortname",
  { data_type => "text", is_nullable => 1 },
  "fieldmode",
  { data_type => "int", is_nullable => 1 },
  "birthyear",
  { data_type => "int", is_nullable => 1 },
);


__PACKAGE__->set_primary_key("creatordataid");


__PACKAGE__->has_many(
  "creators",
  "Biblio::Zotero::DB::Schema::Result::Creator",
  { "foreign.creatordataid" => "self.creatordataid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:77GVwSEM4nxAXvVUWPJvDA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Biblio::Zotero::DB::Schema::Result::CreatorData

=head1 VERSION

version 0.004

=head1 NAME

Biblio::Zotero::DB::Schema::Result::CreatorData

=head1 TABLE: C<creatorData>

=head1 ACCESSORS

=head2 creatordataid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 firstname

  data_type: 'text'
  is_nullable: 1

=head2 lastname

  data_type: 'text'
  is_nullable: 1

=head2 shortname

  data_type: 'text'
  is_nullable: 1

=head2 fieldmode

  data_type: 'int'
  is_nullable: 1

=head2 birthyear

  data_type: 'int'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</creatordataid>

=back

=head1 RELATIONS

=head2 creators

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::Creator>

=head1 AUTHOR

Zakariyya Mughal <zmughal@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Zakariyya Mughal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
