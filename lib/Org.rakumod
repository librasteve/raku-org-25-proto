unit class Org;

use Air::Functional :BASE;
use Air::Base;

#`[ todos
- tabs eg text handling (Grammars), object orientation (Roles), functional (Lazy), types (gradual), ecosystem
- https://github.com/librasteve/raku-HTMX-Examples/blob/a778ea0fe882a15d82c667b345721d670f26861f/templates/tabs_hateoas/index.crotmp
- one liners
- delegation, mixins / but
- (*@a, *%h)
- file IO slurp spurt tests

python.org
 - easy == gradual types & repl
#]

my @tools = [Analytics.new: :provider(Umami), :key<FIXME>,];

sub note($s) {
    p( :style('font-size: 0.8em; text-align: right'), em("...$s") )
}
sub vignette(*@a, *%h) {
    grid :grid-template-columns<2.2fr 3.2fr>, :rows(1), :gap(1.5), |%h, @a
}
#sub vignette(*@a, *%h) {
#    my $direction = $++ %% 2 ?? 'ltr' !! 'rtl';
#    grid :grid-template-columns<2.2fr 3.2fr>, :rows(1), :gap(1.5), :$direction, |%h, @a
#}
sub install  {
    div [
        a :href<https://rakubrew.org>, :target<_blank>, button "Install";
        p :style('font-size: 0.8em;'), "linux, macOS, and Windows";
    ];
}

