use ExtUtils::MakeMaker;

WriteMakefile( NAME => 'Proc::Queue',
               VERSION_FROM => 'lib/Proc/Queue.pm',
               ABSTRACT_FROM => 'lib/Proc/Queue.pm',
               AUTHOR => 'Salvador Fandi�o <sfandino@yahoo.com>',
               # LICENSE => 'perl',
               PREREQ_PM => { Test::More => 0} );
