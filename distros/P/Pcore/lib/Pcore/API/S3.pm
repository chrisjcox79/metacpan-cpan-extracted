package Pcore::API::S3;

use Pcore -class, -res, -const;
use Pcore::Util::Digest qw[sha256_hex hmac_sha256_bin hmac_sha256_hex];
use Pcore::Util::Scalar qw[is_ref];
use Pcore::Util::Data qw[to_uri_query from_xml];
use Pcore::Util::Term::Progress;
use IO::Compress::Gzip qw[gzip];

has key         => ();
has secret      => ();
has bucket      => ();
has region      => ();
has service     => 's3';
has endpoint    => 'digitaloceanspaces.com';
has compress    => 2;                          # 1 - yes, 2 - auto
has max_threads => 10;
has max_retries => 3;

has _semaphore => sub ($self) { Coro::Semaphore->new( $self->{max_threads} ) }, is => 'lazy';

const our $S3_ACL_READ_ONLY    => 0;
const our $S3_ACL_FULL_CONTROL => 1;

#  NOTE https://developers.digitalocean.com/documentation/spaces/

sub _req ( $self, $args ) {

    # block thread
    my $guard = $self->{max_threads} && $self->_semaphore->guard;

    no warnings qw[uninitialized];

    $args->{path} = "/$args->{path}" if substr( $args->{path}, 0, 1 ) ne '/';

    my $uri = P->uri( sprintf "https://%s%s.$self->{endpoint}%s?%s", $args->{bucket} ? "$args->{bucket}." : $EMPTY, $args->{region} || $self->{region}, $args->{path}, defined $args->{query} ? to_uri_query $args->{query} : $EMPTY );

    my $date          = P->date->now_utc;
    my $date_ymd      = $date->strftime('%Y%m%d');
    my $date_iso08601 = $date->strftime('%Y%m%dT%H%M%SZ');
    my $data_hash     = sha256_hex( $args->{data} ? $args->{data}->$* : $EMPTY );

    $args->{headers}->{'Host'}                 = $uri->{host};
    $args->{headers}->{'X-Amz-Date'}           = $date_iso08601;
    $args->{headers}->{'X-Amz-Content-Sha256'} = $data_hash if $data_hash;

    my $canon_req = "$args->{method}\n" . $uri->{path}->to_uri . "\n$uri->{query}\n";

    my @signed_headers;

    for my $header ( sort keys $args->{headers}->%* ) {
        push @signed_headers, lc $header;

        $canon_req .= lc($header) . ":$args->{headers}->{$header}\n";
    }

    my $signed_headers = join ';', @signed_headers;

    $canon_req .= "\n$signed_headers\n$data_hash";

    my $credential_scope = "$date_ymd/$args->{region}/$self->{service}/aws4_request";
    my $string_to_sign   = "AWS4-HMAC-SHA256\n$date_iso08601\n$credential_scope\n" . sha256_hex $canon_req;

    my $k_date    = hmac_sha256_bin $date_ymd, "AWS4$self->{secret}";
    my $k_region  = hmac_sha256_bin $args->{region}, $k_date;
    my $k_service = hmac_sha256_bin $self->{service}, $k_region;
    my $sign_key  = hmac_sha256_bin 'aws4_request', $k_service;
    my $signature = hmac_sha256_hex $string_to_sign, $sign_key;

    # max retries number
    my $retry = $self->{max_retries};

  REDO:
    my $res = P->http->request(
        method  => $args->{method},
        url     => $uri,
        headers => [
            $args->{headers}->%*,
            Referer       => undef,
            Authorization => qq[AWS4-HMAC-SHA256 Credential=$self->{key}/$credential_scope,SignedHeaders=$signed_headers,Signature=$signature],
        ],
        data => $args->{data},
    );

    # retry on connection error or TLS error
    goto REDO if ( $res == 590 || $res == 591 ) && --$retry;

    return $res;
}

sub get_buckets ( $self, %args ) {
    my $res = $self->_req( { %args, method => 'GET' } );

    if ($res) {
        $res->{data} = from_xml $res->{data};

        my ( $data, $meta );

        for my $key ( keys $res->{data}->{ListAllMyBucketsResult}->%* ) {
            if ( $key eq 'Buckets' ) {
                for my $item ( $res->{data}->{ListAllMyBucketsResult}->{$key}->[0]->{Bucket}->@* ) {
                    $data->{ $item->{Name}->[0]->{content} } = {
                        name          => $item->{Name}->[0]->{content},
                        creation_date => $item->{CreationDate}->[0]->{content},
                    };
                }
            }
            else {
                $meta->{$key} = $res->{data}->{ListBucketResult}->{$key}->[0]->{content};
            }
        }

        $res = res 200, $data, meta => $meta;
    }

    return $res;
}

