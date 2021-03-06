
package App::Guiio::stripes::editable_box2 ;

use base App::Guiio::stripes::single_stripe ;

use strict;
use warnings;

use List::Util qw(min max) ;
use Readonly ;
use Clone ;

#-----------------------------------------------------------------------------

Readonly my $DEFAULT_BOX_TYPE => 
	[
	[1, 'top', '.', '-', '.', 1, ],
	[0, 'title separator', '|', '-', '|', 1, ],
	[1, 'body separator', '| ', '|', ' |', 1, ], 
	[1, 'bottom', '\'', '-', '\'', 1, ],
	]  ;

sub new
{
my ($class, $element_definition) = @_ ;

my $self = bless  {}, __PACKAGE__ ;
	
$self->setup
	(
	$element_definition->{TEXT_ONLY},
	$element_definition->{TITLE},
	$element_definition->{BOX_TYPE} || Clone::clone($DEFAULT_BOX_TYPE),
	1, 1,
	$element_definition->{RESIZABLE},
	$element_definition->{EDITABLE},
	$element_definition->{AUTO_SHRINK},
	) ;

return $self ;
}

#-----------------------------------------------------------------------------

sub setup
{
my ($self, $text_only, $title_text, $box_type, $end_x, $end_y, $resizable, $editable, $auto_shrink) = @_ ;

my ($text_width,  @lines) = (0) ;

for my $line (split("\n", $text_only))
	{
	$text_width  = max($text_width, length($line)) ;
	push @lines, $line ;
	}
	
my ($title_width,  @title_lines) = (0) ;

$title_text = '' unless defined $title_text ;

for my $title_line (split("\n", $title_text))
	{
	$title_width  = max($title_width, length($title_line)) ;
	push @title_lines, $title_line ;
	}

my ($extra_width, $extra_height) = get_box_frame_size_overhead($box_type) ;

my $display_title = (defined $title_text and $title_text ne '') ? 1 : 0 ;
$text_width  = max($text_width, $title_width)  if $display_title;

#if($auto_shrink)
#	{
#	($end_x, $end_y) = (-5, -5) ;
#	}

$end_x = max($end_x, $text_width + $extra_width, $title_width + $extra_width) ;
$end_y = max($end_y, scalar(@lines) + $extra_height + scalar(@title_lines)) ;

my ($box_top, $box_left, $box_right, $box_bottom, $title_separator, $title_left, $title_right) = get_box_frame_elements($box_type, $end_x) ;

my $text = $box_top ;

for my $title_line (@title_lines)
	{
	my $pading =  ($end_x - (length($title_left . $title_line . $title_right))) ;
	my $left_pading =  int($pading / 2) ;
	my $right_pading = $pading - $left_pading ;
	
	$text .= $title_left . (' ' x $left_pading) . $title_line . (' ' x $right_pading) . $title_right ."\n" ;
	}

$text .= $title_separator ;

for my $line (@lines)
	{
	$text .= $box_left . $line . (' ' x ($end_x - (length($line) + $extra_width))) . $box_right . "\n" ;
	}
	
for (1 .. ($end_y - (@lines + $extra_height + @title_lines)))
	{
	$text .= $box_left .  (' ' x ($end_x - $extra_width)) . $box_right . "\n" ;
	}

$text .= $box_bottom ;

$self->set
	(
	TEXT => $text,
	TITLE => $title_text,
	WIDTH => $end_x,
	HEIGHT => $end_y,
	TEXT_ONLY => $text_only,
	BOX_TYPE => $box_type,
	RESIZABLE => $resizable,
	EDITABLE => $editable,
	) ;
}

#-----------------------------------------------------------------------------

use Readonly ;

Readonly my  $TOP => 0 ;
Readonly my  $TITLE_SEPARATOR => 1 ;
Readonly my  $BODY_SEPARATOR => 2 ;
Readonly my  $BOTTOM => 3;

Readonly my  $DISPLAY => 0 ;
Readonly my  $NAME => 1 ;
Readonly my  $LEFT => 2 ;
Readonly my  $BODY => 3 ;
Readonly my  $RIGHT => 4 ;

