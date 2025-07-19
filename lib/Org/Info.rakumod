unit class Info;

use Air::Functional :BASE;
use Air::Base;

sub info-page(&basepage, &shadow) is export {
    basepage #:REFRESH(10),
        main [
            shadow;
            div :align<center>, :style('position: relative; padding: 20px;'), [
                h1 'Information';
            ];
            dashboard [
                box :order(1), [
                    header [h3 'IDEs'; p 'IDEs and editor plugins for working with Raku.'];
                    main markdown q:to/END/;
                    #### IntelliJ

                     - [RIP](https://github.com/ab5tract/raku-intellij-plugin): Raku IntelliJ Plugin. For use with IntelliJ [IDEs](https://www.jetbrains.com/idea/download) (scroll down for the Community Edition).

                    #### Visual Studio Code

                     - [Raku language support](https://github.com/bscan/RakuNavigator)

                    #### Geany

                     - [Geany](https://www.geany.org) is a popular flyweight Open Source IDE - now supports Raku.

                    #### Atom

                     - [Raku syntax highlighter](https://atom.io/packages/language-perl6), a plugin that provides Raku highlighting. Follow the instructions in the package readme.
                     - [Raku script runner](https://atom.io/packages/script)
                     - See here how to configure both the above plugins, as well as others, to turn [Atom into a Raku IDE](https://github.com/perl6/Atom-as-a-Perl6-IDE). Works with the syntax highlighter listed above. Can run Raku code from the screen buffer, selection, or a file.
                     - [Raku Editor Tools](https://atom.io/packages/atom-perl6-editor-tools), an Atom plugin that provides a collection of useful Raku editing tools (may not be compatible with the latest Atom).

                    #### Vim

                     - [Raku syntax highlighting](https://github.com/Raku/vim-raku)

                    #### Emacs

                     - [raku-mode](https://github.com/Raku/raku-mode), an Emacs major mode for Raku which provides syntax highlighting (and more)
                     - [Unified Raku + Perl + Moose/MooseX::Declare](https://github.com/jrockway/cperl-mode) syntax highlighting
                     - [Spacemacs](https://github.com/syl20bnr/spacemacs): Emacs wrapper with vim key-bindings and with extra stuff

                    #### Nano

                     - [Raku syntax highlighting](https://github.com/hankache/raku.nanorc)

                    #### Other

                     - [Podlite](https://podlite.org/) – Open Source desktop Raku Pod editor and viewer for Windows, Linux, and Mac.
                     - [pod6.in](https://pod6.in/) – online Raku Pod (aka pod6) editor.
                     - [CudaText](https://cudatext.github.io/): Raku lexer is present in Addon Manager
                     - [Kate](https://kate-editor.org/): A cross-platform text editor part of the KDE project
                     - [Notepad++](https://notepad-plus-plus.org/): A free and open-source source code editor for use with Microsoft Windows.
                    END
                ];
                box :order(2), [
                    header [h3 'Community'; p 'Get in touch with us! Here\'s how:'];
                    main markdown q:to/END/;
                    #### Internet Relay Chat (IRC)

                    Much discussion happens on [#raku, our IRC channel](/community/irc). This is the fastest way to get help.

                    #### Discord

                    If you prefer Discord for live chat, there is [a Discord server](https://discord.gg/VzYpdQ6) available that is also bridged to the IRC.

                    #### Blogs

                    Another way to stay tuned is [reading posts from blogs that focus on Raku](https://planet.raku.org/).

                    #### Latest Releases

                    Check out the latest release at [Rakudo News](https://rakudo.org/news).

                    #### Download Options

                    [Rakubrew](https://rakubrew.org) is a Raku installation tool. It allows you to have multiple versions of different Raku implementations installed in parallel and switch between them.

                    Other download and installation options are available at [Rakudo Downloads](https://rakudo.org/downloads).

                    #### Code Examples

                    Raku is well represented on [Rosetta Code](/community/rosettacode), where you can see the Raku Programming Language (and many other languages) applied to numerous programming tasks.

                    #### Stack Overflow

                    Many questions and answers are marked with the [Raku tag](https://stackoverflow.com/questions/tagged/raku).
                    END
                    ];
                box :order(3), [
                    header h3 'Sandboxes';
                    main markdown q:to/END/;
                     - [Raku track on exercism.io](https://exercism.io/tracks/raku)
                     - [Online Raku compiler (most up to date)](https://repl.it/languages/raku)
                     - [Online Raku REPL (glot.io)](https://glot.io/new/raku)
                     - [Online Raku REPL (tio.run)](https://tio.run/#perl6)
                     - [Cheatsheet](https://raw.githubusercontent.com/Raku/mu/master/docs/Perl6/Cheatsheet/cheatsheet.txt)
                    END
                    ];
                box :order(4), [
                    header h3 'Guides';
                    main markdown( q:to/END/;
                     - [The Raku Guide](https://raku.guide/)
                     - [Raku Essentials](https://course.raku.org/essentials/)
                     - [Learn Raku in Y minutes](https://learnxinyminutes.com/docs/raku/)
                     - [Learn Pod in Y minutes](https://learnxinyminutes.com/docs/perl6-pod/)
                     - [Raku tutorials](https://github.com/perlpilot/perl6-docs)
                     - [Perl and Raku Weekly Challenge](https://perlweeklychallenge.org/)
                    END
                    )
                ];
                box :order(5), [
                    header h3 'Social & Blogs';
                    main markdown q:to/END/;
                    Social:

                     - Mastodon: [@rakulang](https://fosstodon.org/@rakulang)
                     - Stack Overflow: [Raku Questions](https://stackoverflow.com/questions/tagged/raku)
                     - Reddit: [Subscribe to r/rakulang](https://www.reddit.com/r/rakulang/)
                     - Facebook: [Join the Raku Group](https://www.facebook.com/groups/1595443877388632/)
                     - Twitter: [Follow @raku_news](https://twitter.com/raku_news)

                    Blogs:

                     - [Raku Blog Aggregator](https://planet.raku.org/)
                     - [Rakudo Weekly News](https://rakudoweekly.blog/) – Weekly changes in and around Rakudo
                     - [Raku Advent Calendar](https://rakuadventcalendar.wordpress.com/) - [help for contributors](https://github.com/Raku/advent/blob/master/CONTRIBUTING.md)
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
                box :order(8), [
                    header h3 'Raku Steering Council (RSC)';
                    main markdown q:to/END/;
                    The [Steering Council](https://raku.github.io/Raku-Steering-Council/) is a 7-person committee with many responsibilities, including maintaining the quality and stability of the Raku language, its compilers, and its ecosystem. Also to make contributing and learning Raku as accessible, inclusive, and sustainable as possible ([more information](https://raku.github.io/Raku-Steering-Council/)).

                    The [Problem Solving](https://github.com/Raku/problem-solving) repository contains issues that impact Raku which require consensus to resolve. The RSC is responsible for guiding any deadlocked issues to completion.
                    END
                    ];
            ];
        ];
}



