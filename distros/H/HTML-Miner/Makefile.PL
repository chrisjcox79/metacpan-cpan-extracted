use 5.006                   ;
use strict                  ;
use warnings FATAL => 'all' ;
use ExtUtils::MakeMaker     ;

WriteMakefile(
    NAME                => 'HTML::Miner',
    AUTHOR              => 'Harish T Madabushi <harish.tmh@gmail.com>',
    VERSION_FROM        => 'lib/HTML/Miner.pm',
    ABSTRACT_FROM       => 'lib/HTML/Miner.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Net-XMPP-Client-GTalk-*' },
);