sub get_box_frame_size_overhead
{
my ($box_type) = @_ ;

my @displayed_elements = grep { $_->[$DISPLAY] } @{$box_type} ;
my $extra_width = max(0, map {length} map {$_->[$LEFT]}@displayed_elements)
				+ max(0, map {length} map {$_->[$RIGHT]}@displayed_elements) ;
				
my $extra_height = 0 ;

for ($TOP, $TITLE_SEPARATOR, $BOTTOM)
	{
	$extra_height++ if defined $box_type->[$_][$DISPLAY] && $box_type->[$_][$DISPLAY] ;
	}

return($extra_width, $extra_height) ;
}

sub get_box_frame_elements
{
my ($box_type, $width) = @_ ;

my ($box_top, $box_left, $box_right, $box_bottom, $title_separator, $title_left, $title_right) = map {''} (1 .. 7) ;

if($box_type->[$TOP][$DISPLAY])
	{
	my $box_left_and_right_length = length($box_type->[$TOP][$LEFT]) + length($box_type->[$TOP][$RIGHT]) ;
	$box_top = $box_type->[$TOP][$LEFT] 
			. ($box_type->[$TOP][$BODY] x ($width - $box_left_and_right_length))   
			. $box_type->[$TOP][$RIGHT] 
			. "\n" ;
	}
	
$title_left = $box_type->[$TITLE_SEPARATOR][$LEFT] if($box_type->[$BODY_SEPARATOR][$DISPLAY]) ;
$title_right = $box_type->[$TITLE_SEPARATOR][$RIGHT] if($box_type->[$BODY_SEPARATOR][$DISPLAY]) ;

if($box_type->[$TITLE_SEPARATOR][$DISPLAY])
	{
	my $title_left_and_right_length = length($title_left) + length($title_right) ;
	
	my $title_separator_body = $box_type->[$TITLE_SEPARATOR][$BODY] ;
	$title_separator_body = ' ' unless defined $title_separator_body ;
	$title_separator_body = ' ' if $title_separator_body eq '' ;
	
	$title_separator = $title_left
			. ($title_separator_body x ($width - $title_left_and_right_length))   
			. $title_right 
			. "\n" ;
	}
	
$box_left = $box_type->[$BODY_SEPARATOR][$LEFT] if($box_type->[$BODY_SEPARATOR][$DISPLAY]) ;
$box_right = $box_type->[$BODY_SEPARATOR][$RIGHT] if($box_type->[$BODY_SEPARATOR][$DISPLAY]) ;

if($box_type->[$BOTTOM][$DISPLAY])
	{
	my $box_left_and_right_length = length($box_type->[$BOTTOM][$LEFT]) + length($box_type->[$BOTTOM][$RIGHT]) ;
	$box_bottom = $box_type->[$BOTTOM][$LEFT] 
			. ($box_type->[$BOTTOM][$BODY] x ($width - $box_left_and_right_length))   
			. $box_type->[$BOTTOM][$RIGHT] ;
	}

return ($box_top, $box_left, $box_right, $box_bottom, $title_separator, $title_left, $title_right) ;
}

#-----------------------------------------------------------------------------

sub get_selection_action
{
my ($self, $x, $y) = @_ ;

if	(
	($x == $self->{WIDTH} - 1 && $y == $self->{HEIGHT} - 1)
	)
	{
	'resize' ;
	}
else
	{
	'move' ;
	}
}

#-----------------------------------------------------------------------------

sub match_connector
{
my ($self, $x, $y) = @_ ;

my $middle_width = int($self->{WIDTH} / 2) ;
my $middle_height = int($self->{HEIGHT} / 2) ;

if($x == $middle_width && $y == -1)
	{
	return {X =>  $x, Y => $y, NAME => 'top_center'} ;
	}
elsif($x == $middle_width && $y == $self->{HEIGHT})
	{
	return {X =>  $x, Y => $y, NAME => 'bottom_center'} ;
	}
if($x == -1 && $y == $middle_height)
	{
	return {X =>  $x, Y => $y, NAME => 'left_center'} ;
	}
elsif($x == $self->{WIDTH} && $y == $middle_height)
	{
	return {X =>  $x, Y => $y, NAME => 'right_center'} ;
	}
elsif($x >= 0 && $x < $self->{WIDTH} && $y >= 0 && $y < $self->{HEIGHT})
	{
	return {X =>  $middle_width, Y => -1, NAME => 'to_be_optimized'} ;
	}
elsif($self->{ALLOW_BORDER_CONNECTION} && $x >= -1 && $x <= $self->{WIDTH} && $y >= -1 && $y <= $self->{HEIGHT})
	{
	return {X =>  $x, Y => $y, NAME => 'border'} ;
	}
else
	{
	return ;
	}
}

