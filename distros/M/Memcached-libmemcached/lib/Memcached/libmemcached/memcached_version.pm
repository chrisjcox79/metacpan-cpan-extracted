package Memcached::libmemcached::memcached_version;

=head1 NAME

memcached_lib_version, memcached_version - Get library version

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  const char *
    memcached_lib_version (void) 


  memcached_return_t
    memcached_version (memcached_st *ptr)


=head1 DESCRIPTION

memcached_lib_version() is used to return a simple version string representing
the libmemcached version (version of the client library, not server)


memcached_version() is used to set the major, minor, and micro versions of each
memcached server being used by the memcached_st connection structure. It returns the 
memcached server return code. 

=head1 RETURN

A string with the version of libmemcached driver is returned from
memcached_lib_version()

A value of type C<memcached_return_t> is returned from memcached_version()
On success that value will be C<MEMCACHED_SUCCESS>. If called with the
C<MEMCACHED_BEHAVIOR_USE_UDP> behavior set, the value C<MEMCACHED_NOT_SUPPORTED> 
will be returned. Use memcached_strerror() to translate this value to 
a printable string.

=head1 HOME

To find out more information please check:
L<https://launchpad.net/libmemcached>

=head1 AUTHOR

Brian Aker, E<lt>brian@tangent.orgE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3) memcached_strerror(3)

=cut

1;
