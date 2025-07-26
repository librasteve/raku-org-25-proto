unit class Help;

use Air::Functional :BASE;
use Air::Base;

sub help-page(&basepage, &shadow) is export {
    basepage #:REFRESH(10),
        main [
            shadow;
            div :align<center>, :style('position: relative; padding: 20px;'), [
                h1 'I need Help!';
            ];
            dashboard [
                box :order(2), [
                    header [h3 'Places to find help'; p 'Get in touch with us! Here\'s how:'];
                    main markdown q:to/END/;
                    #### Internet Relay Chat (IRC)

                    Much discussion happens on [#raku, our IRC channel](/community/irc). This is the fastest way to get help.

                    #### Discord

                    If you prefer Discord for live chat, there is [a Discord server](https://discord.gg/VzYpdQ6) available that is also bridged to the IRC.

                    #### Stack Overflow

                    Many questions and answers are marked with the [Raku tag](https://stackoverflow.com/questions/tagged/raku).

                    #### Mailing List

                    For the folks who can't use IRC or Discord, there's a (low traffic) user questions mailing list. 
                    *(Which uses the legacy name of perl6-users)*.  <a href="mailto:perl6-users-subscribe@perl.org">Subscribe</a> 
                      <a href="http://nntp.perl.org/group/perl.perl6.users/">Archive</a>

                    END
                ];
            ];
        ];
}



