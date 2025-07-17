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
                    main safe q:to/END/;
                      <div>
                        <ul>
                          <li><a href="https://github.com/ab5tract/raku-intellij-plugin">RIP</a>: Raku IntelliJ Plugin. For use with IntelliJ <a href="https://www.jetbrains.com/idea/download">IDEs</a> (scroll down for the Community Edition).</li>
                          <li><a href="https://atom.io">Atom</a>:
                            <ul>
                              <li><a href="https://atom.io/packages/language-perl6">Raku syntax highlighter</a>,
                                  a plugin that provides Raku highlighting. Follow the instructions in the package readme.</li>
                              <li><a href="https://atom.io/packages/script">Raku script runner</a></li>
                              <li>See here how to configure both the above plugins, as well as others,
                                  to turn <a href="https://github.com/perl6/Atom-as-a-Perl6-IDE">Atom into a Raku IDE</a>.
                                  Works with the syntax highlighter listed above. Can run Raku code from the screen buffer, selection, or a file.</li>
                              <li><a href="https://atom.io/packages/atom-perl6-editor-tools">Raku Editor Tools</a>, an Atom plugin that
                                  provides a collection of useful Raku editing tools (may not be compatible with the latest Atom).</li>
                            </ul></li>
                          <li>VisualStudio Code: <a href="https://github.com/bscan/RakuNavigator">Raku language support</a></li>
                          <li><a href="https://www.geany.org">Geany</a> - popular flyweight Open Source IDE now supports Raku.</li>
                          <li><a href="https://podlite.org/">Podlite</a> - Open Source desktop Raku Pod editor and viewer for Windows, Linux, and Mac.</li>
                          <li><a href="https://pod6.in/">pod6.in</a> - online Raku Pod (aka pod6) editor.</li>
                          <li>Vim: <a href="https://github.com/Raku/vim-raku">Raku syntax highlighting</a></li>
                          <li>Emacs:
                            <ul>
                              <li><a href="https://github.com/Raku/raku-mode">raku-mode</a>, an Emacs major mode for Raku which provides syntax highlighting (and more)</li>
                              <li><a href="https://github.com/jrockway/cperl-mode">Unified Raku + Perl + Moose/MooseX::Declare</a> syntax highlighting</li>
                              <li><a href="https://github.com/syl20bnr/spacemacs">Spacemacs</a>: Emacs wrapper with vim key-bindings and with extra stuff</li>
                            </ul>
                          </li><li>Nano: <a href="https://github.com/hankache/raku.nanorc">Raku syntax highlighting</a></li>
                          <li><a href="https://cudatext.github.io/">CudaText</a>: Raku lexer is present in Addon Manager</li>
                          <li><a href="https://kate-editor.org/">Kate</a>: A cross-platform text editor part of the KDE project</li>
                          <li><a href="https://notepad-plus-plus.org/">Notepad++</a>: A free and open-source source code editor for use with Microsoft Windows.</li>
                        </ul>
                      </div>
                    END
                ];
                box :order(2), [
                    header [h3 'Community'; p 'Get in touch with us! Here\'s how:'];
                    main safe q:to/END/;
                        <div>
                        <h4 class="trim-top">Internet Relay Chat (IRC)</h4>
                          <p>
                              Much discussion happens on <a href="/community/irc">#raku,
                              our IRC channel</a>. This is the fastest way to get help.
                          </p>

                          <h4>Discord</h4>
                          <p>
                              If you prefer Discord for live chat, there is
                              <a href="https://discord.gg/VzYpdQ6">a Discord server</a>
                              available that is also bridged to the IRC.
                          </p>

                          <h4>Blogs</h4>
                          <p>
                              Another way to stay tuned is <a href="https://planet.raku.org/">reading
                              posts from blogs that focus on Raku.</a>
                          </p>

                          <h4>Latest Releases</h4>
                          <p>
                              Check out the latest release at <a href="https://rakudo.org/news">Rakudo News</a>.
                          </p>

                          <h4>Download Options</h4>
                          <p>
                              <a href="https://rakubrew.org">Rakubrew</a> is a Raku installation tool. It allows you to have multiple versions of different Raku implementations installed in parallel and switch between them..
                          </p>
                          <p>
                              Other download and installation options are available at <a href="https://rakudo.org/downloads">Rakudo Downloads</a>.
                          </p>

                          <h4>Code Examples</h4>
                          <p>
                              Raku is well represented on
                              <a href="/community/rosettacode">Rosetta Code</a>, where you can see
                              the Raku Programming Language (and many other languages) applied to
                              numerous programming tasks.
                          </p>

                          <h4>Stack Overflow</h4>
                          <p>
                              Many questions and answers marked with
                              <a href="https://stackoverflow.com/questions/tagged/raku">Raku tag</a>.
                          </p>
                        </div>
                        END
                    ];
                box :order(7), [
                    header h3 'Artistic License';
                    main safe q:to/END/;
                      <div>
                        <p>
                          The Raku core development teams release the specification, compilers, and documentation they develop under the <a href="https://spdx.org/licenses/Artistic-2.0.html">Artistic 2.0 license</a>.
                        </p>
                        <p>
                          This is the same license established by perl and most CPAN modules and has been adopted by almost all OS distributions.
                        </p>
                        <p>
                          The broader development community is of course not required to use this license, but there is a <a href="https://raku.land/stats">large uptake</a> among the community.
                        </p>
                      </div>
                      END
                    ];
                box :order(8), [
                    header h3 'Raku Steering Council (RSC)';
                    main safe q:to/END/;
                      <div>
                        <p>
                          The <a href="https://raku.github.io/Raku-Steering-Council/">Steering Council</a> is a 7 person committee with many responsibilities, including maintaining the quality and stability of the Raku language, its compilers and its ecosystem. Also to make contributing and learning Raku as accessible, inclusive, and sustainable as possible (<a href="https://raku.github.io/Raku-Steering-Council/">more information</a>).
                        </p>
                        <p>
                          The <a href="https://github.com/Raku/problem-solving">Problem Solving</a> repository contains issues that impact Raku which require consensus to resolve. The RSC is responsible for guiding any deadlocked issues to completion.
                      </p></div>
                      END
                    ];
                box :order(5), [
                    header h3 'Social & Blogs';
                    main safe q:to/END/;
                      <div>
                        <ul>
                          <li>Mastodon: <a href="https://fosstodon.org/@rakulang">@rakulang</a></li>
                          <li>Stack Overflow: <a href="https://stackoverflow.com/questions/tagged/raku">Raku Questions</a></li>
                          <li>Reddit: <a href="https://www.reddit.com/r/rakulang/">Subscribe to r/rakulang</a></li>
                          <li>Facebook: <a href="https://www.facebook.com/groups/1595443877388632/">Join the Raku Group</a></li>
                          <li>Twitter: <a href="https://twitter.com/raku_news">Follow @raku_news</a></li>
                        </ul>
                      </div>
                      <div>
                        <ul>
                          <li><a href="https://planet.raku.org/">Raku Blog Aggregator</a></li>
                          <li><a href="https://rakudoweekly.blog/">Rakudo Weekly News</a> Weekly changes in and around Rakudo</li>
                          <li><a href="https://rakuadventcalendar.wordpress.com/">Raku Advent Calendar</a>
                          <a href="https://github.com/Raku/advent/blob/master/CONTRIBUTING.md">[help for contributors]</a></li>
                        </ul>
                      </div>
                      END
                    ];
                box :order(6), [
                    header h3 'Books';
                    main safe q:to/END/;
                      <div>
                        <p>See <a href="https://perl6book.com/">a helpful chart of Raku Books</a> or pick from the list below.</p>
                        <ul>
                          <li><a href="https://www.apress.com/gp/book/9781484261088">Raku Fundamentals</a>, by Moritz Lenz <small>(published, print and ebook)</small></li>
                          <li><a href="https://deeptext.media/perl6-at-a-glance/">Perl&nbsp;6 at a Glance</a>, by Andrew Shitov <small>(published, print)</small></li>
                          <li><a href="http://greenteapress.com/wp/think-perl-6/">Think Raku: How to Think Like a Computer Scientist</a>, by Laurent Rosenfeld <small>(published, print)</small></li>
                          <li><a href="https://smile.amazon.com/dp/1484232275/">Parsing with Perl&nbsp;6 Regexes and Grammars</a>, by Moritz Lenz <small>(published, print and ebook)</small></li>
                          <li><a href="https://kyclark.gitbooks.io/metagenomics/content/">Metagenomics</a>, by Ken Youens-Clark <small>(published, ebook)</small></li>
                          <li><a href="https://www.amazon.com/gp/product/B07221XCVL">Learning to program with Perl&nbsp;6: First Steps</a>, by JJ Merelo <small>(published, ebook)</small></li>
                        </ul>
                        </div>
                      END
                    ];
                box :order(3), [
                    header h3 'Sandboxes';
                    main safe q:to/END/;
                      <div>
                        <ul>
                          <li><a href="https://exercism.io/tracks/raku">Raku track on exercism.io</a></li>
                          <li><a href="https://repl.it/languages/raku">Online Raku compiler (most up to date)</a></li>
                          <li><a href="https://glot.io/new/raku">Online Raku REPL (glot.io)</a></li>
                          <li><a href="https://tio.run/#perl6">Online Raku REPL (tio.run)</a></li>
                        </ul>
                        <ul>
                          <li><a href="https://raw.githubusercontent.com/Raku/mu/master/docs/Perl6/Cheatsheet/cheatsheet.txt">Cheatsheet</a></li>
                        </ul>
                      </div>
                      END
                    ];
                box :order(4), [
                    header h3 'Guides';
                    main safe q:to/END/;
                      <div>
                        <ul>
                          <li><a href="https://raku.guide/">The Raku Guide</a></li>
                          <li><a href="https://course.raku.org/essentials/">Raku Essentials</a></li>
                          <li><a href="https://learnxinyminutes.com/docs/raku/">Learn Raku in Y minutes</a></li>
                          <li><a href="https://learnxinyminutes.com/docs/perl6-pod/">Learn Pod in Y minutes</a></li>
                          <li><a href="https://github.com/perlpilot/perl6-docs">Raku tutorials</a></li>
                          <li><a href="https://perlweeklychallenge.org/">Perl and Raku Weekly Challenge</a></li>
                        </ul>
                      </div>
                      END
                    ];
            ];
        ];
}



