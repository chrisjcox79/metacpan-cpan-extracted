use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Nile',
    LICENSE => "perl",
    VERSION_FROM      => 'lib/Nile.pm', # finds $VERSION
    PREREQ_PM         => {
            Moose => 0,
            MooseX::NonMoose => 0,
            MooseX::MethodAttributes => 0,
            MooseX::Declare => 0,
            namespace::autoclean => 0,
            CGI::Carp => 0,
            URI => 0,
            Encode => 0,
            URI::Escape => 0,
            Crypt::RC4 => 0,
            Capture::Tiny => 0,
            Time::Local => 0,
            File::Slurp => 0,
            Time::HiRes => 0,
            MIME::Base64 => 3.11,
            Data::Dumper => 0,
            HTTP::Tiny => 0,
            Log::Tiny => 0,
            CGI::Simple => 0,
            HTTP::AcceptLanguage => 0,
            Import::Into => 0,
            Module::Load => 0,
            Module::Runtime => 0,
            XML::TreePP => 0,
            IO::Compress::Gzip => 0,
            DBI => 0,
            DBI::Profile => 0,
            DBI::ProfileDumper => 0,
            Hash::AsObject => 0,
            DateTime => 0,
            Tie::IxHash => 0,
            Benchmark::Stopwatch => 0,
            File::Find::Rule => 0,
            Scalar::Util => 0,
            HTTP::Headers => 0,
            Devel::StackTrace => 0,
            Devel::StackTrace::AsHTML => 0,
            PadWalker => 0,
            Devel::StackTrace::WithLexicals => 0,
            Plack::Builder => 0,
            Plack::Middleware::Deflater => 0,
            Email::Address => 0,
            Email::Date::Format => 0,
            Email::Simple => 0,
            Email::Sender::Simple => 0,
            MIME::Entity => 0,
            Email::Valid => 0,
            Data::Validate::URI => 0,
            HTML::Entities => 0,
            Cache::Redis => 0,
            Redis => 0,
            MongoDB => 0,
            MongoDB::MongoClient => 0,
            MongoDB::OID => 0,
            Memcached::Client => 0,
            Search::Elasticsearch => 0,
            Archive::Zip => 0,
            IO::Compress::Gzip => 0,
            IO::Uncompress::Gunzip => 0,
            Data::Validate::URI => 0,
            CSS::Minifier => 0,
            JavaScript::Minifier => 0,
            HTML::Packer => 0,
            Perl::Tidy => 0,

    }, # e.g., Module::Name => 1.1

    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Nile.pm', # retrieve abstract from module
       AUTHOR         => 'Ahmed Amin ELsheshtawy احمد امين الششتاوى <mewsoft@cpan.org>') : ()),
);