sub SITE is export {
    site :@tools, :register[Hilite.new, Tabs.new], :theme-color<pink>, :bold-color<lime>,
        page #:REFRESH(5),
            title => 'raku®',
            description => 'The raku® programming language.',
            [
            header [
                nav :logo( span a :style("display: flex; align-items: center; gap: 0.5rem; text-decoration: none;"),
                        [ img :src</img/camelia-logo.png>, :width<60px>; p :style("margin:0"), "raku®" ]),
                    :widgets[lightdark],
                    [
                        docs      => (external :href<https://docs.raku.org>),
                        community => (external :href<https://discord.gg/VzYpdQ6>),
                        packages  => (external :href<https://raku.land>),
                        feed      => (external :href<https://rakudoweekly.blog>),
                        install   => (external :href<https://rakubrew.org>),
                ];
            ];
            main [
                div :align<center>, [
                    h1 'raku is the expressive, powerful, multi-paradigm programming language.';
                    h4 em '"power tools for coders"';
                    install;

                    div [
                        h5 'raku packs a massive collection of programming tools into a single language. with all that choice at your fingertips, you can pick the best tool for the task.';
                        h5 'Object-Oriented, Functional and Procedural styles combine smoothly. Strict and Gradual typing is built in.';
                    ];

#                    div :align<center>, [
#                        h6 "Growing ecosystem with modules such as Cro (web framework), Red (object relational mapper), Jupyter::Chatbook (LLM), Sparky (CI)...";
#                    ];
                    #boxen ... Open Source, Growing Ecosystem, Friendly Community, v6.d
                ];

                div [
                    tabs [
                        Multi-Paradigm => tab
                            vignette :direction<rtl>, [
                                article [
                                    h3 'Multi-Paradigm';
                                    ul [
                                        li( 'Object-Oriented: '; code 'class Circle'; ' encapsulates data and behavior' );
                                        li( 'Functional: '; code '.map'; ' and reduce '; code '[+]'; ' process lists immutably' );
                                        li( 'Procedural: the overall code flow is straightforward' );
                                    ];
                                    note 'natural syntax & semantics';
                                ];
                                article [
                                    hilite q:to/END/;
                                    class Circle {
                                        has $.radius;
                                        method area { π * $.radius² }
                                    }

                                    my @radii = 1..4;
                                    my @circles = @radii.map: -> $radius { Circle.new(:$radius) };
                                    my $total-area = [+] @circles.map: *.area;

                                    say "Total area: $total-area";
                                    END
                            ];
                        ];

                        Gradual-Typing => tab
                            vignette :direction<rtl>, [
                                article [
                                    h3 'Strict & Gradual Typing';
                                    ul [
                                        li( code 'Str $name';  ' and '; code 'Int $age'; 'enforce strict types.');
                                        li( code '$user'; ' and '; code '$info'; ' are dynamically typed.' );
                                        li( 'They work smoothly together ... gradual typing in action.' );
                                    ];
                                    note 'rapid prototype to solid product';
                                ];
                                article [
                                    hilite q:to/END/;
                                    sub greet(Str $name) {          # Strictly typed
                                        say "Hello, $name!"
                                    }
                                    my $user = "Alice";             # Untyped (dynamic)
                                    greet($user);                   # Works fine

                                    my Int $age = 30;               # Strict Int
                                    my $info = "Age: $age";         # Dynamic string interpolation
                                    say $info;
                                    END
                            ];
                        ];
                    ];

                    div :align<center>, [
                        h5 'Plus Grammars, Concurrency, Lazy Evaluation, Multi-Dispatch ...';
                    ];

                    tabs [
                        Grammars => tab
                            vignette [
                                article [
                                    h3 'Grammars';
                                    p  'Definable grammars for pattern matching and generalized string processing.';
                                    note 'domain specific languages';
                                ];
                                article [
                                    hilite q:to/END/;
                                    grammar Parser {
                                        rule  TOP  { I <love> <lang> }
                                        token love { '♥' | love }
                                        token lang { < Raku Perl Rust Go Python Ruby > }
                                    }

                                    say Parser.parse: 'I ♥ Raku';
                                    # OUTPUT: ｢I ♥ Raku｣ love => ｢♥｣ lang => ｢Raku｣

                                    say Parser.parse: 'I love Perl';
                                    # OUTPUT: ｢I love Perl｣ love => ｢love｣ lang => ｢Perl｣
                                    END
                                ];
                            ];


                        Concurrency => tab
                            vignette [
                                article [
                                    h3 'Concurrency';
                                    p  'Parallelism, concurrency, and asynchrony including multi-core support.';
                                    note 'exploit latest hardware';
                                ];
                                article [
                                    hilite q:to/END/;
                                    start { sleep 1.5; print "hi" }
                                    await Supply.from-list(<A B C D E F>).throttle: 2, {
                                        sleep 0.5;
                                        .print
                                    }
                                    # OUTPUT: ABCDhiEF'
                                    END
                                ];
                            ];

                        Lazy-Evaluation => tab
                            vignette [
                                article [
                                    h3 'Lazy Evaluation';
                                    p  'Functional programming primitives, lazy and eager list evaluation.';
                                    note 'memory & processor efficient';
                                ];
                                article [
                                    hilite q:to/END/;
                                    # Infinite list of primes:
                                    my @primes = ^∞ .grep: *.is-prime;
                                    say "1001ˢᵗ prime is @primes[1000]";

                                    # Lazily read words from a file:
                                    .say for '50TB.file.txt'.IO.words;
                                    END
                                ];
                            ];

                        Multi-Dispatch => tab
                            vignette [
                                article [
                                    h3 'Multi-Dispatch';
                                    p [ 'Multi subs and methods help streamline code such as this Fibonacci generator. [Or, in this case, you could use the '; code '...'; ' Sequence operator.]' ];
                                    note 'cleaner, more extensible code';
                                ];
                                article [
                                    hilite q:to/END/;
                                    proto fib (Int $n --> Int) {*}
                                    multi fib (0)  { 0 }
                                    multi fib (1)  { 1 }
                                    multi fib ($n) { fib($n - 1) + fib($n - 2) }
                                    # -or-
                                    my @fib = 0, 1, *+* ... *;
                                    END
                            ];
                        ];
                    ];

                    div :align<center>, [
                        h5 "Uniquely powerful: Role Composition, Hyper Operators, Numerics, Sets & Junctions, Unicode Regexs, Smartmatching, CLI...";
                    ];

                    tabs [
                        Role-Composition => tab
                            vignette :direction<rtl>, [
                                article [
                                    h3 'Role Composition';
                                    p 'Here\'s a Bird class that inherits from Animal and composes the Flyer role. It shows a child method overriding the parent and usage of both inherited and composed behavior.';
                                    note 'Python simplicity with C++ power';
                                ];
                                article [
                                    hilite q:to/END/;
                                    role Flyer { method fly { say "I'm flying!" } }

                                    class Animal { method speak { say "Some sound" } }

                                    class Bird is Animal does Flyer {
                                        method speak { say "Chirp!" }
                                    }

                                    Bird.new.speak;  # Chirp!
                                    Bird.new.fly;    # I'm flying!
                                    END
                                ];
                            ];

                        Hyper-Operators => tab
                            vignette :direction<rtl>, [
                                article [
                                    h3 'Hyper Operators';
                                    p  'Smart and consistent operator modifiers that apply parallel code execution and vector processing.';
                                    note 'easy parallel processing';
                                ];
                                article [
                                    hilite q:to/END/;
                                    my @nums = [1,2,3];

                                    say @nums »+» 10;       # (11 12 13)            [Hyper]
                                    say [+] @nums;          # 6                     [Reduce]
                                    say @nums X* 2, 4;      # ((2 4) (4 8) (6 12))  [Cross]
                                    END
                                ];
                            ];

                        Sets-Junctions => tab
                            vignette :direction<rtl>, [
                                article [
                                    h3 'Sets & Junctions';
                                    p 'Set, Bag and Mix come with all the set operators: ∪ ∩ ∆ ⊖ ∖ ∈ ∉ ⊆ ⊂ ⊇ ⊃>.';
                                    p 'Junctions (any, all, one, none) simplify multi-value tests for clean declarative logic.';
                                    note 'cleaner, concise code';
                                ];
                                article [
                                    hilite q:to/END/;
                                    my $colors = set <red green blue>;
                                    say 'blue' ∈ $colors;        # True

                                    my $fruit = any <apple banana cherry>;
                                    say so $fruit eq 'banana';   # True

                                    say so 5 > (1 & 2 & 3);      # True
                                    END
                                ];
                            ];

                        Numerics => tab
                            vignette :direction<rtl>, [
                                article [
                                    h3 'Numerics';
                                    p  'Rational, Fractions, Complex, BigInt & Unicode numbers all come as standard.';
                                    note 'math without surprises';
                                ];
                                article [
                                    hilite q:to/END/;
                                    say 0.1 + 0.2 == 0.3;           # True
                                    say (1/13 + 3/7 + 3/8).raku;    # <641/728>
                                    say e ** (i * π) =~= -1;        # True
                                    say 2 ** 64 + 1;                # 18446744073709551617
                                    say +௪௨;                        # 42 (in Tamil)
                                    END
                            ];
                        ];

                        Unicode-Regexs => tab
                            vignette :direction<rtl>, [
                                article [
                                    h3 'Unicode Regexs';
                                    p  'Arguably the most powerful Unicode-aware regex engine available, especially for complex text processing. It shines in tasks where precision and multilingual support are essential with unique Grapheme and Diacritic handling.';
                                    note 'international regular expressions';
                                ];
                                article [
                                    hilite q:to/END/;
                                    say "Cool😎" ~~ /<:Letter>* <:Block("Emoticons")>/; # ｢Cool😎｣
                                    say "Cześć" ~~ m:ignoremark/ Czesc /;               # ｢Cześć｣
                                    say "WEIẞE" ~~ m:ignorecase/ weisse /;              # ｢WEIẞE｣
                                    say "หนูแฮมสเตอร์" ~~ /<:Letter>+/;                   # ｢หนูแฮมสเตอร์｣ thehamster
                                    END
                            ];
                        ];

                        Smartmatching => tab
                            vignette :direction<rtl>, [
                                article [
                                    h3 'Smartmatching';
                                    p [ 'The '; code 'given { when }'; ' construct uses smartmatching ('; code('~~'); ') to check type, equality, membership, logic, regex and so on.'; ];
                                    note 'powerful matcher capability';
                                ];
                                article [
                                    hilite q:to/END/;
                                my $value = 42;

                                given $value {
                                    when * %% 7    { say "Divisible by 7" }
                                    when Int       { say "It's an integer!" }
                                    when 42        { say "The answer to everything!" }
                                    when 1..10     { say "Between 1 and 10" }
                                    when /\d ** 2/ { say "Has two digits" }
                                    default        { say "Something else" }
                                }
                                END
                            ];
                        ];

                        Command-Line => tab
                            vignette :direction<rtl>, [
                                article [
                                    h3 'Command Line';  #iamerejh
                                    p  'Arguably the most powerful Unicode-aware regex engine available, especially for complex text processing. It shines in tasks where precision and multilingual support are essential with unique Grapheme and Diacritic handling.';
                                    note 'international regular expressions';
                                ];
                                article [
                                    hilite q:to/END/;
                                    say "Cool😎" ~~ /<:Letter>* <:Block("Emoticons")>/; # ｢Cool😎｣
                                    say "Cześć" ~~ m:ignoremark/ Czesc /;               # ｢Cześć｣
                                    say "WEIẞE" ~~ m:ignorecase/ weisse /;              # ｢WEIẞE｣
                                    say "หนูแฮมสเตอร์" ~~ /<:Letter>+/;                   # ｢หนูแฮมสเตอร์｣ thehamster
                                    END
                                ];
                            ];
                        ];
                ];

                div :align<center>, [
                    install;
                    h5 'Check the docs for more on: Custom Operators, Meta Object Protocol, Traits...';
                ];
            ];

            footer [
                p safe Q|
                    Hypered with <a href="https://htmx.org" target="_blank">htmx</a>.
                    Aloft on <a href="https://github.com/librasteve/Air" target="_blank"><b>&Aring;ir</b></a>.
                    Remembered by <a href="https://fco.github.io/Red/" target="_blank">red</a>.
                    Constructed in <a href="https://cro.raku.org" target="_blank">cro</a>.
                    &nbsp;&amp;&nbsp;
                    Styled by <a href="https://picocss.com" target="_blank">picocss</a>.
                |;
                p safe 'The Raku® Programming Language';
            ];
        ]
}


=begin pod

=head1 AUTHOR

librasteve <librasteve@furnival.net>

=head1 COPYRIGHT AND LICENSE

Copyright 2025 librasteve

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod