# Note: this file was auto-generated by Module::Build::Compat version 0.03
use ExtUtils::MakeMaker;
WriteMakefile
(
          'NAME' => 'Net::DMAP::Server',
          'VERSION_FROM' => 'lib/Net/DMAP/Server.pm',
          'PREREQ_PM' => {
                           'Net::DAAP::DMAP' => '1.21',
                           'Net::Rendezvous::Publish' => '0',
                           'POE::Component::Server::HTTP' => '0.05',
                           'Test::More' => '0'
                         },
          'INSTALLDIRS' => 'site',
          'PL_FILES' => {}
        )
;
