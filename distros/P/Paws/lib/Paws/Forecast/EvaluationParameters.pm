package Paws::Forecast::EvaluationParameters;
  use Moose;
  has BackTestWindowOffset => (is => 'ro', isa => 'Int');
  has NumberOfBacktestWindows => (is => 'ro', isa => 'Int');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Forecast::EvaluationParameters

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::Forecast::EvaluationParameters object:

  $service_obj->Method(Att1 => { BackTestWindowOffset => $value, ..., NumberOfBacktestWindows => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::Forecast::EvaluationParameters object:

  $result = $service_obj->Method(...);
  $result->Att1->BackTestWindowOffset

=head1 DESCRIPTION

Parameters that define how to split a dataset into training data and
testing data, and the number of iterations to perform. These parameters
are specified in the predefined algorithms but you can override them in
the CreatePredictor request.

=head1 ATTRIBUTES


=head2 BackTestWindowOffset => Int

  The point from the end of the dataset where you want to split the data
for model training and testing (evaluation). Specify the value as the
number of data points. The default is the value of the forecast
horizon. C<BackTestWindowOffset> can be used to mimic a past virtual
forecast start date. This value must be greater than or equal to the
forecast horizon and less than half of the TARGET_TIME_SERIES dataset
length.

C<ForecastHorizon> E<lt>= C<BackTestWindowOffset> E<lt> 1/2 *
TARGET_TIME_SERIES dataset length


=head2 NumberOfBacktestWindows => Int

  The number of times to split the input data. The default is 1. Valid
values are 1 through 5.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::Forecast>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

