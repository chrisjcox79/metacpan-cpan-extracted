# Note: this file was auto-generated by Module::Build::Compat version 0.32
require 5.006;
use ExtUtils::MakeMaker;
WriteMakefile
(
          'INSTALLDIRS' => 'site',
          'NAME' => 'Test::XML::Deep',
          'EXE_FILES' => [],
          'VERSION_FROM' => 'lib/Test/XML/Deep.pm',
          'PREREQ_PM' => {
                           'XML::Simple' => '2.18',
                           'Test::Simple' => '0.86',
                           'XML::Parser' => '2.36',
                           'Test::NoWarnings' => 0,
                           'Test::Deep' => '0.104'
                         }
        )
;
