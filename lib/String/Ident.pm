package String::Ident;

use warnings;
use strict;
use utf8;

our $VERSION = 0.01;

use Text::Unidecode 'unidecode';

sub cleanup {
    my ($self, $text) = @_;

    $text = '' unless defined($text);
    $text = unidecode($text);
    $text =~ s/[^-A-Za-z0-9]/-/g;
    $text =~ s/--+/-/g;
    $text =~ s/-$//g;
    $text =~ s/^-//g;
    $text = substr($text,0,30);
    while (length($text) < 4) {
        $text .= chr(ord('a') + rand(ord('z') - ord('a') + 1));
    }

    return $text;
}

1;


__END__

=encoding utf8

=head1 NAME

String::Ident - clean-up string to be used as identifier and in URLs

=head1 SYNOPSIS

    my $ident = String::Ident->cleanup('Hello wœrlď!')
    is($ident,'Hello-woerld')

=head1 DESCRIPTION

clean-up string to be used as identifier and in URLs

=head1 METHODS

=head2 cleanup()

    # replace unicode by ascii
    $text = unidecode($text);

    # replace anything basides numbers, letters and dash by dash
    $text =~ s/[^-A-Za-z0-9]/-/g;

    # one dash is enough
    $text =~ s/--+/-/g;

    # no need to start or end with a dash
    $text =~ s/-$//g;
    $text =~ s/^-//g;

    # maximum length
    $text = substr($text,0,30);

    # min length is set to 4 filled in by random letters

=head1 AUTHOR

Jozef Kutej, C<< <jkutej at cpan.org> >>

=head1 CONTRIBUTORS
 
The following people have contributed to the File::is by committing their
code, sending patches, reporting bugs, asking questions, suggesting useful
advises, nitpicking, chatting on IRC or commenting on my blog (in no particular
order):

    Andrea Pavlovic

=head1 LICENSE AND COPYRIGHT

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

