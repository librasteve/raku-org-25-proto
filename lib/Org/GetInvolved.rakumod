unit class GetInvolved;

use Air::Functional :BASE;
use Air::Base;

sub get-involved--page(&basepage, &shadow) is export {
    basepage #:REFRESH(10),
        main [
            shadow;
            div :align<center>, :style('position: relative; padding: 20px;'), [
                h1 'Get Involved';
            ];
            dashboard [
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

                    Visit the [install](/nav/1/install) page for the most convenient installation option for Linux, macOS, Windows and Docker.

                    Other download and installation options are available at [Rakudo Downloads](https://rakudo.org/downloads).

                    #### Code Examples

                    Raku is well represented on [Rosetta Code](/community/rosettacode), where you can see the Raku Programming Language (and many other languages) applied to numerous programming tasks.

                    #### Stack Overflow

                    Many questions and answers are marked with the [Raku tag](https://stackoverflow.com/questions/tagged/raku).

                    #### Git

                    The source and issue-tracker are available at [Rakudo Git](https://github.com/rakudo/rakudo)
                    END
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
                     - Discord: [The Discord server](https://discord.gg/VzYpdQ6)

                    Blogs:

                     - [Raku Blog Aggregator](https://planet.raku.org/)
                     - [Rakudo Weekly News](https://rakudoweekly.blog/) – Weekly changes in and around Rakudo
                     - [Raku Advent Calendar](https://rakuadventcalendar.wordpress.com/) - [help for contributors](https://github.com/Raku/advent/blob/master/CONTRIBUTING.md)
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



