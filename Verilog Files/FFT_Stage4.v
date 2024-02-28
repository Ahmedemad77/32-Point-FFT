`timescale 1ns / 1ps 

module FFT_Stage4 #(
    parameter
    DATA_WIDTH = 8 , 
    INTEGER = 4, 
	FRACTION = 4
) (
    
input clk,
input reset,


input stage4_start, 
output stage4_Finish,

input [DATA_WIDTH-1:0] Stage3_out0_real,
input [DATA_WIDTH-1:0] Stage3_out0_imag,

input [DATA_WIDTH-1:0] Stage3_out1_real,
input [DATA_WIDTH-1:0] Stage3_out1_imag,

input [DATA_WIDTH-1:0] Stage3_out2_real,
input [DATA_WIDTH-1:0] Stage3_out2_imag,

input [DATA_WIDTH-1:0] Stage3_out3_real,
input [DATA_WIDTH-1:0] Stage3_out3_imag,

input [DATA_WIDTH-1:0] Stage3_out4_real,
input [DATA_WIDTH-1:0] Stage3_out4_imag,

input [DATA_WIDTH-1:0] Stage3_out5_real,
input [DATA_WIDTH-1:0] Stage3_out5_imag,

input [DATA_WIDTH-1:0] Stage3_out6_real,
input [DATA_WIDTH-1:0] Stage3_out6_imag,

input [DATA_WIDTH-1:0] Stage3_out7_real,
input [DATA_WIDTH-1:0] Stage3_out7_imag,

input [DATA_WIDTH-1:0] Stage3_out8_real,
input [DATA_WIDTH-1:0] Stage3_out8_imag,

input [DATA_WIDTH-1:0] Stage3_out9_real,
input [DATA_WIDTH-1:0] Stage3_out9_imag,

input [DATA_WIDTH-1:0] Stage3_out10_real,
input [DATA_WIDTH-1:0] Stage3_out10_imag,

input [DATA_WIDTH-1:0] Stage3_out11_real,
input [DATA_WIDTH-1:0] Stage3_out11_imag,

input [DATA_WIDTH-1:0] Stage3_out12_real,
input [DATA_WIDTH-1:0] Stage3_out12_imag,

input [DATA_WIDTH-1:0] Stage3_out13_real,
input [DATA_WIDTH-1:0] Stage3_out13_imag,

input [DATA_WIDTH-1:0] Stage3_out14_real,
input [DATA_WIDTH-1:0] Stage3_out14_imag,

input [DATA_WIDTH-1:0] Stage3_out15_real,
input [DATA_WIDTH-1:0] Stage3_out15_imag,

input [DATA_WIDTH-1:0] Stage3_out16_real,
input [DATA_WIDTH-1:0] Stage3_out16_imag,

input [DATA_WIDTH-1:0] Stage3_out17_real,
input [DATA_WIDTH-1:0] Stage3_out17_imag,

input [DATA_WIDTH-1:0] Stage3_out18_real,
input [DATA_WIDTH-1:0] Stage3_out18_imag,

input [DATA_WIDTH-1:0] Stage3_out19_real,
input [DATA_WIDTH-1:0] Stage3_out19_imag,

input [DATA_WIDTH-1:0] Stage3_out20_real,
input [DATA_WIDTH-1:0] Stage3_out20_imag,

input [DATA_WIDTH-1:0] Stage3_out21_real,
input [DATA_WIDTH-1:0] Stage3_out21_imag,

input [DATA_WIDTH-1:0] Stage3_out22_real,
input [DATA_WIDTH-1:0] Stage3_out22_imag,

input [DATA_WIDTH-1:0] Stage3_out23_real,
input [DATA_WIDTH-1:0] Stage3_out23_imag,

input [DATA_WIDTH-1:0] Stage3_out24_real,
input [DATA_WIDTH-1:0] Stage3_out24_imag,

input [DATA_WIDTH-1:0] Stage3_out25_real,
input [DATA_WIDTH-1:0] Stage3_out25_imag,

input [DATA_WIDTH-1:0] Stage3_out26_real,
input [DATA_WIDTH-1:0] Stage3_out26_imag,

input [DATA_WIDTH-1:0] Stage3_out27_real,
input [DATA_WIDTH-1:0] Stage3_out27_imag,

input [DATA_WIDTH-1:0] Stage3_out28_real,
input [DATA_WIDTH-1:0] Stage3_out28_imag,

input [DATA_WIDTH-1:0] Stage3_out29_real,
input [DATA_WIDTH-1:0] Stage3_out29_imag,

input [DATA_WIDTH-1:0] Stage3_out30_real,
input [DATA_WIDTH-1:0] Stage3_out30_imag,

input [DATA_WIDTH-1:0] Stage3_out31_real,
input [DATA_WIDTH-1:0] Stage3_out31_imag,

/// Constants///////////



input [DATA_WIDTH-1:0] Constant_W0_real,
input [DATA_WIDTH-1:0] Constant_W0_imag,

input [DATA_WIDTH-1:0] Constant_W2_real,
input [DATA_WIDTH-1:0] Constant_W2_imag,

input [DATA_WIDTH-1:0] Constant_W4_real,
input [DATA_WIDTH-1:0] Constant_W4_imag,

input [DATA_WIDTH-1:0] Constant_W6_real,
input [DATA_WIDTH-1:0] Constant_W6_imag,

input [DATA_WIDTH-1:0] Constant_W8_real,
input [DATA_WIDTH-1:0] Constant_W8_imag,

input [DATA_WIDTH-1:0] Constant_W10_real,
input [DATA_WIDTH-1:0] Constant_W10_imag,

input [DATA_WIDTH-1:0] Constant_W12_real,
input [DATA_WIDTH-1:0] Constant_W12_imag,

input [DATA_WIDTH-1:0] Constant_W14_real,
input [DATA_WIDTH-1:0] Constant_W14_imag,

/////////////////////////
output [DATA_WIDTH-1:0] Stage4_out0_real,
output [DATA_WIDTH-1:0] Stage4_out0_imag,

output [DATA_WIDTH-1:0] Stage4_out1_real,
output [DATA_WIDTH-1:0] Stage4_out1_imag,

output [DATA_WIDTH-1:0] Stage4_out2_real,
output [DATA_WIDTH-1:0] Stage4_out2_imag,

output [DATA_WIDTH-1:0] Stage4_out3_real,
output [DATA_WIDTH-1:0] Stage4_out3_imag,

output [DATA_WIDTH-1:0] Stage4_out4_real,
output [DATA_WIDTH-1:0] Stage4_out4_imag,

output [DATA_WIDTH-1:0] Stage4_out5_real,
output [DATA_WIDTH-1:0] Stage4_out5_imag,

output [DATA_WIDTH-1:0] Stage4_out6_real,
output [DATA_WIDTH-1:0] Stage4_out6_imag,

output [DATA_WIDTH-1:0] Stage4_out7_real,
output [DATA_WIDTH-1:0] Stage4_out7_imag,

output [DATA_WIDTH-1:0] Stage4_out8_real,
output [DATA_WIDTH-1:0] Stage4_out8_imag,

output [DATA_WIDTH-1:0] Stage4_out9_real,
output [DATA_WIDTH-1:0] Stage4_out9_imag,

output [DATA_WIDTH-1:0] Stage4_out10_real,
output [DATA_WIDTH-1:0] Stage4_out10_imag,

output [DATA_WIDTH-1:0] Stage4_out11_real,
output [DATA_WIDTH-1:0] Stage4_out11_imag,

output [DATA_WIDTH-1:0] Stage4_out12_real,
output [DATA_WIDTH-1:0] Stage4_out12_imag,

output [DATA_WIDTH-1:0] Stage4_out13_real,
output [DATA_WIDTH-1:0] Stage4_out13_imag,

output [DATA_WIDTH-1:0] Stage4_out14_real,
output [DATA_WIDTH-1:0] Stage4_out14_imag,

output [DATA_WIDTH-1:0] Stage4_out15_real,
output [DATA_WIDTH-1:0] Stage4_out15_imag,

output [DATA_WIDTH-1:0] Stage4_out16_real,
output [DATA_WIDTH-1:0] Stage4_out16_imag,

output [DATA_WIDTH-1:0] Stage4_out17_real,
output [DATA_WIDTH-1:0] Stage4_out17_imag,

output [DATA_WIDTH-1:0] Stage4_out18_real,
output [DATA_WIDTH-1:0] Stage4_out18_imag,

output [DATA_WIDTH-1:0] Stage4_out19_real,
output [DATA_WIDTH-1:0] Stage4_out19_imag,

output [DATA_WIDTH-1:0] Stage4_out20_real,
output [DATA_WIDTH-1:0] Stage4_out20_imag,

output [DATA_WIDTH-1:0] Stage4_out21_real,
output [DATA_WIDTH-1:0] Stage4_out21_imag,

output [DATA_WIDTH-1:0] Stage4_out22_real,
output [DATA_WIDTH-1:0] Stage4_out22_imag,

output [DATA_WIDTH-1:0] Stage4_out23_real,
output [DATA_WIDTH-1:0] Stage4_out23_imag,

output [DATA_WIDTH-1:0] Stage4_out24_real,
output [DATA_WIDTH-1:0] Stage4_out24_imag,

output [DATA_WIDTH-1:0] Stage4_out25_real,
output [DATA_WIDTH-1:0] Stage4_out25_imag,

output [DATA_WIDTH-1:0] Stage4_out26_real,
output [DATA_WIDTH-1:0] Stage4_out26_imag,

output [DATA_WIDTH-1:0] Stage4_out27_real,
output [DATA_WIDTH-1:0] Stage4_out27_imag,

output [DATA_WIDTH-1:0] Stage4_out28_real,
output [DATA_WIDTH-1:0] Stage4_out28_imag,

output [DATA_WIDTH-1:0] Stage4_out29_real,
output [DATA_WIDTH-1:0] Stage4_out29_imag,

output [DATA_WIDTH-1:0] Stage4_out30_real,
output [DATA_WIDTH-1:0] Stage4_out30_imag,

output [DATA_WIDTH-1:0] Stage4_out31_real,
output [DATA_WIDTH-1:0] Stage4_out31_imag



);

///////////////////////////CTRL Cirquit////////////////////// 
// From the Start and for the Next 4 Cycles the stage will be active 

wire internal_enable;
reg [2:0] sel;
// Instaniate Ctrl Shift Register 
CtrlShiftRegister #(4) startCtrl (.clk(clk),.reset(reset),.start(stage4_start),.internal_enable(internal_enable),.finish(stage4_Finish));
	

always @(posedge clk ) begin
    if (reset) begin
        sel<=3'b000;
    end
    else if (stage4_start|internal_enable) begin
        if (sel==3'b100) begin
           sel <=3'b000; 
        end else begin
            sel <=sel+3'b001;
        end
    end 
end


     MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit0 (
	.in1_real(Stage3_out0_real),
	.in1_imag(Stage3_out0_imag),
	.in2_real(Stage3_out8_real),
	.in2_imag(Stage3_out8_imag),
	.constant_real(Constant_W0_real),
	.constant_imag(Constant_W0_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out0_real),
	.out1_imag(Stage4_out0_imag),
	.out2_real(Stage4_out8_real),
	.out2_imag(Stage4_out8_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit1 (
	.in1_real(Stage3_out1_real),
	.in1_imag(Stage3_out1_imag),
	.in2_real(Stage3_out9_real),
	.in2_imag(Stage3_out9_imag),
	.constant_real(Constant_W2_real),
	.constant_imag(Constant_W2_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out1_real),
	.out1_imag(Stage4_out1_imag),
	.out2_real(Stage4_out9_real),
	.out2_imag(Stage4_out9_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit2 (
	.in1_real(Stage3_out2_real),
	.in1_imag(Stage3_out2_imag),
	.in2_real(Stage3_out10_real),
	.in2_imag(Stage3_out10_imag),
	.constant_real(Constant_W4_real),
	.constant_imag(Constant_W4_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out2_real),
	.out1_imag(Stage4_out2_imag),
	.out2_real(Stage4_out10_real),
	.out2_imag(Stage4_out10_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit3 (
	.in1_real(Stage3_out3_real),
	.in1_imag(Stage3_out3_imag),
	.in2_real(Stage3_out11_real),
	.in2_imag(Stage3_out11_imag),
	.constant_real(Constant_W6_real),
	.constant_imag(Constant_W6_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out3_real),
	.out1_imag(Stage4_out3_imag),
	.out2_real(Stage4_out11_real),
	.out2_imag(Stage4_out11_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit4 (
	.in1_real(Stage3_out4_real),
	.in1_imag(Stage3_out4_imag),
	.in2_real(Stage3_out12_real),
	.in2_imag(Stage3_out12_imag),
	.constant_real(Constant_W8_real),
	.constant_imag(Constant_W8_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out4_real),
	.out1_imag(Stage4_out4_imag),
	.out2_real(Stage4_out12_real),
	.out2_imag(Stage4_out12_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit5 (
	.in1_real(Stage3_out5_real),
	.in1_imag(Stage3_out5_imag),
	.in2_real(Stage3_out13_real),
	.in2_imag(Stage3_out13_imag),
	.constant_real(Constant_W10_real),
	.constant_imag(Constant_W10_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out5_real),
	.out1_imag(Stage4_out5_imag),
	.out2_real(Stage4_out13_real),
	.out2_imag(Stage4_out13_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit6 (
	.in1_real(Stage3_out6_real),
	.in1_imag(Stage3_out6_imag),
	.in2_real(Stage3_out14_real),
	.in2_imag(Stage3_out14_imag),
	.constant_real(Constant_W12_real),
	.constant_imag(Constant_W12_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out6_real),
	.out1_imag(Stage4_out6_imag),
	.out2_real(Stage4_out14_real),
	.out2_imag(Stage4_out14_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit7 (
	.in1_real(Stage3_out7_real),
	.in1_imag(Stage3_out7_imag),
	.in2_real(Stage3_out15_real),
	.in2_imag(Stage3_out15_imag),
	.constant_real(Constant_W14_real),
	.constant_imag(Constant_W14_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out7_real),
	.out1_imag(Stage4_out7_imag),
	.out2_real(Stage4_out15_real),
	.out2_imag(Stage4_out15_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit8 (
	.in1_real(Stage3_out16_real),
	.in1_imag(Stage3_out16_imag),
	.in2_real(Stage3_out24_real),
	.in2_imag(Stage3_out24_imag),
	.constant_real(Constant_W0_real),
	.constant_imag(Constant_W0_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out16_real),
	.out1_imag(Stage4_out16_imag),
	.out2_real(Stage4_out24_real),
	.out2_imag(Stage4_out24_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit9 (
	.in1_real(Stage3_out17_real),
	.in1_imag(Stage3_out17_imag),
	.in2_real(Stage3_out25_real),
	.in2_imag(Stage3_out25_imag),
	.constant_real(Constant_W2_real),
	.constant_imag(Constant_W2_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out17_real),
	.out1_imag(Stage4_out17_imag),
	.out2_real(Stage4_out25_real),
	.out2_imag(Stage4_out25_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit10 (
	.in1_real(Stage3_out18_real),
	.in1_imag(Stage3_out18_imag),
	.in2_real(Stage3_out26_real),
	.in2_imag(Stage3_out26_imag),
	.constant_real(Constant_W4_real),
	.constant_imag(Constant_W4_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out18_real),
	.out1_imag(Stage4_out18_imag),
	.out2_real(Stage4_out26_real),
	.out2_imag(Stage4_out26_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit11 (
	.in1_real(Stage3_out19_real),
	.in1_imag(Stage3_out19_imag),
	.in2_real(Stage3_out27_real),
	.in2_imag(Stage3_out27_imag),
	.constant_real(Constant_W6_real),
	.constant_imag(Constant_W6_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out19_real),
	.out1_imag(Stage4_out19_imag),
	.out2_real(Stage4_out27_real),
	.out2_imag(Stage4_out27_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit12 (
	.in1_real(Stage3_out20_real),
	.in1_imag(Stage3_out20_imag),
	.in2_real(Stage3_out28_real),
	.in2_imag(Stage3_out28_imag),
	.constant_real(Constant_W8_real),
	.constant_imag(Constant_W8_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out20_real),
	.out1_imag(Stage4_out20_imag),
	.out2_real(Stage4_out28_real),
	.out2_imag(Stage4_out28_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit13 (
	.in1_real(Stage3_out21_real),
	.in1_imag(Stage3_out21_imag),
	.in2_real(Stage3_out29_real),
	.in2_imag(Stage3_out29_imag),
	.constant_real(Constant_W10_real),
	.constant_imag(Constant_W10_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out21_real),
	.out1_imag(Stage4_out21_imag),
	.out2_real(Stage4_out29_real),
	.out2_imag(Stage4_out29_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit14 (
	.in1_real(Stage3_out22_real),
	.in1_imag(Stage3_out22_imag),
	.in2_real(Stage3_out30_real),
	.in2_imag(Stage3_out30_imag),
	.constant_real(Constant_W12_real),
	.constant_imag(Constant_W12_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out22_real),
	.out1_imag(Stage4_out22_imag),
	.out2_real(Stage4_out30_real),
	.out2_imag(Stage4_out30_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit15 (
	.in1_real(Stage3_out23_real),
	.in1_imag(Stage3_out23_imag),
	.in2_real(Stage3_out31_real),
	.in2_imag(Stage3_out31_imag),
	.constant_real(Constant_W14_real),
	.constant_imag(Constant_W14_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage4_out23_real),
	.out1_imag(Stage4_out23_imag),
	.out2_real(Stage4_out31_real),
	.out2_imag(Stage4_out31_imag)
);







endmodule