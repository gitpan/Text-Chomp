use Test::More 'no_plan';
use Text::Chomp;

use constant TEST => "Test";

my $crlf = "Test\r\n";
my $lf = "Test\n";
my $cr = "Test\r";
my $ff = "Test\f";
my $uni_ls = "Test\x{2028}";
my $uni_ps = "Test\x{2029}";

is(tchomp($crlf), TEST, "Test for CRLF");
is(tchomp($crlf), TEST, "Test for LF");
is(tchomp($crlf), TEST, "Test for CR");
is(tchomp($crlf), TEST, "Test for FF");
is(tchomp($crlf), TEST, "Test for Unicode Line Separator");
is(tchomp($crlf), TEST, "Test for Unicode Page Separator");
