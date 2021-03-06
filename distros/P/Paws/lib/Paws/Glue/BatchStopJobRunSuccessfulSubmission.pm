package Paws::Glue::BatchStopJobRunSuccessfulSubmission;
  use Moose;
  has JobName => (is => 'ro', isa => 'Str');
  has JobRunId => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Glue::BatchStopJobRunSuccessfulSubmission

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::Glue::BatchStopJobRunSuccessfulSubmission object:

  $service_obj->Method(Att1 => { JobName => $value, ..., JobRunId => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::Glue::BatchStopJobRunSuccessfulSubmission object:

  $result = $service_obj->Method(...);
  $result->Att1->JobName

=head1 DESCRIPTION

Records a successful request to stop a specified C<JobRun>.

=head1 ATTRIBUTES


=head2 JobName => Str

  The name of the job definition used in the job run that was stopped.


=head2 JobRunId => Str

  The C<JobRunId> of the job run that was stopped.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::Glue>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