sub get_bucket_location ( $self, %args ) {
    my $res = $self->_req( {
        bucket => $self->{bucket},
        %args,
        method => 'GET',
        query  => 'location=',
    } );

    if ($res) {
        $res->{data} = from_xml $res->{data};

        $res = res 200, $res->{data}->{LocationConstraint}->{content};
    }

    return $res;
}

# - max: default 1000, 1000 is maximum allowed value;
# - prefix: NOTE: must be relative. A string used to group keys. When specified, the response will only contain objects with keys beginning with the string;
# - delim: A single character used to group keys. When specified, the response will only contain keys up to its first occurrence. (E.g. Using a slash as the delimiter can allow you to list keys as if they were folders, especially in combination with a prefix.);
sub get_bucket_content ( $self, %args ) {
    my $args = {
        bucket => $args{bucket} || $self->{bucket},
        region => $args{region} || $self->{region},
        method => 'GET',
        path   => '/',
        query  => [
            delimiter  => $args{delim}  // $EMPTY,
            marker     => $args{marker} // $EMPTY,
            'max-keys' => $args{max}    // $EMPTY,
            prefix     => $args{prefix} // $EMPTY,
        ],
    };

    my $res = $self->_req($args);

    if ( $res && $res->{data} ) {
        $res->{data} = from_xml $res->{data};

        my ( $data, $meta );

        for my $key ( keys $res->{data}->{ListBucketResult}->%* ) {
            if ( $key eq 'Contents' ) {
                for my $item ( $res->{data}->{ListBucketResult}->{$key}->@* ) {
                    $data->{ '/' . $item->{Key}->[0]->{content} } = {
                        path          => '/' . $item->{Key}->[0]->{content},
                        etag          => $item->{ETag}->[0]->{content} =~ s/"//smgr,
                        last_modified => $item->{LastModified}->[0]->{content},
                        size          => $item->{Size}->[0]->{content},
                    };
                }
            }
            else {
                $meta->{$key} = $res->{data}->{ListBucketResult}->{$key}->[0]->{content};
            }
        }

        $res = res 200, $data, meta => $meta;
    }

    return $res;
}

sub get_all_bucket_content ( $self, %args ) {
    $args{max} = 1000;

    my $result = res 200;

  GET:
    my $res = $self->get_bucket_content(%args);

    if ($res) {
        $result->{data}->@{ keys $res->{data}->%* } = values $res->{data}->%*;

        if ( $res->{meta}->{IsTruncated} eq 'true' ) {
            $args{marker} = $res->{meta}->{NextMarker};

            goto GET;
        }
    }
    else {
        $result = $res;
    }

    return $result;
}

# TODO \$data - content, $data - path
sub upload ( $self, $path, $data, %args ) {
    my $args = {
        bucket        => $self->{bucket},
        private       => 0,
        content_type  => undef,
        cache_control => undef,
        compress      => $self->{compress},
        etag          => undef,
        %args,
        method => 'PUT',
        path   => $path,
    };

    my $buf;

    $path = P->path($path);

    $args->{content_type} //= $path->mime_type;

    $args->{compress} = 0 if $args->{compress} && $args->{compress} == 2 && !$path->mime_has_tag('compress');

    if ( $args->{compress} ) {
        gzip is_ref $data ? $data : \$data, \my $buf1, time => 0, level => 9 or die q[Failed to gzip data];

        $buf = \$buf1;
    }
    else {
        $buf = is_ref $data ? $data : \$data;
    }

    if ( defined $args->{etag} && $args->{etag} eq P->digest->md5_hex( $buf->$* ) ) {
        return res 304;
    }

    $args->{data} = $buf;

    $args->{headers} = {
        'Content-Length' => length $buf->$*,
        'X-Amz-Acl'      => $args->{private} ? 'private' : 'public-read',
        $args->{content_type}  ? ( 'Content-Type'     => $args->{content_type} )  : (),
        $args->{cache_control} ? ( 'Cache-Control'    => $args->{cache_control} ) : (),
        $args->{compress}      ? ( 'Content-Encoding' => 'gzip' )                 : (),
    };

    return $self->_req($args);
}

sub get_object ( $self, $path, %args ) {
    my $args = {
        bucket => $self->{bucket},
        %args,
        method => 'GET',
        path   => $path,
    };

    return $self->_req($args);
}

sub get_metadata ( $self, $path, %args ) {
    my $args = {
        bucket => $self->{bucket},
        %args,
        method => 'HEAD',
        path   => $path,
    };

    my $res = $self->_req($args);

    if ($res) {
        $res->{headers}->{etag} =~ s/"//smg;

        $res = res 200, $res->{headers};
    }

    return $res;
}

sub remove ( $self, $path, %args ) {
    my $args = {
        bucket => $self->{bucket},
        %args,
        method => 'DELETE',
        path   => $path,
    };

    return $self->_req($args);
}

