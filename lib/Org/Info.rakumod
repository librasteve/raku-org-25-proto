unit class Info;

use Air::Functional :BASE;
use Air::Base;

sub info-page(&basepage, &shadow) is export {
    basepage #:REFRESH(10),
        main [
            shadow;
            div :align<center>, :style('position: relative; padding: 20px;'), [
                h1 'Raku Information';
            ];
            dashboard [
                box :order(1), h2 'Analytics';
                box :order(2), h2 'Traffic';
                box :order(3), h2 'Comments';
                box :order(8), h2 'Quick Draft';
                box :order(5), h2 'Recent Activity';
                box :order(6), h2 'Site Overview';
                box :order(7), h2 'News';
            ];
        ];
}



