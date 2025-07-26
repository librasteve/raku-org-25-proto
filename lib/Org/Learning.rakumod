unit class Learning;

use Air::Functional :BASE;
use Air::Base;

sub learning-page(&basepage, &shadow) is export {
    basepage #:REFRESH(10),
        main [
            shadow;
            div :align<center>, :style('position: relative; padding: 20px;'), [
                h1 'Learning';
            ];
            dashboard [
                box :order(2), [

                    #### Code Examples

                    Raku is well represented on [Rosetta Code](/community/rosettacode), where you can see the Raku Programming Language (and many other languages) applied to numerous programming tasks.
                    END
                ];
                box :order(4), [
                    header h3 'Guides';
                    main markdown q:to/END/;
                     - [The Raku Guide](https://raku.guide/)
                     - [Raku Essentials](https://course.raku.org/essentials/)
                     - [Learn Raku in Y minutes](https://learnxinyminutes.com/docs/raku/)
                     - [Learn Pod in Y minutes](https://learnxinyminutes.com/docs/perl6-pod/)
                     - [Raku tutorials](https://github.com/perlpilot/perl6-docs)
                     - [Perl and Raku Weekly Challenge](https://perlweeklychallenge.org/)
                    END
                ];
                box :order(5), [
                    header h3 'Documentation (Tutorials and Reference)',
                    main markdown q:to/END/;
                      [The Raku Documentation](https://docs.raku.org>)
                    END
                ];
                box :order(6), [
                    header h3 'Books';
                    main markdown q:to/END/;
                    See [a helpful chart of Raku Books](https://perl6book.com/) or pick from the list below:

                     - [Raku Fundamentals](https://www.apress.com/gp/book/9781484261088), by Moritz Lenz *(published, print and ebook)*
                     - [Perl 6 at a Glance](https://deeptext.media/perl6-at-a-glance/), by Andrew Shitov *(published, print)*
                     - [Think Raku: How to Think Like a Computer Scientist](http://greenteapress.com/wp/think-perl-6/), by Laurent Rosenfeld *(published, print)*
                     - [Parsing with Perl 6 Regexes and Grammars](https://smile.amazon.com/dp/1484232275/), by Moritz Lenz *(published, print and ebook)*
                     - [Metagenomics](https://kyclark.gitbooks.io/metagenomics/content/), by Ken Youens-Clark *(published, ebook)*
                     - [Learning to program with Perl 6: First Steps](https://www.amazon.com/gp/product/B07221XCVL), by JJ Merelo *(published, ebook)*
                    END
                ];
                box :order(7), [
                    header h3 'Artistic License';
                    main markdown q:to/END/;
                    The Raku core development teams release the specification, compilers, and documentation they develop under the [Artistic 2.0 license](https://spdx.org/licenses/Artistic-2.0.html).

                    This is the same license established by Perl and most CPAN modules and has been adopted by almost all OS distributions.

                    The broader development community is of course not required to use this license, but there is a [large uptake](https://raku.land/stats) among the community.
                    END
                ];
            ];
        ];
}



