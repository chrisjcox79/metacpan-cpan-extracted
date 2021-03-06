Name:           perl-SMS-Send-NANP-TextPower
Version:        0.06
Release:        1%{?dist}
Summary:        SMS::Send driver for TextPower WebService
License:        CHECK(Distributable)
Group:          Development/Libraries
URL:            http://search.cpan.org/dist/SMS-Send-NANP-TextPower/
Source0:        http://www.cpan.org/modules/by-module/SMS/SMS-Send-NANP-TextPower-%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:      noarch
BuildRequires:  perl(ExtUtils::MakeMaker)
BuildRequires:  perl(Test::Simple) >= 0.44
BuildRequires:  perl(SMS::Send::Driver::WebService) >= 0.06
BuildRequires:  perl(XML::Simple)
Requires:       perl(SMS::Send::Driver::WebService) >= 0.06
Requires:       perl(XML::Simple)
Requires:       perl(:MODULE_COMPAT_%(eval "`%{__perl} -V:version`"; echo $version))

%description
SMS::Send driver for TextPower WebService

%prep
%setup -q -n SMS-Send-NANP-TextPower-%{version}

%build
%{__perl} Makefile.PL INSTALLDIRS=vendor
make %{?_smp_mflags}

%install
rm -rf $RPM_BUILD_ROOT

make pure_install PERL_INSTALL_ROOT=$RPM_BUILD_ROOT

find $RPM_BUILD_ROOT -type f -name .packlist -exec rm -f {} \;
find $RPM_BUILD_ROOT -depth -type d -exec rmdir {} 2>/dev/null \;

%{_fixperms} $RPM_BUILD_ROOT/*

%check
make test

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc Changes LICENSE perl-SMS-Send-NANP-TextPower.spec README Todo
%{perl_vendorlib}/*
%{_mandir}/man3/*

%changelog
* Wed Oct 21 2015 Michael R. Davis <mdavis@stopllc.com> 0.01-1
- Specfile autogenerated by cpanspec 1.78.
