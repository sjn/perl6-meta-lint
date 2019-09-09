unit module META::Lint;

use v6.d;

use META::Lint::Grammar;
use META::Lint::Actions;

proto lint ($) is export returns Bool { * };

multi lint (Str:D $json) {
    my $a = META::Lint::Actions.new;
    my $metafile = META::Lint::Grammar.parse( $json, :actions($a));

    return $metafile;
}

multi lint (IO::Path $file) {
    my $json = $file.slurp;
    lint $json;
}



# vim: ft=perl6
