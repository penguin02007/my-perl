#!/usr/bin/env perl 
use DBI;

#
# Template to create database connection to mssql with CentOS
# 
# Create /etc/odbc.ini
# yum install perl-DBI freetds unixODBC unixODBC-devel
#
# Usage:	fetchmssql.pl $user $pass

my $dsn = 'dbi:ODBC:MSSQL';
my $user = @ARGV[0];
my $pass = @ARGV[1];

my $dbh = DBI->connect($dsn, $user, $pass)
	or die "Cant connect to $dsn: $DBI::errstr";

if (defined($dbh))
{

	my $sql1 = "select name from sys.databases";

	# Prepare SQL statement
	my $prepare = $dbh->prepare($sql1)
		or die "Cant prepare statement: $DBI::errstr";
	
	$prepare->execute();
	
	print "$prepare->{NAME}->[0]\n";
	while ( my @row = $prepare->fetchrow_array ) {
	print "@row\n";
	}
	
	$dbh->disconnect;
} else {
	print "Error";
}
