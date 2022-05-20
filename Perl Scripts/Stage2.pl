use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


my $File = "Stage2" .".txt";

open my $fh, '>', $File
  or die "Can't open file : $!";
my $i = 0;
my $j = 0;
my $k = 0;
my $y = 0;
for($y=0;$y<16 ;$y = $y +1){
$j = $i + 2;
$k = $i + 1; 
if ($i % 2){
    $k = 8;
}else {
    $k = 0;
}
print $fh <<"DONATE";
    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit$y (
	.in1_real(Stage1_out$i\_real),
	.in1_imag(Stage1_out$i\_imag),
	.in2_real(Stage1_out$j\_real),
	.in2_imag(Stage1_out$j\_imag),
	.constant_real(Constant_W$k\_real),
	.constant_imag(Constant_W$k\_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out$i\_real),
	.out1_imag(Stage2_out$i\_imag),
	.out2_real(Stage2_out$j\_real),
	.out2_imag(Stage2_out$j\_imag)
);



DONATE
if($i % 2){
    $i = $i+3;
}else {
    $i = $i+1;
}
}
