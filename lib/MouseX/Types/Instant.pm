package MouseX::Types::Instant;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

use Mouse::Exporter;
use Mouse::Util::TypeConstraints ();
Mouse::Exporter->setup_import_methods(as_is => [qw(type subtype)]);

sub type (&) {## no critic
    my $code = shift;
    return Mouse::Util::TypeConstraints::type(+{
        where => $code,
    });
}

sub subtype ($&) {## no critic
    my ($super_type, $code) = @_;
    return Mouse::Util::TypeConstraints::subtype(+{
        as    => $super_type,
        where => $code,
    });
}

1;
__END__

=encoding utf-8

=head1 NAME

MouseX::Types::Instant - It's new $module

=head1 SYNOPSIS

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

=head1 DESCRIPTION

MouseX::Types::Instant is ...

=head1 LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

karupanerura E<lt>karupa@cpan.orgE<gt>

=cut

