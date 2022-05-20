use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";


my $File = "Stage1" .".txt";

open my $fh, '>', $File
  or die "Can't open file : $!";
my $i = 0;
my $j = 0;
my $k = 0;
for($i=0;$i<16 ;$i=$i+1){
$j = $i + 16;
$k = $i + 1; 
print $fh <<"DONATE";
    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit$i (
	.in1_real(in$i\_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in$j\_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out$i\_real),
	.out1_imag(Stage1_out$i\_imag),
	.out2_real(Stage1_out$k\_real),
	.out2_imag(Stage1_out$k\_imag)
);



DONATE
}
