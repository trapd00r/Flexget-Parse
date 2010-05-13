package Flexget::Parse;
require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw(flexparse);

sub flexparse {
  my @files = @_;
  my @parsed;
  foreach my $file(@files) {
    next unless $file =~ m/Downloading: /;
    $file =~ s/(?:\w+\s+){2}\w+: //;
    push(@parsed, $file);
  }
  return @parsed;
}
