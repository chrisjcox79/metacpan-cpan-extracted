package GappX::Dialogs::Meta::Widget::Trait::QuestionDialog;
{
  $GappX::Dialogs::Meta::Widget::Trait::QuestionDialog::VERSION = '0.005';
}

use Moose::Role;
use MooseX::SemiAffordanceAccessor;

with 'GappX::Dialogs::Meta::Widget::Trait::MessageDialog';

around BUILDARGS => sub {
    my ( $orig, $class, %opts ) = @_;
    $opts{buttons} ||= [ qw(gtk-no no gtk-yes yes) ];
    $opts{icon} ||= 'gtk-dialog-question';
    $opts{image} ||= Gapp::Image->new(
        stock => [ 'gtk-dialog-question', 'dialog' ],
        fill => 0,
        expand => 0,
    );
    return $class->$orig( %opts );
};

package Gapp::Meta::Widget::Custom::Trait::QuestionDialog;
{
  $Gapp::Meta::Widget::Custom::Trait::QuestionDialog::VERSION = '0.005';
}
sub register_implementation { 'GappX::Dialogs::Meta::Widget::Trait::QuestionDialog' };


1;



__END__

=pod

=head1 NAME

GappX::Dialogs::Meta::Widget::Trait::QuestionDialog - QuestionDialog widget trait

=head1 SYNOPSIS

  use Gapp;

  use GappX::Dialogs;

  $dlg = Gapp::Dialog->new(

    traits => [qw( QuestionDialog )],

    text => 'Primary Text',

    secondary => 'Secondary Text',

  );

  $dlg->run;
     
=head1 DESCRIPTION

Trait for a dialog with a C<gtk-dialog-question> image and C<gtk-yes> and C<gtk-no> buttons.

=head1 AUTHORS

Jeffrey Ray Hallock E<lt>jeffrey.hallock at gmail dot comE<gt>

=head1 COPYRIGHT & LICENSE

Copyright (c) 2012 Jeffrey Ray Hallock.
    
This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut