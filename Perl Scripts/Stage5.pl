use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


my $File = "Stage5" .".txt";

open my $fh, '>', $File
  or die "Can't open file : $!";
my $i = 0;
my $j = 0;
my $k = 0;
my $y = 0;
for($y=0; $y<16 ;$y = $y +1){
$j = $i + 16;
$k = $y; 

print $fh <<"DONATE";
    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit$y (
	.in1_real(Stage4_out$i\_real),
	.in1_imag(Stage4_out$i\_imag),
	.in2_real(Stage4_out$j\_real),
	.in2_imag(Stage4_out$j\_imag),
	.constant_real(Constant_W$k\_real),
	.constant_imag(Constant_W$k\_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage5_out$i\_real),
	.out1_imag(Stage5_out$i\_imag),
	.out2_real(Stage5_out$j\_real),
	.out2_imag(Stage5_out$j\_imag)
);



DONATE

$i = $i+1;

}
