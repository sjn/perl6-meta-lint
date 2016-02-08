unit module META::Lint;
use v6;

use META::Lint::Grammar;
use META::Lint::Actions;

proto lint ($) is export returns Bool { * };

multi lint (IO::Path $file) {
    my $json = $file.slurp;
    my $a = META::Lint::Actions.new;
    my $result = META::Lint::Grammar.parse( $json, :actions($a));
    $result;
}

multi lint (Str:D $json) {
    my $a = META::Lint::Actions.new;
    my $result = META::Lint::Grammar.parse( $json, :actions($a));
    $result;
}

# vim: ft=perl6
