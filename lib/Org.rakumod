unit class Org;

use Air::Functional :BASE;
use Air::Base;

use Org::Home;
use Org::Install;


my @tools = [Analytics.new: :provider(Umami), :key<FIXME>,];  # fixme


my &basepage = &page.assuming(
    title       => 'raku®',
    description => 'The raku® programming language.',
    footer      =>  footer [
                        hr;
                        p safe Q|
                            Hypered with <a href="https://htmx.org" target="_blank">htmx</a>.
                            Aloft on <a href="https://harcstack.org" target="_blank"><b>&Aring;ir</b></a>.
                            Constructed in <a href="https://cro.raku.org" target="_blank">cro</a>.
                            Written in <a href="https://raku.org" target="_blank">raku</a>.
                            &nbsp;&amp;&nbsp;
                            Styled by <a href="https://picocss.com" target="_blank">picocss</a>.
                        |;
                        p safe 'The raku® Programming Language';
                    ],
);

my &shadow = &background.assuming
    :url<https://upload.wikimedia.org/wikipedia/commons/f/fd/Butterfly_bottom_PSF_transparent.gif>;


my Page $home    = home-page    &basepage, &shadow;
my Page $install = install-page &basepage, &shadow;

my Nav $nav =
    nav
        logo => (
            span a :href</>, :target<_self>, :style("display: flex; align-items: center; gap: 0.5rem; text-decoration: none;"),
            [ img :src</img/camelia-logo.png>, :width<60px>; p :style("margin:0"), "raku®" ]
        ),
        :widgets[lightdark],
        [
            github    => (external :href<https://github.com/Raku>),
            docs      => (external :href<https://docs.raku.org>),
            ecosystem => (external :href<https://raku.land>),
            guide     => (external :href<https://raku.guide>),
            weekly    => (external :href<https://rakudoweekly.blog>),
            chat      => (external :href<https://discord.gg/VzYpdQ6>),
            install   => $install,
        ];


my Page @pages = [$home, $install];
{ .nav = $nav } for @pages;

sub SITE is export {
    site
        :@tools,
        :register[Hilite.new, Tabs.new, Background.new, Lightbox.new],
        :theme-color<pink>,
        :bold-color<springgreen>,
        :@pages,
}



=begin pod

=head1 AUTHOR

librasteve <librasteve@furnival.net>

=head1 COPYRIGHT AND LICENSE

Copyright 2025 librasteve

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
