use HTML::TreeBuilder;
use Data::Dumper;
use 5.16.0;

my $h = HTML::TreeBuilder->new;
$in='c:\temp\example.html';
$h->parse_file($in);

my @headers = 
    map @{ $_->content },
    ($h->look_down( _tag => 'td', class => qr/HeaderTitle\b?/ ))
;

say Dumper \@headers;