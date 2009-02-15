package HeliosX::Metajob;

use 5.008;
use base qw(Helios::Job);
use strict;
use warnings;

use Helios::Error;


our $VERSION = '0.02_0771';

=head1 NAME

HeliosX::Metajob - Class to represent metajobs in Helios job processing system

=head1 SYNOPSIS

  use HeliosX::Metajob;
  blah blah blah

=head1 DESCRIPTION

This module is not yet complete, thus the documentation is not yet complete.

=head1 METHODS

=cut

=head2 parseArgs()

Helios::Metajob's parseArgs() only does metajobs.

#[] parse <jobs> section here?

=cut

sub parseArgs {
	my $self = shift;
	my $job = $self->job();
	my $args;
	my $parsedxml = $self->parseArgXML($job->arg()->[0]);
	# is this a metajob?
	if ( defined($parsedxml->{metajob}) ) {
		# this is a metajob, with full xml syntax (required for metajobs)
		$args = $parsedxml->{metajob};
	} else {
		# uh, the <metajob> tag is _required_
		throw Helios::Error::InvalidArg('<metajob> section not defined in args for jobid:'.$self->getJobid);
	}	
	$self->setArgs( $args );
	return $args;
}





=head1 SEE ALSO

L<HeliosX::MetajobService>

=head1 AUTHOR

Andrew Johnson, E<lt>lajandy@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Andrew Johnson

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.0 or,
at your option, any later version of Perl 5 you may have available.


=cut
