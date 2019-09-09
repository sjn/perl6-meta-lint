use v6;
use JSON::Tiny::Actions;

class META::Lint::Actions is JSON::Tiny::Actions {
    method pair($/) {
        make $<string>.made => $<value>.made;
    }

}

# vim: ft=perl6
