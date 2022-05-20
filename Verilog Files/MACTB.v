
`timescale 1ns / 1ps

module MACTB;
localparam  DATA_WIDTH = 10;
reg  [DATA_WIDTH-1:0] in1_real;
    reg  [DATA_WIDTH-1:0] in1_imag;
        reg  [DATA_WIDTH-1:0] in2_real;
    reg  [DATA_WIDTH-1:0] in2_imag;
        reg  [DATA_WIDTH-1:0] constant_real;
    reg  [DATA_WIDTH-1:0] constant_imag;
    reg [2:0] sel;
    reg clk;
    reg reset;
    wire  [DATA_WIDTH-1:0] out1_real;
    wire  [DATA_WIDTH-1:0] out1_imag;
         wire  [DATA_WIDTH-1:0] out2_real;
    wire  [DATA_WIDTH-1:0] out2_imag;


MAC  #( .DATA_WIDTH(10),.INTEGER(6),.FRACTION(4) ) UUT (
.in1_real(in1_real),
.in1_imag(in1_imag),
.in2_real(in2_real),
.in2_imag(in2_imag),
.constant_real(constant_real),
.constant_imag(constant_imag),
.sel(sel),
.clk(clk),
.reset(reset),
.out1_real(out1_real),
.out1_imag(out1_imag),
.out2_real(out2_real),
.out2_imag(out2_imag)
);
parameter CLK_PERIOD =20;
always #(CLK_PERIOD/2) clk = ~clk ;
initial begin

reset = 1   ;
clk = 0;
#20;
reset = 0  ;



in1_real =  10'b0000010000  ;
in1_imag =  10'b1110010000  ;
in2_real =  10'b0000010000  ;
in2_imag =  10'b0000010000  ;
constant_real = 10'b0000010000    ;
constant_imag =   10'b0000010000 ;
sel =   3'b000 ;
#20;
sel =   3'b001 ;
#20;
sel =   3'b010 ;
#20;
sel =   3'b011 ;
#20;
sel =   3'b100 ;

#500;
$finish;
end
endmodule
