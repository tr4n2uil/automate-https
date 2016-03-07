push (@INC,'pwd');
use Selenium::Remote::Connection;
use Selenium::Remote::Driver;

# Fast Selenium
use LWP::UserAgent;
use LWP::ConnCache;
my $ua = LWP::UserAgent->new();
$ua->conn_cache(LWP::ConnCache->new);

my $repeat = $ENV{'REPEAT'} ? $ENV{'REPEAT'} : 50;

#Input capabilities
my $extraCaps = { 
  "browserstack.debug" => "true",
  "build" => "Perl https vs http",
  "name" => "https"
};

my $login = $ENV{'BROWSERSTACK_USER'};
my $key = $ENV{'BROWSERSTACK_ACCESS_KEY'};
my $host = "$login:$key\@hub.browserstack.com";

my $driver = new Selenium::Remote::Driver('remote_server_addr' => $host, 
  'port' => '443', 'extra_capabilities' => $extraCaps, 'ua' => $ua);

$driver->get('http://www.google.com');
$driver->find_element('q','name')->send_keys("BrowserStack");

for (my $i=0; $i <= $repeat; $i++) {
  print $driver->get_title();
}

$driver->quit();
