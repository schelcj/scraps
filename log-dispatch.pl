#!/usr/bin/env perl

package My::Log::Dispatch::DBI {
  use base qw(Log::Dispatch::DBI);

  sub create_statement {
    my $self = shift;
    return $self->{dbh}->prepare(<<"SQL");
insert into $self->{table} (level, message, foo) values (?, ?, ?)
SQL
;
  }

  sub log_message {
    my $self = shift;
    my %params = @_;
    $self->{sth}->execute(@params{qw(level message foo)});
  }
};

use Modern::Perl;
use Log::Dispatch;
use Log::Dispatch::Screen;

my $log = Log::Dispatch->new();

$log->add(
  Log::Dispatch::Screen->new(
    stdout    => 1,
    stderr    => 0,
    min_level => 'debug',
    max_level => 'warning',
  )
);

$log->add(
  Log::Dispatch::Screen->new(
    stdout    => 0,
    stderr    => 1,
    min_level => 'error',
    max_level => 'emergency',
  )
);

$log->add(
  My::Log::Dispatch::DBI->new(
    datasource => 'dbi:SQLite:dbname=log-dispatch.db',
    table      => 'logs',
    min_level  => 'debug',
  )
);

for (qw(debug info notice warning error critical alert emergency)) {
  #$log->$_(qq{$_ messages}, 'hello');
  $log->log(level => $_, message => qq{$_ messages}, foo => 'hello world');
}
