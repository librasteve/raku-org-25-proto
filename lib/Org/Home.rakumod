unit class Home;

use Air::Functional :BASE;
use Air::Base;

sub note($s) {
    p( :style('font-size: 0.8em; text-align: right'), em("...$s") )
}
sub vignette(*@a, *%h) {
    grid :grid-template-columns<2.2fr 3.2fr>, :rows(1), :gap(1.5), |%h, @a
}
sub install  {
    div [
        a :href</nav/1/install>, :target<_self>, button "Install";
        p :style('font-size: 0.8em;'), "linux, macOS, and Windows";
    ];
}

sub home-page(&basepage, &shadow) is export {
    basepage
        main [
            shadow;
            div :align<center>, :style('position: relative; padding: 20px;'), [
                h1 'raku is the powerful, expressive, multi-paradigm programming language.';
                h4 em '"power tools for coders"';
                install;

                div [
                    h5 'raku packs a massive collection of programming tools into a single language. with all that choice at your fingertips, you can pick the best tool for the task.';
                ];
            ];

            div :align<center>, [
                spacer;
                h5 'Object-Oriented, Functional and Procedural styles combine smoothly. Strict and Gradual typing is built in …';
            ];

            div [
                tabs [

                    multi-paradigm => tab
                        vignette :direction<rtl>, [
                            article [
                                h3 'Multi-Paradigm';
                                p 'Smoothly combine coding styles:';
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

                    gradually-typed => tab
                        vignette :direction<rtl>, [
                            article [
                                h3 'Strict & Gradual Types';
                                p 'Introduce types as needed:';
                                ul [
                                    li( code 'Str $name';  ' and '; code 'Int $age'; 'enforce strict types.');
                                    li( code '$user'; ' and '; code '$info'; ' are dynamically typed.' );
                                    li( 'They work smoothly together ... gradual typing in action.' );
                                ];
                                note 'rapid prototype to solid product';
                            ];
                            article [
                                hilite q:to/END/;
                                    sub greet(Str $name) {      # Strictly typed
                                        say "Hello, $name!"
                                    }
                                    my $user = "Alice";         # Untyped (dynamic)
                                    greet($user);               # Works fine

                                    my Int $age = 30;           # Strict Int
                                    my $info = "Age: $age";     # Dynamic string interpolation
                                    say $info;
                                    END
                            ];
                        ];

                    easy-REPL => tab
                        vignette :direction<rtl>, [
                            article [
                                h3 'Easy REPL';
                                p 'Experienced programmers in any other language can pick up raku very quickly, and beginners find the REPL (Read-Evaluate-Print-Loop) a great way to interactively explore.';
                                note 'makes the easy things easy';
                            ];
                            article [
                                hilite q:to/END/;
                                    # Output, quoting
                                    say "Hello, I'm raku!";
                                    #Hello, I'm raku!

                                    # Input, assignment
                                    my $name = prompt "What is your name?";
                                    #What is your name? [Dave]

                                    # Interpolation
                                    say "I'm sorry, $name. I'm afraid I can't do that.😔";
                                    #I'm sorry, Dave. I'm afraid I can't do that.😔
                                    END
                                ];
                        ];

                    command-line => tab
                        vignette :direction<rtl>, [
                            article [
                                h3 'Command Line';
                                p 'Create your own command line function:';
                                ul [
                                    li( 'Positional arguments like ('; code '$name'; ') are required by default.');
                                    li( 'Named arguments like (', code ':$age'; ' and '; code ':$verbose'; ') are optional.' );
                                    li( 'Boolean flags like ', code '--verbose'; ' are automatically treated as True if present.' );
                                ];
                                note 'with automated --help';
                            ];
                            article [
                                hilite q:to/END/;
                                    #!/usr/bin/env raku
                                    sub MAIN(Str $name, Int :$age = 0, Bool :$verbose) {
                                        say "Hello, $name!";

                                        say "You are $age years old." if $age > 0;
                                        say "This is a verbose greeting." if $verbose;
                                    }

                                    # ./greet Alice --age=30 --verbose
                                    END
                                ];
                        ];


                    consistent-ecosystem => tab
                        vignette :direction<rtl>, [
                            article [
                                h3 'Consistent Ecosystem';
                                p ['Raku ships with the '; code 'zef'; ' package manager.'];
                                p 'Built in semantic version literals and programmatic comparison help you set wildcard (*) and minimum (+) versions.';
                                p 'Comprehensive support for modules and meta-data allows selective import on version, author and api.';
                                note 'robust package management';
                            ];
                            article [
                                hilite q:to/END/;
                                    # Measure.rakumod
                                    unit module Physics::Measure:ver<2.0.1>:auth<zef:alice)>;

                                    # META6.json
                                    "version": "2.0.1",
                                    "raku": "6.d",
                                    "auth": "zef:alice",
                                    "depends": ["Physics::Unit:ver<2+>:api<2>"],

                                    # zef install Physics::Measure:api<1>

                                    use 6.d;               # guarantees backward compatible
                                    use Physics::Measure:api<1>:ver<2.0.2+> :ALL;
                                    END
                                ];
                        ];

                    one-liners => tab
                        vignette :direction<rtl>, [
                            article [
                                h3 'One Liners';
                                p 'Use on the command line for more ergonomic scripts.';
                                p ['A '; code 'sed'; ' substitution, for example.'];
                                note 'bash, sed, awk alternative';
                            ];
                            article [
                                hilite q:to/END/;
                                    raku -n -e 'say s:g/foo/bar/' file.txt

                                    # Replace all "foo" with "bar"
                                    END
                                ];
                        ];
                ];

                div :align<center>, [
                    spacer;
                    h5 '… featuring: Grammars, Concurrency, Lazy Evaluation, Role Composition, Mixins, Multi-Dispatch, Signatures, IO …';
                ];

                tabs [
                    grammars => tab
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


                    concurrency => tab
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

                    lazy-evaluation => tab
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

                    role-composition => tab
                        vignette [
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

                    mixins => tab
                        vignette [
                            article [
                                h3 'Mixins';
                                p 'This shows an instance of the Int (arbitrary precision integer) class with a stringification method mixed in via the but. The say routine stringifies the variable and so returns "forty two".';
                                note 'everything is an object';
                            ];
                            article [
                                hilite q:to/END/;
                                    my Int $i = 42 but 'forty two';

                                    say $i;   # OUPUT <<forty two>>
                                    END
                                ];
                        ];

                    multi-dispatch => tab
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

                    signatures => tab
                        vignette [
                            article [
                                h3 'Signatures';
                                p 'The signature syntax simplifies function definitions with clear parameter handling and built-in type checks';
                                p 'See if you can spot positional (@) and named (%) args, optonal(?) [and mandatory(!)] args, slurpy parameters (*), slips (|), type defined-ness (:D), type coercion (()), return types (-->) and aliases (:f)';
                                note 'finely tuned interfaces';
                            ];
                            article [
                                hilite q:to/END/;
                                    sub outer(*@a, *%h) {
                                        inner(|@a, |%h);
                                    }

                                    sub inner(Int:D $x=0, Num(Rat) $y?, Bool :f(:$flag) --> Str) {
                                        "$x, $y, flag is $flag";
                                    }

                                    say outer(1, 0.1, :f);    #  1, 0.1, flag is True
                                    END
                                ];
                        ];

                    io => tab
                        vignette [
                            article [
                                h3 'File IO';
                                p 'Changes the first occurrence of "Hello" to "Hi" in the file.';
                                p [code '.IO.lines'; ' and '; code '.IO.words'; ' return a list of the file lines or words.'];
                                note 'well designed abstractions';
                            ];
                            article [
                                hilite q:to/END/;
                                    my $content = "example.txt".IO.slurp;       # Read file

                                    $content ~~ s/Hello/Hi/;                    # Modify content

                                    spurt $filename, $content;                  # Write back to file
                                    END
                                ];
                        ];

                ];

                div :align<center>, [
                    spacer;
                    h5 "… uniquely powerful: Unicode Regexs, Hyper Operators, Feed Operators, Rationals, Sets & Junctions, Smartmatching …";
                ];

                tabs [
                    unicode-regexs => tab
                        vignette :direction<rtl>, [
                            article [
                                h3 'Unicode Regular Expressions';
                                p  'Arguably the most powerful Unicode-aware regex engine available, especially for complex text processing. It shines in tasks where precision and multilingual support are essential e.g. with Grapheme and Diacritic handling.';
                                note 'unicode centric text handling';
                            ];
                            article [
                                hilite q:to/END/;
                                    say "Cool😎" ~~ /<:Letter>* <:Block("Emoticons")>/; # ｢Cool😎｣
                                    say "Cześć" ~~ m:ignoremark/ Czesc /;               # ｢Cześć｣
                                    say "WEIẞE" ~~ m:ignorecase/ weisse /;              # ｢WEIẞE｣
                                    say "หนูแฮมสเตอร์" ~~ /<:Letter>+/;     # ｢หนูแฮมสเตอร์｣ thehamster
                                    END
                            ];
                        ];

                    hyper-operators => tab
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

                    feed-operators => tab
                        vignette :direction<rtl>, [
                            article [
                                h3 'Feed Operators';
                                ul [
                                    li( code '(1..5)'; 'creates a Range.' );
                                    li( code 'map'; 'doubles each value.' );
                                    li( code 'grep'; 'filters value greater than 5.' );
                                ];
                                note 'function pipelines';
                            ];
                            article [
                                hilite q:to/END/;
                                    # function pipeline style
                                    (1..5)
                                        ==> map { $_ * 2 }
                                        ==> grep { $_ > 5 }   # (6 8 10)

                                    # OO method chain style
                                    (1..5)
                                        .map( * * 2)
                                        .grep( * > 5)         # (6 8 10)
                                    END
                                ];
                        ];

                    rational-numerics => tab
                        vignette :direction<rtl>, [
                            article [
                                h3 'Rational Numerics';
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

                    sets-junctions => tab
                        vignette :direction<rtl>, [
                            article [
                                h3 'Sets & Junctions';
                                p 'Set, Bag and Mix come with all the set operators: ∪ ∩ ∆ ⊖ ∖ ∈ ∉ ⊆ ⊂ ⊇ ⊃>.';
                                p 'Junctions (any, all, one, none) simplify multi-value tests for clean declarative logic.';
                                note 'more concise code';
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

                    smartmatching => tab
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
                ];
            ];

            div :align<center>, [
                spacer;
                h5 '… and a growing ecosystem: Localization, AI, Web, Database …';
            ];

            tabs [
                L10N => tab
                    vignette [
                        article [
                            h3 'Localization & Internationalization';
                            p 'This snippet is written using Japanese identifiers and strings, showcasing localization (l10n) and internationalization (i18n) features.';
                            note 'think global: act local';
                        ];
                        article [
                            hilite q:to/END/;
                                私の $数 = プロンプト "数を教えてください ";
                                言う "数は{$数}です。";

                                もしも $数 <= 10 {
                                    言う "数は10以下です";
                                } その他 {
                                    言う "数は10以上です";
                                }
                                END
                            ];
                    ];

                LLM => tab
                    vignette [
                        article [
                            h3 'LLM Functions';
                            p 'A suite of LLM and Data modules. Define functions with metadata to automate LLMs like ChatGPT. Connect user prompts to code, making AI-driven interfaces easier to build.';
                            note 'connect LLMs to code';
                        ];
                        article [
                            hilite q:to/END/;
                                use LLM::Functions;

                                my \recipe = llm-function(
                                    -> :$dish, :$cuisine { "Give a recipe for $dish in the $cuisine cuisine."},
                                    llm-evaluator => 'chatGPT'
                                );

                                say recipe(dish => 'salad', cuisine => 'Russian', max-tokens => 300);

                                # **Ingredients:**
                                #
                                # * 1 head of cabbage (chopped)
                                # * 2 carrots (grated)
                                # ...
                                END
                            ];
                    ];

                Cro => tab
                    vignette [
                        article [
                            h3 'Distributed Web Services';
                            p 'Starts an HTTP server on ', code 'localhost:10000';
                            p 'Responds to:';
                            ul [
                                li( code '/'; 'with '; em '"Hello Cro!".');
                                li( code '/hello'; ' with '; em '"Hello World!".');
                                li( code '/greet/<name>'; ' with a personalized greeting, e.g. '; em '"Hello, Alice!"');
                            ];
                            p 'Stops gracefully with Ctrl+C (', code 'SIGINT', ')';
                            note 'pluggable middleware and Cro template language';
                        ];
                        article [
                            hilite q:to/END/;
                                use Cro::HTTP::Router;
                                use Cro::HTTP::Server;

                                my $app = route {
                                    get -> {
                                        content 'text/plain', 'Hello, Cro!';
                                    }
                                    get -> 'hello' {
                                        content 'text/plain', 'Hello, World!';
                                    }
                                    get -> 'greet', $name {
                                        content 'text/plain', "Hello, $name!";
                                    }
                                };

                                my Cro::HTTP::Server $server .= new:
                                    :host<localhost>,
                                    :port(10000),
                                    :application($app);
                                $server.start;
                                react whenever signal(SIGINT) {
                                    $server.stop;
                                    exit;
                                }
                                END
                            ];
                    ];

                Red => tab
                    vignette [
                        article [
                            h3 'Object Relational Mapper (ORM)';
                            p 'Here we use Red to define a Person model with fields id, firstName, and lastName. It sets up a SQLite database, creates a corresponding table, and populates it with data from a json-data() function. The ^populate method takes model data from JSON and inserts it into the database.';
                            note 'declarative table definitions';
                        ];
                        article [
                            hilite q:to/END/;
                                use Red:api<2>;
                                red-defaults “SQLite”;

                                model Person {
                                    has Int      $.id         is serial;
                                    has Str      $.firstName  is column;
                                    has Str      $.lastName   is column;

                                    method ^populate($model) {
                                        for json-data() -> %record {
                                            $model.^create(|%record);
                                        }
                                    }
                                }

                                Person.^create-table;
                                Person.^populate;
                                END
                            ];
                    ];



            ];

            div :align<center>, [
                install;
                h5 '… check the docs for more on: Phasers, Delegation, Custom Operators, Meta Object Protocol, Traits …';
            ];
        ];
}
