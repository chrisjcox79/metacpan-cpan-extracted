# NAME

Text::Hyphen::TR - determine positions for hyphens inside Turkish words

# SYNOPSIS

This module is an implementation of Knuth-Liang hyphenation algorithm
for Turkish text using patterns from hyph-utf8 TeX package.

    use Text::Hyphen::TR;
    my $hyphenator = new Text::Hyphen::TR;

    print $hyphenator->hyphenate($turkish_word_in_Unicode, '-');
    # prints hyphenated with dashes

# EXPORT

See [Text::Hyphen](https://metacpan.org/pod/Text::Hyphen) for the interface documentation.

This module only provides Turkish patterns.

# ACKNOWLEDGEMENTS

Donald Knuth and Frank Liang for the algorithm.

Alexander Lebedev for all his valuable work on russian ispell
dictionaries and russian hyphenation patterns. See his archive
at [ftp://scon155.phys.msu.ru/pub/russian/](ftp://scon155.phys.msu.ru/pub/russian/) or his hyphenation page
at [http://scon155.phys.msu.su/~swan/hyphenation.html](http://scon155.phys.msu.su/~swan/hyphenation.html).

Patterns used in this module are generated by
generate\_patterns\_tr.rb script which is available at
[http://www.ctan.org/tex-archive/language/hyph-utf8/source/generic/hyph-utf8/languages/tr](http://www.ctan.org/tex-archive/language/hyph-utf8/source/generic/hyph-utf8/languages/tr).

The only change is one extra pattern that will not split "-acak" future tense suffix as "a-cak" at the very end of the word.
The original pattern list contains the same pattern for the "-ecek" suffix and those two are actually variants
of the same suffix so it makes no sense to have patterns for one and not the other.

Algorithm for pattern generation developed by P. A. MacKay for the Ottoman Texts Project in 1987.
Rules adapted for modern Turkish by H. Turgut Uyar &lt;uyar at itu.edu.tr>.
Initiative to improve Turkish patterns by S. Ekin Kocabas &lt;kocabas at stanford.edu>.
Pattern generation script written by Mojca Miklavec &lt;mojca.miklavec.lists at gmail.com> in June 2008.

# SEE ALSO

[Lingua::TR::Hyphenate](https://metacpan.org/pod/Lingua::TR::Hyphenate) is a completely different implementation. It has at least one bug acknowledged by its author
which this module does not have. Try hyphenating "antrparantez".

[http://mirror.ctan.org/language/turkish/hyphen/turk\_hyf.c](http://mirror.ctan.org/language/turkish/hyphen/turk_hyf.c), [http://www.tug.org/TUGboat/Articles/tb09-1/tb20mackay.pdf](http://www.tug.org/TUGboat/Articles/tb09-1/tb20mackay.pdf),
[http://www.ctan.org/tex-archive/language/hyph-utf8/source/generic/hyph-utf8/languages/tr](http://www.ctan.org/tex-archive/language/hyph-utf8/source/generic/hyph-utf8/languages/tr).

# BUGS AND SUPPORT

This code is hosted on Github, please see [https://github.com/kappa/Text-Hyphen-TR](https://github.com/kappa/Text-Hyphen-TR).

Please report any bugs or feature requests to GitHub issues.

# LICENSE

Copyright (C) Alex Kapranoff.

This is free software; you can redistribute it and/or modify it under
the terms GNU General Public License version 3.

The patterns that are used inside this module may also be obtained from CTAN under LPPL license.
See [http://www.ctan.org/tex-archive/language/hyph-utf8/](http://www.ctan.org/tex-archive/language/hyph-utf8/) and specifically
[http://mirrors.ctan.org/language/hyph-utf8/tex/generic/hyph-utf8/patterns/tex/hyph-tr.tex](http://mirrors.ctan.org/language/hyph-utf8/tex/generic/hyph-utf8/patterns/tex/hyph-tr.tex).

# AUTHOR

Alex Kapranoff &lt;alex@kapranoff.ru>
