package Kubernetes::REST::Call::v1alpha1::Settings::CreateNamespacedPodPreset;
  use Moo;
  use Types::Standard qw/Bool Defined Str/;

  
  has body => (is => 'ro', isa => Defined,required => 1);
  
  has dryRun => (is => 'ro', isa => Str);
  
  has includeUninitialized => (is => 'ro', isa => Bool);
  
  has namespace => (is => 'ro', isa => Str,required => 1);
  
  has pretty => (is => 'ro', isa => Str);
  
  sub _body_params { [
  
    { name => 'body' },
  
  ] }
  sub _url_params { [
  
    { name => 'namespace' },
  
  ] }

  sub _query_params { [
  
    { name => 'dryRun' },
  
    { name => 'includeUninitialized' },
  
    { name => 'pretty' },
  
  ] }

  sub _url { '/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets' }
  sub _method { 'POST' }
1;
