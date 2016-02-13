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
    my $result = lint 'Obviously broken stuff';
    nok $result, 'Linter returns False for broken JSON';

    $result = lint '{}';
    ok $result, 'Linter returns True for {}';

    $result = lint '[]';
    ok $result, 'Linter returns True for []';

    $result = lint '42';
    ok $result, 'Linter returns True for 42';

    $result = lint 'true';
    ok $result, 'Linter returns True for true';

    $result = lint 'false';
    ok $result, 'Linter returns True for false';

    $result = lint 'null';
    ok $result, 'Linter returns True for null';

    $result = lint '{ "key" : "value" }';
    ok $result, 'Linter returns True for a k/v pair';

}, "Parse supplied minimal JSON";

subtest {
    my $result = lint 't/meta/json-META.info'.IO.slurp;
    ok $result, 'Linter accepts moritz/json/META.info';

}, "Parse JSON files";

done-testing;

# vim: ft=perl6