sub get_acl ( $self, $path, %args ) {
    my $args = {
        bucket => $self->{bucket},
        %args,
        method => 'GET',
        query  => 'acl=',
        path   => $path,
    };

    my $res = $self->_req($args);

    if ($res) {
        $res->{data} = from_xml $res->{data};

        my $data;

        for my $grant ( $res->{data}->{AccessControlPolicy}->{AccessControlList}->[0]->{Grant}->@* ) {
            if ( $grant->{Grantee}->[0]->{URI} ) {
                $data->{'*'} = $grant->{Permission}->[0]->{content} eq 'READ' ? $S3_ACL_READ_ONLY : $S3_ACL_FULL_CONTROL;
            }
            else {
                $data->{ $grant->{Grantee}->[0]->{ID}->[0]->{content} } = $grant->{Permission}->[0]->{content} eq 'READ' ? $S3_ACL_READ_ONLY : $S3_ACL_FULL_CONTROL;
            }
        }

        $res = res 200, $data;
    }

    return $res;
}

# TODO fucking stupid API, created by stupid idiots
sub set_public_access ( $self, $path, $enabled, %args ) {
    my $data = <<"XML";
<AccessControlPolicy xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <AccessControlList>
        <Grant>
            <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Group">
                <URI>http://acs.amazonaws.com/groups/global/AllUsers</URI>
            </Grantee>
            <Permission>READ</Permission>
        </Grant>
    </AccessControlList>
</AccessControlPolicy>
XML

    my $args = {
        bucket => $self->{bucket},
        %args,
        method  => 'PUT',
        query   => 'acl=',
        path    => $path,
        headers => { 'Content-Length' => length $data },
        data    => \$data,
    };

    return $self->_req($args);
}

sub sync ( $self, $locations, $tree ) {
    my $remote_files;

    # get remote files
    {
        my $cv = P->cv->begin;

        for my $location ( $locations->@* ) {
            $cv->begin;

            # remove leading "/"
            substr $location, 0, 1, $EMPTY if substr $location, 0, 1 eq '/';

            # add trailing "/"
            $location .= '/' if substr $location, -1, 1 ne '/';

            $self->get_all_bucket_content(
                prefix => $location,
                sub ($res) {
                    $remote_files->@{ keys $res->{data}->%* } = values $res->{data}->%*;

                    $cv->end;

                    return;
                }
            );
        }

        $cv->end->recv;
    }

    my ( $error, $stat );

    # upload
    if ( $tree->{files}->%* ) {
        my $cv = P->cv->begin;

        say 'Uploading files ...';

        my $progress = Pcore::Util::Term::Progress::get_indicator( network => 0, total => scalar $tree->{files}->%*, value => 0 );

        for my $file ( values $tree->{files}->%* ) {
            $cv->begin;

            # upload file
            $self->upload(
                $file->{path},
                $file->content,
                cache_control => $file->{meta}->{'Cache-Control'},
                etag          => exists $remote_files->{ $file->{path} } ? $remote_files->{ $file->{path} }->{etag} : undef,
                sub ($res) {
                    $error++ if !$res && $res != 304;

                    $stat->{$res}++;

                    $cv->end;

                    $progress->update( value => $progress->{value} + 1 );

                    return;
                }
            );
        }

        $cv->end->recv;
    }

    # remove
    if ( my @to_remove = grep { !exists $tree->{files}->{$_} } keys $remote_files->%* ) {
        say 'Removing files ...';

        my $progress = Pcore::Util::Term::Progress::get_indicator( network => 0, total => scalar @to_remove, value => 0 );

        my $cv = P->cv->begin;

        for my $path (@to_remove) {
            $cv->begin;

            $self->remove(
                $path,
                sub ($res) {
                    $cv->end;

                    $error++ if !$res;

                    $stat->{$res}++;

                    $progress->update( value => $progress->{value} + 1 );

                    return;
                }
            );
        }

        $cv->end->recv;
    }

    return res $error ? 500 : 200, $stat;
}

1;
## -----SOURCE FILTER LOG BEGIN-----
##
## PerlCritic profile "pcore-script" policy violations:
## +------+----------------------+----------------------------------------------------------------------------------------------------------------+
## | Sev. | Lines                | Policy                                                                                                         |
## |======+======================+================================================================================================================|
## |    3 | 365, 368             | ValuesAndExpressions::ProhibitMismatchedOperators - Mismatched operator                                        |
## +------+----------------------+----------------------------------------------------------------------------------------------------------------+
##
## -----SOURCE FILTER LOG END-----
__END__
=pod

=encoding utf8

=head1 NAME

Pcore::API::S3

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 ATTRIBUTES

=head1 METHODS

=head1 SEE ALSO

=cut
