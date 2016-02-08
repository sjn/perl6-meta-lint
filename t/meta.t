use v6;
use Test;
use lib 'lib';
use META::Lint;

subtest {
    my $p = META::Lint::Grammar.new;
    isa-ok $p, 'META::Lint::Grammar';
}, "META::Lint::Grammar loads";

subtest {
    my $p = META::Lint::Actions.new;
    isa-ok $p, 'META::Lint::Actions';
}, "META::Lint::Actions loads";

subtest {
    my $linter = lint 'Broken stuff';
    is $linter, False, 'Linter returns False for broken JSON';

    $linter = lint '{}';
    is $linter, True, 'Linter returns True for {}';

    $linter = lint '[]';
    is $linter, True, 'Linter returns True for []';

    $linter = lint '42';
    is $linter, True, 'Linter returns True for 42';

    $linter = lint 'true';
    is $linter, True, 'Linter returns True for true';

    $linter = lint 'false';
    is $linter, True, 'Linter returns True for false';

    $linter = lint 'null';
    is $linter, True, 'Linter returns True for null';

    $linter = lint '{ "key" : "value" }';
    is $linter, True, 'Linter returns True for a k/v pair';
}, "Parse supplied minimal JSON";

done-testing;

# vim: ft=perl6