#-----------------------------------------------------------------------------

sub get_connection_points
{
my ($self) = @_ ;
my $middle_width = int($self->{WIDTH} / 2)  ;
my $middle_height = int($self->{HEIGHT} / 2) ;

return
	(
	{X =>  $middle_width, Y => -1, NAME => 'top_center'},
	{X =>  $middle_width, Y => $self->{HEIGHT}, NAME => 'bottom_center'},
	{X =>  -1, Y => $middle_height, NAME => 'left_center'},
	{X =>  $self->{WIDTH}, Y => $middle_height, NAME => 'right_center'},
	) ;
}

#-----------------------------------------------------------------------------

sub get_extra_points
{
my ($self) = @_ ;

if($self->{RESIZABLE} && ! $self->is_auto_shrink())
	{
	return {X =>  $self->{WIDTH} - 1, Y => $self->{HEIGHT} - 1, NAME => 'resize'} ;
	}
else
	{
	return ;
	}
}

#-----------------------------------------------------------------------------

sub get_named_connection
{
my ($self, $name) = @_ ;
my $middle_width = int($self->{WIDTH} / 2)  ;
my $middle_height = int($self->{HEIGHT} / 2) ;

if($name eq 'top_center')
	{
	return( {X =>  $middle_width, Y => -1, NAME => 'top_center'} ) ;
	}
elsif($name eq 'bottom_center')
	{
	return( {X =>  $middle_width, Y => $self->{HEIGHT}, NAME => 'bottom_center'} ) ;
	}
elsif($name eq 'left_center')
	{
	return {X =>  -1, Y => $middle_height, NAME => 'left_center'},
	}
elsif($name eq 'right_center')
	{
	return {X =>  $self->{WIDTH}, Y => $middle_height, NAME => 'right_center'},
	}
else
	{
	return ;
	}
}

#-----------------------------------------------------------------------------

sub allow_border_connection
{
my($self, $allow) = @_ ;

$self->{ALLOW_BORDER_CONNECTION} = $allow ;
}

#-----------------------------------------------------------------------------

sub is_border_connection_allowed
{
my($self) = @_ ;
return $self->{ALLOW_BORDER_CONNECTION} ;
}

#-----------------------------------------------------------------------------

sub flip_auto_shrink
{
my($self) = @_ ;
$self->{AUTO_SHRINK} ^= 1 ;
}

#-----------------------------------------------------------------------------

sub is_auto_shrink
{
my($self) = @_ ;
return $self->{AUTO_SHRINK} ;
}

#-----------------------------------------------------------------------------

sub resize
{
my ($self, $reference_x, $reference_y, $new_x, $new_y) = @_ ;

return(0, 0, $self->{WIDTH}, $self->{HEIGHT})  unless $self->{RESIZABLE} ;

my $new_end_x = $new_x ;
my $new_end_y = $new_y ;

if($new_end_x >= 0 &&  $new_end_y >= 0)
	{
	$self->setup
		(
		$self->{TEXT_ONLY},
		$self->{TITLE},
		$self->{BOX_TYPE},
		$new_end_x + 1,
		index($self->{NAME},'Combobox')>=0 ? $self->{HEIGHT} : $new_end_y + 1,
		$self->{RESIZABLE},
		$self->{EDITABLE},
		$self->{AUTO_SHRINK},
		) ;
	}
	
return(0, 0, $self->{WIDTH}, $self->{HEIGHT}) ;
}

#-----------------------------------------------------------------------------

sub get_text
{
my ($self) = @_ ;
return($self->{TITLE}, $self->{TEXT_ONLY})  ;
}

