#!/usr/bin/env perl
#
use Modern::Perl;
use WWW::Mechanize;
use WWW::Mechanize::PhantomJS;
use Mojo::DOM;
use URI;
use URI::QueryParam;
use File::Slurp::Tiny qw(read_file write_file);
use JSON;
use Data::Dumper;

my $term           = q{65277-42-1};
my $url            = q{http://www.sigmaaldrich.com/catalog/search};
my $user_agent     = q{Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36};
my $js_func_regexp = qr{^javascript:submitMSDSSearchFromSearchResults\(([^)]+)\);};
my @js_func_params = (qw(country language productNumber brand));
my $css_msds_link  = q{a.msdsBulletPoint};
my $form_name      = q{MSDSSearchFromSearchResults};

my $params = {
  interface => 'All',
  N         => '0',
  lang      => 'en',
  region    => 'USA',
  focus     => 'product',
  mode      => 'mode matchall',
  term      => $term,
};

my $uri = URI->new($url);
$uri->query_form($params);
my $mech = WWW::Mechanize::PhantomJS->new(agent => $user_agent, cookie_file => q{cookie_jar});

$mech->get($uri);
$mech->click({ xpath => '//a[@class="msdsBulletPoint"]' });
$mech->expand_frames();

my @content   = $mech->by_id('msdsContentDiv', all => 1);
my $dom       = Mojo::DOM->new($content[1]->get_attribute('innerHTML'));
my $frame_src = $dom->at('#msdsPageFrame')->attr('src');

$uri->path($frame_src);
$uri->query_form({});

my $har = from_json(read_file(qq{$ENV{HOME}/Downloads/www.sigmaaldrich.com.har}));
for my $header (@{$har->{log}->{entries}->[0]->{request}->{headers}}) {
  $mech->add_header($header);
}

$mech->get($uri);

print Dumper $mech->content;

__END__
my $search_results = get_search_results();
print Dumper $search_results;

get_msds($search_results);

sub get_search_results {
  my @results = ();
  my $mech    = get_mech();
  my $dom     = Mojo::DOM->new($mech->content);

  $dom->find($css_msds_link)->each(
    sub {
      if ($_->attr('href') =~ /$js_func_regexp/) {
        (my $args = $1) =~ s/\'//g;
        my %params = ();
        @params{@js_func_params} = split(/, /, $args);
        push @results, \%params;
      }
    }
  );

  return \@results;
}

sub get_msds {
  my ($results) = @_;

  for my $result (@{$results}) {
    my $mech = get_mech();

    $result->{PageToGoToURL} = $uri->as_string;
    $result->{requestMsds}   = 'true';
    $result->{'btnGo1.x'}    = 1;

    $mech->submit_form(
      form_name => $form_name,
      fields    => $result,
    );

    print Dumper $mech->content;

    last;
  }
}
