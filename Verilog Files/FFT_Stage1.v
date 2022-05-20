`timescale 1ns / 1ps 

module FFT_Stage1 #(
    parameter
    DATA_WIDTH = 8 , 
    INTEGER = 4, 
	FRACTION = 4
) (


input clk,
input reset,
input PU_enable,
input  [2:0] sel,
    

input [DATA_WIDTH-1:0] in0_real,

input [DATA_WIDTH-1:0] in1_real,

input [DATA_WIDTH-1:0] in2_real,

input [DATA_WIDTH-1:0] in3_real,

input [DATA_WIDTH-1:0] in4_real,

input [DATA_WIDTH-1:0] in5_real,

input [DATA_WIDTH-1:0] in6_real,

input [DATA_WIDTH-1:0] in7_real,

input [DATA_WIDTH-1:0] in8_real,

input [DATA_WIDTH-1:0] in9_real,

input [DATA_WIDTH-1:0] in10_real,

input [DATA_WIDTH-1:0] in11_real,

input [DATA_WIDTH-1:0] in12_real,

input [DATA_WIDTH-1:0] in13_real,

input [DATA_WIDTH-1:0] in14_real,

input [DATA_WIDTH-1:0] in15_real,

input [DATA_WIDTH-1:0] in16_real,

input [DATA_WIDTH-1:0] in17_real,

input [DATA_WIDTH-1:0] in18_real,

input [DATA_WIDTH-1:0] in19_real,

input [DATA_WIDTH-1:0] in20_real,

input [DATA_WIDTH-1:0] in21_real,

input [DATA_WIDTH-1:0] in22_real,

input [DATA_WIDTH-1:0] in23_real,

input [DATA_WIDTH-1:0] in24_real,

input [DATA_WIDTH-1:0] in25_real,

input [DATA_WIDTH-1:0] in26_real,

input [DATA_WIDTH-1:0] in27_real,

input [DATA_WIDTH-1:0] in28_real,

input [DATA_WIDTH-1:0] in29_real,

input [DATA_WIDTH-1:0] in30_real,

input [DATA_WIDTH-1:0] in31_real,
/////////Constant/////////////////
input [DATA_WIDTH-1:0] Constant_W0,

/// Output////////////////////////
output [DATA_WIDTH-1:0] Stage1_out0_real,
output [DATA_WIDTH-1:0] Stage1_out0_imag,

output [DATA_WIDTH-1:0] Stage1_out1_real,
output [DATA_WIDTH-1:0] Stage1_out1_imag,

output [DATA_WIDTH-1:0] Stage1_out2_real,
output [DATA_WIDTH-1:0] Stage1_out2_imag,

output [DATA_WIDTH-1:0] Stage1_out3_real,
output [DATA_WIDTH-1:0] Stage1_out3_imag,

output [DATA_WIDTH-1:0] Stage1_out4_real,
output [DATA_WIDTH-1:0] Stage1_out4_imag,

output [DATA_WIDTH-1:0] Stage1_out5_real,
output [DATA_WIDTH-1:0] Stage1_out5_imag,

output [DATA_WIDTH-1:0] Stage1_out6_real,
output [DATA_WIDTH-1:0] Stage1_out6_imag,

output [DATA_WIDTH-1:0] Stage1_out7_real,
output [DATA_WIDTH-1:0] Stage1_out7_imag,

output [DATA_WIDTH-1:0] Stage1_out8_real,
output [DATA_WIDTH-1:0] Stage1_out8_imag,

output [DATA_WIDTH-1:0] Stage1_out9_real,
output [DATA_WIDTH-1:0] Stage1_out9_imag,

output [DATA_WIDTH-1:0] Stage1_out10_real,
output [DATA_WIDTH-1:0] Stage1_out10_imag,

output [DATA_WIDTH-1:0] Stage1_out11_real,
output [DATA_WIDTH-1:0] Stage1_out11_imag,

output [DATA_WIDTH-1:0] Stage1_out12_real,
output [DATA_WIDTH-1:0] Stage1_out12_imag,

output [DATA_WIDTH-1:0] Stage1_out13_real,
output [DATA_WIDTH-1:0] Stage1_out13_imag,

output [DATA_WIDTH-1:0] Stage1_out14_real,
output [DATA_WIDTH-1:0] Stage1_out14_imag,

output [DATA_WIDTH-1:0] Stage1_out15_real,
output [DATA_WIDTH-1:0] Stage1_out15_imag,

output [DATA_WIDTH-1:0] Stage1_out16_real,
output [DATA_WIDTH-1:0] Stage1_out16_imag,

output [DATA_WIDTH-1:0] Stage1_out17_real,
output [DATA_WIDTH-1:0] Stage1_out17_imag,

output [DATA_WIDTH-1:0] Stage1_out18_real,
output [DATA_WIDTH-1:0] Stage1_out18_imag,

output [DATA_WIDTH-1:0] Stage1_out19_real,
output [DATA_WIDTH-1:0] Stage1_out19_imag,

output [DATA_WIDTH-1:0] Stage1_out20_real,
output [DATA_WIDTH-1:0] Stage1_out20_imag,

output [DATA_WIDTH-1:0] Stage1_out21_real,
output [DATA_WIDTH-1:0] Stage1_out21_imag,

output [DATA_WIDTH-1:0] Stage1_out22_real,
output [DATA_WIDTH-1:0] Stage1_out22_imag,

output [DATA_WIDTH-1:0] Stage1_out23_real,
output [DATA_WIDTH-1:0] Stage1_out23_imag,

output [DATA_WIDTH-1:0] Stage1_out24_real,
output [DATA_WIDTH-1:0] Stage1_out24_imag,

output [DATA_WIDTH-1:0] Stage1_out25_real,
output [DATA_WIDTH-1:0] Stage1_out25_imag,

output [DATA_WIDTH-1:0] Stage1_out26_real,
output [DATA_WIDTH-1:0] Stage1_out26_imag,

output [DATA_WIDTH-1:0] Stage1_out27_real,
output [DATA_WIDTH-1:0] Stage1_out27_imag,

output [DATA_WIDTH-1:0] Stage1_out28_real,
output [DATA_WIDTH-1:0] Stage1_out28_imag,

output [DATA_WIDTH-1:0] Stage1_out29_real,
output [DATA_WIDTH-1:0] Stage1_out29_imag,

output [DATA_WIDTH-1:0] Stage1_out30_real,
output [DATA_WIDTH-1:0] Stage1_out30_imag,

output [DATA_WIDTH-1:0] Stage1_out31_real,
output [DATA_WIDTH-1:0] Stage1_out31_imag

);
    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit0 (
	.in1_real(in0_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in16_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out0_real),
	.out1_imag(Stage1_out0_imag),
	.out2_real(Stage1_out1_real),
	.out2_imag(Stage1_out1_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit1 (
	.in1_real(in1_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in17_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out16_real),
	.out1_imag(Stage1_out16_imag),
	.out2_real(Stage1_out17_real),
	.out2_imag(Stage1_out17_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit2 (
	.in1_real(in2_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in18_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out8_real),
	.out1_imag(Stage1_out8_imag),
	.out2_real(Stage1_out9_real),
	.out2_imag(Stage1_out9_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit3 (
	.in1_real(in3_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in19_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out24_real),
	.out1_imag(Stage1_out24_imag),
	.out2_real(Stage1_out25_real),
	.out2_imag(Stage1_out25_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit4 (
	.in1_real(in4_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in20_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out4_real),
	.out1_imag(Stage1_out4_imag),
	.out2_real(Stage1_out5_real),
	.out2_imag(Stage1_out5_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit5 (
	.in1_real(in5_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in21_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out20_real),
	.out1_imag(Stage1_out20_imag),
	.out2_real(Stage1_out21_real),
	.out2_imag(Stage1_out21_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit6 (
	.in1_real(in6_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in22_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out12_real),
	.out1_imag(Stage1_out12_imag),
	.out2_real(Stage1_out13_real),
	.out2_imag(Stage1_out13_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit7 (
	.in1_real(in7_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in23_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out28_real),
	.out1_imag(Stage1_out28_imag),
	.out2_real(Stage1_out29_real),
	.out2_imag(Stage1_out29_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit8 (
	.in1_real(in8_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in24_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out2_real),
	.out1_imag(Stage1_out2_imag),
	.out2_real(Stage1_out3_real),
	.out2_imag(Stage1_out3_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit9 (
	.in1_real(in9_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in25_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out18_real),
	.out1_imag(Stage1_out18_imag),
	.out2_real(Stage1_out19_real),
	.out2_imag(Stage1_out19_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit10 (
	.in1_real(in10_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in26_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out10_real),
	.out1_imag(Stage1_out10_imag),
	.out2_real(Stage1_out11_real),
	.out2_imag(Stage1_out11_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit11 (
	.in1_real(in11_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in27_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out26_real),
	.out1_imag(Stage1_out26_imag),
	.out2_real(Stage1_out27_real),
	.out2_imag(Stage1_out27_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit12 (
	.in1_real(in12_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in28_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out6_real),
	.out1_imag(Stage1_out6_imag),
	.out2_real(Stage1_out7_real),
	.out2_imag(Stage1_out7_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit13 (
	.in1_real(in13_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in29_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out22_real),
	.out1_imag(Stage1_out22_imag),
	.out2_real(Stage1_out23_real),
	.out2_imag(Stage1_out23_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit14 (
	.in1_real(in14_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in30_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out14_real),
	.out1_imag(Stage1_out14_imag),
	.out2_real(Stage1_out15_real),
	.out2_imag(Stage1_out15_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit15 (
	.in1_real(in15_real),
	.in1_imag({DATA_WIDTH{1'b0}}),
	.in2_real(in31_real),
	.in2_imag({DATA_WIDTH{1'b0}}),
	.constant_real(Constant_W0),
	.constant_imag({DATA_WIDTH{1'b0}}),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage1_out30_real),
	.out1_imag(Stage1_out30_imag),
	.out2_real(Stage1_out31_real),
	.out2_imag(Stage1_out31_imag)
);



endmodule