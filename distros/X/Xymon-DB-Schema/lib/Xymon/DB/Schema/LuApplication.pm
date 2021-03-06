package Xymon::DB::Schema::LuApplication;
use base qw(DBIx::Class::Core);


  __PACKAGE__->table('LuApplication');
  __PACKAGE__->add_columns(qw/application/);
  __PACKAGE__->set_primary_key('application');
  __PACKAGE__->resultset_class( 'DBIx::Class::ResultSet::HashRef' );
  
  1;

=head1 NAME

Xymon::DB::LuApplication - LuApplication Schema


=head1 SYNOPSIS

	use Xymon::DB::Schema;
  

=head1 DESCRIPTION

see Xymon::DB::Schema


=head1 AUTHOR

    David Peters
    CPAN ID: DAVIDP
    davidp@electronf.com
    http://www.electronf.com

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

Xymon::DB::Schema, perl(1)

=cut