#-----------------------------------------------------------------------------

sub set_text
{
my ($self, $title, $text) = @_ ;

my @displayed_elements = grep { $_->[$DISPLAY] } @{$self->{BOX_TYPE}} ;
#$text = 'edit_me' if($text eq '' && @displayed_elements == 0) ;

$self->setup
	(
	$text,
	$title,
	$self->{BOX_TYPE},
	$self->{WIDTH},
	$self->{HEIGHT},
	$self->{RESIZABLE},
	$self->{EDITABLE},
	$self->{AUTO_SHRINK},
	) ;
}

#-----------------------------------------------------------------------------

sub get_box_type
{
my ($self) = @_ ;
return($self->{BOX_TYPE})  ;
}

#-----------------------------------------------------------------------------

sub set_box_type
{
my ($self, $box_type) = @_ ;
$self->setup
	(
	$self->{TEXT_ONLY},
	$self->{TITLE},
	$box_type,
	$self->{WIDTH},
	$self->{HEIGHT},
	$self->{RESIZABLE},
	$self->{EDITABLE},
	$self->{AUTO_SHRINK},
	) ;
}

#-----------------------------------------------------------------------------

sub edit
{
my ($self) = @_ ;

return unless $self->{EDITABLE} ;

my $text = $self->{TEXT_ONLY} ;
$text = make_vertical_text($text)  if $self->{VERTICAL_TEXT} ;

($text, my $title) = App::Guiio::display_box_edit_dialog($self->{BOX_TYPE}, $self->{TITLE}, $text) ;

my $tab_as_space = $self->{TAB_AS_SPACES} || (' ' x 3) ;

$text =~ s/\t/$tab_as_space/g ;
$title=~ s/\t/$tab_as_space/g ;

$text = make_vertical_text($text) if $self->{VERTICAL_TEXT} ;
	
$self->set_text($title, $text) ;
}

#-----------------------------------------------------------------------------

sub rotate_text
{
my ($self) = @_ ;

my $text = make_vertical_text($self->{TEXT_ONLY})  ;
	
$self->set_text($self->{TITLE}, $text) ;
$self->shrink() ;

$self->{VERTICAL_TEXT} ^= 1 ;
}

#-----------------------------------------------------------------------------

sub shrink
{
my ($self) = @_ ;
$self->setup
	(
	$self->{TEXT_ONLY},
	$self->{TITLE},
	$self->{BOX_TYPE},
	-5,
	-5,
	$self->{RESIZABLE},
	$self->{EDITABLE},
	$self->{AUTO_SHRINK},
	) ;
}

#-----------------------------------------------------------------------------

sub make_vertical_text
{
my ($text) = @_ ;

my @lines = map{[split '', $_]} split "\n", $text ;

my $vertical = '' ;
my $found_character = 1 ;
my $index = 0 ;

while($found_character)
	{
	my $line ;
	$found_character = 0 ;
	
	for(@lines)
		{
		if(defined $_->[$index])
			{
			$line.= $_->[$index] ;
			$found_character++ ;
			}
		else
			{
			$line .= ' ' ;
			}
		}
	
	$line =~ s/\s+$//; 
	$vertical .= "$line\n" if $found_character ;
	$index++ ;
	}

return $vertical ;
}

#-----------------------------------------------------------------------------
#GUIIO Properties start here...
#-----------------------------------------------------------------------------
sub SetChecked{
my ($self,$isChecked) = @_;
my $aspectDesign = '';
my $controlName = substr($self->{NAME},(length($self->{NAME})-index(reverse($self->{NAME}),'/')));

print 'Control type '  . $controlName . ' isChecked : ' . $isChecked . "\n";
if ($controlName eq 'Checkbox')
{
	$aspectDesign = $isChecked ? '[X]' : '[ ]';
}
elsif ($controlName eq 'Radio Button')
{
	$aspectDesign = $isChecked ? '(O)' : '( )';
}
if (length($aspectDesign) >0)
{
	$self->{BOX_TYPE}[$BODY_SEPARATOR][$LEFT] = $aspectDesign;
}
$self->set_text($self->{TITLE},$self->{TEXT_ONLY});
}

1 ;
