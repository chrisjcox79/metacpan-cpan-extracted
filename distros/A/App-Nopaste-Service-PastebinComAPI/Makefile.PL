# Note: this file was auto-generated by Module::Build::Compat version 0.4007
require 5.006;
use ExtUtils::MakeMaker;
WriteMakefile
(
  'NAME' => 'App::Nopaste::Service::PastebinComAPI',
  'VERSION_FROM' => 'lib/App/Nopaste/Service/PastebinComAPI.pm',
  'PREREQ_PM' => {
                   'App::Nopaste::Service' => 0,
                   'Test::More' => 0,
                   'WWW::Pastebin::PastebinCom::API' => '0.003'
                 },
  'INSTALLDIRS' => 'site',
  'EXE_FILES' => [],
  'PL_FILES' => {}
)
;
