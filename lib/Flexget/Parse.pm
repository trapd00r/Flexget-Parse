package Flexget::Parse;
require Exporter;
@ISA = qw(Exporter);
#@EXPORT_OK = qw(flexparse);
our @EXPORT = qw(flexparse);

use strict;

sub flexparse {
  my @files = @_;
  return(undef) if(!@files);

  my @parsed;
  for my $file(@files) {
    next unless $file =~ m/Downloading: /;
    $file =~ s/(?:\w+\s+){2}\w+: //;
    push(@parsed, $file);
  }
  return(@parsed);
}

=head1 NAME

  Flexget::Parse - Parse the flexget log format for downloaded files

=head1 SYNOPSIS

  use Flexget::Parse;

  my $log = shift // "$ENV{HOME}/.flexget.log";
  open(my $fh, '<', $log) or die("Could not open $log: $!");
  chomp(my @records = <$fh>);
  close($fh);

  my @parsed = flexparse(@content);

=head2 EXPORTS

flexparse() is exported by default

=head1 AUTHOR

Written by Magnus Woldrich

=head1 REPORTING BUGS

Report bugs to trapd00r@trapd00r.se

=cut
