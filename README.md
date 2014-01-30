# NAME

MouseX::Types::Instant - It's new $module

# SYNOPSIS

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

# DESCRIPTION

MouseX::Types::Instant is ...

# LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

karupanerura <karupa@cpan.org>
