package Foo;
use Mouse;

use MouseX::Types::Instant qw/type subtype/;

# use the exported constants as type names
has 'bar',
    isa    => subtype(Int => sub { $_ > 0 }),
    is     => 'rw';
has 'baz',
    isa    => type { $_ =~ /baz/ },
    is     => 'rw';

package main;
use strict;
use Test::More;

my $foo = Foo->new;
eval { $foo->baz("baz") };
ok !$@, "lived: baz = 'baz';" or diag $@;
eval { $foo->baz("baa") };
ok  $@, "died:  baz = 'baa'; error: $@";
eval { $foo->baz({}) };
ok  $@, "died:  baz = {}; error: $@";
eval { $foo->bar(1) };
ok !$@, "lived: bar = 1;" or diag $@;
eval { $foo->bar(0) };
ok  $@, "died: bar = 0; error: $@";
eval { $foo->bar({}) };
ok  $@, "died: bar = {}; error: $@";

done_testing;

