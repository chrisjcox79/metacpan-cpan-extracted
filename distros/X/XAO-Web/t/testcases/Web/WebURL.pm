package testcases::Web::WebURL;
use strict;
use XAO::Utils;
use XAO::Web;
use Data::Dumper;

use base qw(XAO::testcases::Web::base);

###############################################################################

sub test_all {
    my $self=shift;

    my %testenv=(
        DOCUMENT_ROOT       => '/tmp',
        GATEWAY_INTERFACE   => 'CGI/1.1',
        HTTP_HOST           => 'www.xao.com',
        HTTP_USER_AGENT     => 'Mozilla/5.0',
        PATH_INFO           => '/test/WebURL.html',
        QUERY_STRING        => 'a=1&b=2',
        REMOTE_ADDR         => '127.0.0.1',
        REMOTE_PORT         => '12345',
        REQUEST_METHOD      => 'GET',
        REQUEST_URI         => '/WebURL.html?a=1&b=2',
        SCRIPT_FILENAME     => '/usr/local/xa,/handlers/xao-apache.pl',
        SCRIPT_NAME         => '',
        SCRIPT_URI          => 'http://www.xao.com/WebURL.html',
        SCRIPT_URL          => '/WebURL.html',
        SERVER_ADDR         => '127.0.0.1',
        SERVER_ADMIN        => 'am@xao.com',
        SERVER_NAME         => 'xao.com',
        SERVER_PORT         => '80',
        SERVER_PROTOCOL     => 'HTTP/1.1',
        SERVER_SOFTWARE     => 'Apache/1.3.26 (Unix)',
    );

    my %matrix=(
        #
        # This is counterintuitive, but historically accurate.
        # The reason <%URL%> expands into a variable is because we used to
        # have ONLY <%%> brackets for everything and we need to be compatible
        # with that. If we try to expand objects first for all <%%> it will
        # be inefficient and not exactly compatible.
        #
        zz => {
            template => q(<%SetArg name='URL' value='URLVAR'%>[<%URL%>] [<$URL$>]),
            ### result => '[http://www.xao.com/WebURL.html] [URLVAR]',
            result => '[URLVAR] [URLVAR]',
        },
        #
        # HTTP environment
        #
        t1 => {
            template => '<%URL%>',
            result => 'http://xao.com/WebURL.html',
        },
        t2 => {
            template => '<%URL active%>',
            result => 'http://www.xao.com/WebURL.html',
        },
        t3 => {
            template => '<%URL active top%>',
            result => 'http://www.xao.com',
        },
        t4 => {
            template => '<%URL active full%>',
            result => 'http://www.xao.com/WebURL.html',
        },
        t5 => {
            template => '<%URL active secure%>',
            result => 'https://www.xao.com/WebURL.html',
        },
        t6 => {
            template => '<%URL active top secure%>',
            result => 'https://www.xao.com',
        },
        t7 => {
            template => '<%URL active full secure%>',
            result => 'https://www.xao.com/WebURL.html',
        },
        t9 => {
            template => '<%URL base%>',
            result => 'http://xao.com/WebURL.html',
        },
        t9 => {
            template => '<%URL base top%>',
            result => 'http://xao.com',
        },
        ta => {
            template => '<%URL base full%>',
            result => 'http://xao.com/WebURL.html',
        },
        tb => {
            template => '<%URL base secure%>',
            result => 'https://xao.com/WebURL.html',
        },
        tc => {
            template => '<%URL base top secure%>',
            result => 'https://xao.com',
        },
        td => {
            template => '<%URL base full secure%>',
            result => 'https://xao.com/WebURL.html',
        },
        te => {
            template => '<%URL secure%>',
            result => 'https://xao.com/WebURL.html',
        },
        tf => {
            template => '<%URL uri%>',
            result => '/WebURL.html',
        },
        tg => {
            template => '<%URL x="img"%>',
            result => 'http://img.foo.com',
        },
        th => {
            template => '<%URL x="img" secure%>',
            result => 'https://img.foo.com',
        },
        ti => {
            template => '<%URL x="stat"%>',
            result => 'http://www.foo.com',
        },
        tj => {
            template => '<%URL x="stat" secure%>',
            result => 'https://ssl.foo.com',
        },
        tk => {
            template => '<%URL x="css"%>',
            result => 'http://css.foo.com',
        },
        tl => {
            template => '<%URL x="css" secure%>',
            result => 'https://xao.com',
        },
        tm => {
            template => '<%URL x="js"%>',
            result => 'http://xao.com',
        },
        tn => {
            template => '<%URL x="js" secure%>',
            result => 'https://js.foo.com',
        },
        #
        # HTTPS environment
        #
        s1 => {
            https       => 1,
            template    => '<%URL%>',
            result      => 'https://xao.com/WebURL.html',
        },
        s2 => {
            https       => 1,
            template    => '<%URL active%>',
            result      => 'https://www.xao.com/WebURL.html',
        },
        s3 => {
            https       => 1,
            template    => '<%URL active top%>',
            result      => 'https://www.xao.com',
        },
        s4 => {
            https       => 1,
            template    => '<%URL active full%>',
            result      => 'https://www.xao.com/WebURL.html',
        },
        s5 => {
            https       => 1,
            template    => '<%URL active secure%>',
            result      => 'https://www.xao.com/WebURL.html',
        },
        s6 => {
            https       => 1,
            template    => '<%URL active top secure%>',
            result      => 'https://www.xao.com',
        },
        s7 => {
            https       => 1,
            template    => '<%URL active full secure%>',
            result      => 'https://www.xao.com/WebURL.html',
        },
        s5h => {
            https       => 1,
            template    => '<%URL active insecure%>',
            result      => 'http://www.xao.com/WebURL.html',
        },
        s6h => {
            https       => 1,
            template    => '<%URL active top insecure%>',
            result      => 'http://www.xao.com',
        },
        s7h => {
            https       => 1,
            template    => '<%URL active full insecure%>',
            result      => 'http://www.xao.com/WebURL.html',
        },
        s9 => {
            https       => 1,
            template    => '<%URL base%>',
            result      => 'https://xao.com/WebURL.html',
        },
        s9 => {
            https       => 1,
            template    => '<%URL base top%>',
            result      => 'https://xao.com',
        },
        sa => {
            https       => 1,
            template    => '<%URL base full%>',
            result      => 'https://xao.com/WebURL.html',
        },
        sb => {
            https       => 1,
            template    => '<%URL base secure%>',
            result      => 'https://xao.com/WebURL.html',
        },
        sc => {
            https       => 1,
            template    => '<%URL base top secure%>',
            result      => 'https://xao.com',
        },
        sd => {
            https       => 1,
            template    => '<%URL base full secure%>',
            result      => 'https://xao.com/WebURL.html',
        },
        se => {
            https       => 1,
            template    => '<%URL secure%>',
            result      => 'https://xao.com/WebURL.html',
        },
        sbh => {
            https       => 1,
            template    => '<%URL base insecure%>',
            result      => 'http://xao.com/WebURL.html',
        },
        sch => {
            https       => 1,
            template    => '<%URL base top insecure%>',
            result      => 'http://xao.com',
        },
        sdh => {
            https       => 1,
            template    => '<%URL base full insecure%>',
            result      => 'http://xao.com/WebURL.html',
        },
        seh => {
            https       => 1,
            template    => '<%URL insecure%>',
            result      => 'http://xao.com/WebURL.html',
        },
        sf => {
            https       => 1,
            template    => '<%URL uri%>',
            result      => '/WebURL.html',
        },
        sg => {
            https       => 1,
            template    => '<%URL x="img"%>',
            result      => 'https://img.foo.com',
        },
        sh => {
            https       => 1,
            template    => '<%URL x="img" secure%>',
            result      => 'https://img.foo.com',
        },
        shh => {
            https       => 1,
            template    => '<%URL x="img" insecure%>',
            result      => 'http://img.foo.com',
        },
        si => {
            https       => 1,
            template    => '<%URL x="stat"%>',
            result      => 'https://ssl.foo.com',
        },
        sj => {
            https       => 1,
            template    => '<%URL x="stat" secure%>',
            result      => 'https://ssl.foo.com',
        },
        sjh => {
            https       => 1,
            template    => '<%URL x="stat" insecure%>',
            result      => 'http://www.foo.com',
        },
        sk => {
            https       => 1,
            template    => '<%URL x="css"%>',
            result      => 'https://xao.com',
        },
        sl => {
            https       => 1,
            template    => '<%URL x="css" secure%>',
            result      => 'https://xao.com',
        },
        slh => {
            https       => 1,
            template    => '<%URL x="css" insecure%>',
            result      => 'http://css.foo.com',
        },
        sm => {
            https       => 1,
            template => '<%URL x="js"%>',
            result => 'https://js.foo.com',
        },
        sn => {
            https       => 1,
            template => '<%URL x="js" secure%>',
            result => 'https://js.foo.com',
        },
        snh => {
            https       => 1,
            template    => '<%URL x="js" insecure%>',
            result      => 'http://xao.com',
        },
        #
        ua1 => {
            env         => {
                PATH_INFO           => '/test/',
                QUERY_STRING        => '',
                REQUEST_URI         => '/',
                SCRIPT_URI          => 'http://xao.com/',
                SCRIPT_URL          => '/',
            },
            template    => '<%URL base full%>',
            result      => 'http://xao.com/',
        },
        ua2 => {
            env         => {
                PATH_INFO           => '/test/',
                QUERY_STRING        => '',
                REQUEST_URI         => '/',
                SCRIPT_URI          => 'https://xao.com/',
                SCRIPT_URL          => '/',
                HTTPS               => 'on',
            },
            template    => '<%URL base full%>',
            result      => 'https://xao.com/',
        },
        ua3 => {
            env         => {
                PATH_INFO           => '/test/',
                QUERY_STRING        => '?a=1&b=2',
                REQUEST_URI         => '/?a=1&b=2',
                SCRIPT_URI          => 'http://xao.com/',
                SCRIPT_URL          => '/',
            },
            template    => '<%URL secure%>',
            result      => 'https://xao.com/',
        },
        ub1 => {
            env         => {
                PATH_INFO           => '/test/index.html',
                QUERY_STRING        => '',
                REQUEST_URI         => '/index.html',
                SCRIPT_URI          => 'http://xao.com/index.html',
                SCRIPT_URL          => '/index.html',
            },
            template    => '<%URL%>',
            result      => 'http://xao.com/index.html',
        },
        ub2 => {
            env         => {
                PATH_INFO           => '/test/index.html',
                QUERY_STRING        => '?foo=bar',
                REQUEST_URI         => '/index.html?foo=bar',
                SCRIPT_URI          => 'http://xao.com/index.html',
                SCRIPT_URL          => '/index.html',
            },
            template    => '<%URL%>',
            result      => 'http://xao.com/index.html',
        },
        uc1 => {
            env         => {
                PATH_INFO           => '/test/sub/dir/',
                QUERY_STRING        => '',
                REQUEST_URI         => '/sub/dir/',
                SCRIPT_URI          => 'http://xao.com/sub/dir/',
                SCRIPT_URL          => '/sub/dir/',
            },
            template    => '<%URL full%>',
            result      => 'http://xao.com/sub/dir/',
        },
        uc2 => {
            env         => {
                PATH_INFO           => '/test/sub/dir/index.html',
                QUERY_STRING        => '',
                REQUEST_URI         => '/sub/dir/index.html',
                SCRIPT_URI          => 'http://xao.com/sub/dir/index.html',
                SCRIPT_URL          => '/sub/dir/index.html',
            },
            template    => '<%URL full%>',
            result      => 'http://xao.com/sub/dir/index.html',
        },
        uc3 => {
            env         => {
                PATH_INFO           => '/test/sub/dir/index.html',
                QUERY_STRING        => '?query',
                REQUEST_URI         => '/sub/dir/index.html?query',
                SCRIPT_URI          => 'http://xao.com/sub/dir/index.html',
                SCRIPT_URL          => '/sub/dir/index.html',
            },
            template    => '<%URL full%>',
            result      => 'http://xao.com/sub/dir/index.html',
        },
    );

    foreach my $test (sort keys %matrix) {
        my $template=$matrix{$test}->{'template'};
        my $expect=$matrix{$test}->{'result'};

        # Checking it this way is important even if it looks fragile.
        # Other modules and extensions might be calling XAO with HTTPS
        # environment expecting the default to switch to https.
        #
        my $overenv=$matrix{$test}->{'env'} || {};
        if($matrix{$test}->{'https'}) {
            $overenv->{'HTTPS'}='on';
        }

        my $newenv=merge_refs(\%testenv,$overenv);
        if(1) {
            local %ENV;
            @ENV{keys %$newenv}=values %$newenv;

            my $site=$self->web;
            $self->assert(ref($site),
                  "Can't load Web object");

            my $cgi=XAO::Objects->new(objname => 'CGI');

            my $got=$site->expand(
                cgi     => $cgi,
                path    => '/WebURL.html',
                objargs => {
                    TEMPLATE    => $template,
                },
            );

            $self->assert($got eq $expect,
                "Test $test failed - expected '$expect', got '$got'");
        }
    }
}

###############################################################################
1;
