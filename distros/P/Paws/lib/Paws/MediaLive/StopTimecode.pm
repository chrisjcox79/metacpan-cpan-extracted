package Paws::MediaLive::StopTimecode;
  use Moose;
  has LastFrameClippingBehavior => (is => 'ro', isa => 'Str', request_name => 'lastFrameClippingBehavior', traits => ['NameInRequest']);
  has Timecode => (is => 'ro', isa => 'Str', request_name => 'timecode', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::MediaLive::StopTimecode

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::MediaLive::StopTimecode object:

  $service_obj->Method(Att1 => { LastFrameClippingBehavior => $value, ..., Timecode => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::MediaLive::StopTimecode object:

  $result = $service_obj->Method(...);
  $result->Att1->LastFrameClippingBehavior

=head1 DESCRIPTION

Settings to identify the end of the clip.

=head1 ATTRIBUTES


=head2 LastFrameClippingBehavior => Str

  If you specify a StopTimecode in an input (in order to clip the file),
you can specify if you want the clip to exclude (the default) or
include the frame specified by the timecode.


=head2 Timecode => Str

  The timecode for the frame where you want to stop the clip. Optional;
if not specified, the clip continues to the end of the file. Enter the
timecode as HH:MM:SS:FF or HH:MM:SS;FF.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::MediaLive>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

