package Text::Chomp;

use warnings;
use strict;


our $VERSION = '0.01';

my %symbols = map {$_ => 1} qw /tchomp/;

sub import {
    my $class  = shift;
    my $caller = caller;
	 
    foreach my $name (@_ ? @_ : keys %symbols) {
        die "'$name' is not exported.\n" unless $symbols {$name};
	no strict 'refs';
	*{$caller . "::$name"} = \&{$class . "::$name"}
    }
}

sub tchomp {
    my $text = shift;
    $text =~ s/^(.*?)(?:\x0D\x0A|\x0A|\x0D|\x0C|\x{2028}|\x{2029})/$1/s;
    return $text;
}

__END__

=head1 NAME

Text::Chomp - a module implementing a portable chomp.

=head1 SYNOPSIS

    use strict;
    use warnings;
    use Text::Chomp;

    open FILE, "file.dat"
        or die "Unable to open file:  $!";

    while (<FILE>) {
        # Strip off any end of line character, not just $/
        my $line = tchomp $_;
	...
    }

    close FILE;

=head1 DESCRIPTION

Text::Chomp implements a single function, tchomp, which will remove 
all known (by me, at least) line separators.  chomp() works 
only on the value in $/, which can be difficult if working in 
multi-platform environments.

=head1 EXPORTS

tchomp() is the only function exported.  Attempts to export other functions
will cause the module to fail to load.

=head1 FUNCTIONS

=head2 tchomp $text

This function removes the end of line character from a line of text and 
returns the text.  Line separators currently handled include:

=over 8

=item \n - line feed

=item \r\n - carriage return/line feed

=item \r - carriage return

=item \f - form feed

=item \x{2028} - Unicode line separator

=item \x{2029} - Unicode page separator

=back

=head1 BUGS

Please report any bugs or feature requests to
C<bug-text-chomp@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically
be notified of progress on your bug as I make changes.

=head1 ACKNOWLEDGEMENTS

Original inspiration came from an ancient perlbug 
L<http://rt.perl.org/rt3/Ticket/Display.html?id=1807>.  #p5p provided some
additional ideas regarding the Unicode (and a suggested name of Ch::omp).


=head1 COPYRIGHT & LICENSE

Copyright 2004 Steve Peters, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Text::Chomp
