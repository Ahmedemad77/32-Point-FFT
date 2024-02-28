`timescale 1ns / 1ps 

module FFT_Stage2 #(
    parameter
    DATA_WIDTH = 8 , 
    INTEGER = 4, 
	FRACTION = 4
) (


input clk,
input reset,


input stage2_start, 
output stage2_Finish,

input [DATA_WIDTH-1:0] Stage1_out0_real,
input [DATA_WIDTH-1:0] Stage1_out0_imag,

input [DATA_WIDTH-1:0] Stage1_out1_real,
input [DATA_WIDTH-1:0] Stage1_out1_imag,

input [DATA_WIDTH-1:0] Stage1_out2_real,
input [DATA_WIDTH-1:0] Stage1_out2_imag,

input [DATA_WIDTH-1:0] Stage1_out3_real,
input [DATA_WIDTH-1:0] Stage1_out3_imag,

input [DATA_WIDTH-1:0] Stage1_out4_real,
input [DATA_WIDTH-1:0] Stage1_out4_imag,

input [DATA_WIDTH-1:0] Stage1_out5_real,
input [DATA_WIDTH-1:0] Stage1_out5_imag,

input [DATA_WIDTH-1:0] Stage1_out6_real,
input [DATA_WIDTH-1:0] Stage1_out6_imag,

input [DATA_WIDTH-1:0] Stage1_out7_real,
input [DATA_WIDTH-1:0] Stage1_out7_imag,

input [DATA_WIDTH-1:0] Stage1_out8_real,
input [DATA_WIDTH-1:0] Stage1_out8_imag,

input [DATA_WIDTH-1:0] Stage1_out9_real,
input [DATA_WIDTH-1:0] Stage1_out9_imag,

input [DATA_WIDTH-1:0] Stage1_out10_real,
input [DATA_WIDTH-1:0] Stage1_out10_imag,

input [DATA_WIDTH-1:0] Stage1_out11_real,
input [DATA_WIDTH-1:0] Stage1_out11_imag,

input [DATA_WIDTH-1:0] Stage1_out12_real,
input [DATA_WIDTH-1:0] Stage1_out12_imag,

input [DATA_WIDTH-1:0] Stage1_out13_real,
input [DATA_WIDTH-1:0] Stage1_out13_imag,

input [DATA_WIDTH-1:0] Stage1_out14_real,
input [DATA_WIDTH-1:0] Stage1_out14_imag,

input [DATA_WIDTH-1:0] Stage1_out15_real,
input [DATA_WIDTH-1:0] Stage1_out15_imag,

input [DATA_WIDTH-1:0] Stage1_out16_real,
input [DATA_WIDTH-1:0] Stage1_out16_imag,

input [DATA_WIDTH-1:0] Stage1_out17_real,
input [DATA_WIDTH-1:0] Stage1_out17_imag,

input [DATA_WIDTH-1:0] Stage1_out18_real,
input [DATA_WIDTH-1:0] Stage1_out18_imag,

input [DATA_WIDTH-1:0] Stage1_out19_real,
input [DATA_WIDTH-1:0] Stage1_out19_imag,

input [DATA_WIDTH-1:0] Stage1_out20_real,
input [DATA_WIDTH-1:0] Stage1_out20_imag,

input [DATA_WIDTH-1:0] Stage1_out21_real,
input [DATA_WIDTH-1:0] Stage1_out21_imag,

input [DATA_WIDTH-1:0] Stage1_out22_real,
input [DATA_WIDTH-1:0] Stage1_out22_imag,

input [DATA_WIDTH-1:0] Stage1_out23_real,
input [DATA_WIDTH-1:0] Stage1_out23_imag,

input [DATA_WIDTH-1:0] Stage1_out24_real,
input [DATA_WIDTH-1:0] Stage1_out24_imag,

input [DATA_WIDTH-1:0] Stage1_out25_real,
input [DATA_WIDTH-1:0] Stage1_out25_imag,

input [DATA_WIDTH-1:0] Stage1_out26_real,
input [DATA_WIDTH-1:0] Stage1_out26_imag,

input [DATA_WIDTH-1:0] Stage1_out27_real,
input [DATA_WIDTH-1:0] Stage1_out27_imag,

input [DATA_WIDTH-1:0] Stage1_out28_real,
input [DATA_WIDTH-1:0] Stage1_out28_imag,

input [DATA_WIDTH-1:0] Stage1_out29_real,
input [DATA_WIDTH-1:0] Stage1_out29_imag,

input [DATA_WIDTH-1:0] Stage1_out30_real,
input [DATA_WIDTH-1:0] Stage1_out30_imag,

input [DATA_WIDTH-1:0] Stage1_out31_real,
input [DATA_WIDTH-1:0] Stage1_out31_imag,

/// Constants///////////



input [DATA_WIDTH-1:0] Constant_W0_real,
input [DATA_WIDTH-1:0] Constant_W0_imag,

input [DATA_WIDTH-1:0] Constant_W8_real,
input [DATA_WIDTH-1:0] Constant_W8_imag,

/////////////////////////
output [DATA_WIDTH-1:0] Stage2_out0_real,
output [DATA_WIDTH-1:0] Stage2_out0_imag,

output [DATA_WIDTH-1:0] Stage2_out1_real,
output [DATA_WIDTH-1:0] Stage2_out1_imag,

output [DATA_WIDTH-1:0] Stage2_out2_real,
output [DATA_WIDTH-1:0] Stage2_out2_imag,

output [DATA_WIDTH-1:0] Stage2_out3_real,
output [DATA_WIDTH-1:0] Stage2_out3_imag,

output [DATA_WIDTH-1:0] Stage2_out4_real,
output [DATA_WIDTH-1:0] Stage2_out4_imag,

output [DATA_WIDTH-1:0] Stage2_out5_real,
output [DATA_WIDTH-1:0] Stage2_out5_imag,

output [DATA_WIDTH-1:0] Stage2_out6_real,
output [DATA_WIDTH-1:0] Stage2_out6_imag,

output [DATA_WIDTH-1:0] Stage2_out7_real,
output [DATA_WIDTH-1:0] Stage2_out7_imag,

output [DATA_WIDTH-1:0] Stage2_out8_real,
output [DATA_WIDTH-1:0] Stage2_out8_imag,

output [DATA_WIDTH-1:0] Stage2_out9_real,
output [DATA_WIDTH-1:0] Stage2_out9_imag,

output [DATA_WIDTH-1:0] Stage2_out10_real,
output [DATA_WIDTH-1:0] Stage2_out10_imag,

output [DATA_WIDTH-1:0] Stage2_out11_real,
output [DATA_WIDTH-1:0] Stage2_out11_imag,

output [DATA_WIDTH-1:0] Stage2_out12_real,
output [DATA_WIDTH-1:0] Stage2_out12_imag,

output [DATA_WIDTH-1:0] Stage2_out13_real,
output [DATA_WIDTH-1:0] Stage2_out13_imag,

output [DATA_WIDTH-1:0] Stage2_out14_real,
output [DATA_WIDTH-1:0] Stage2_out14_imag,

output [DATA_WIDTH-1:0] Stage2_out15_real,
output [DATA_WIDTH-1:0] Stage2_out15_imag,

output [DATA_WIDTH-1:0] Stage2_out16_real,
output [DATA_WIDTH-1:0] Stage2_out16_imag,

output [DATA_WIDTH-1:0] Stage2_out17_real,
output [DATA_WIDTH-1:0] Stage2_out17_imag,

output [DATA_WIDTH-1:0] Stage2_out18_real,
output [DATA_WIDTH-1:0] Stage2_out18_imag,

output [DATA_WIDTH-1:0] Stage2_out19_real,
output [DATA_WIDTH-1:0] Stage2_out19_imag,

output [DATA_WIDTH-1:0] Stage2_out20_real,
output [DATA_WIDTH-1:0] Stage2_out20_imag,

output [DATA_WIDTH-1:0] Stage2_out21_real,
output [DATA_WIDTH-1:0] Stage2_out21_imag,

output [DATA_WIDTH-1:0] Stage2_out22_real,
output [DATA_WIDTH-1:0] Stage2_out22_imag,

output [DATA_WIDTH-1:0] Stage2_out23_real,
output [DATA_WIDTH-1:0] Stage2_out23_imag,

output [DATA_WIDTH-1:0] Stage2_out24_real,
output [DATA_WIDTH-1:0] Stage2_out24_imag,

output [DATA_WIDTH-1:0] Stage2_out25_real,
output [DATA_WIDTH-1:0] Stage2_out25_imag,

output [DATA_WIDTH-1:0] Stage2_out26_real,
output [DATA_WIDTH-1:0] Stage2_out26_imag,

output [DATA_WIDTH-1:0] Stage2_out27_real,
output [DATA_WIDTH-1:0] Stage2_out27_imag,

output [DATA_WIDTH-1:0] Stage2_out28_real,
output [DATA_WIDTH-1:0] Stage2_out28_imag,

output [DATA_WIDTH-1:0] Stage2_out29_real,
output [DATA_WIDTH-1:0] Stage2_out29_imag,

output [DATA_WIDTH-1:0] Stage2_out30_real,
output [DATA_WIDTH-1:0] Stage2_out30_imag,

output [DATA_WIDTH-1:0] Stage2_out31_real,
output [DATA_WIDTH-1:0] Stage2_out31_imag



);


///////////////////////////CTRL Cirquit////////////////////// 
// From the Start and for the Next 4 Cycles the stage will be active 

wire internal_enable;
reg [2:0] sel;
// Instaniate Ctrl Shift Register 
CtrlShiftRegister #(4) startCtrl (.clk(clk),.reset(reset),.start(stage2_start),.internal_enable(internal_enable),.finish(stage2_Finish));
	

always @(posedge clk ) begin
    if (reset) begin
        sel<=3'b000;
    end
    else if (stage2_start|internal_enable) begin
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
	.in1_real(Stage1_out0_real),
	.in1_imag(Stage1_out0_imag),
	.in2_real(Stage1_out2_real),
	.in2_imag(Stage1_out2_imag),
	.constant_real(Constant_W0_real),
	.constant_imag(Constant_W0_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out0_real),
	.out1_imag(Stage2_out0_imag),
	.out2_real(Stage2_out2_real),
	.out2_imag(Stage2_out2_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit1 (
	.in1_real(Stage1_out1_real),
	.in1_imag(Stage1_out1_imag),
	.in2_real(Stage1_out3_real),
	.in2_imag(Stage1_out3_imag),
	.constant_real(Constant_W8_real),
	.constant_imag(Constant_W8_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out1_real),
	.out1_imag(Stage2_out1_imag),
	.out2_real(Stage2_out3_real),
	.out2_imag(Stage2_out3_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit2 (
	.in1_real(Stage1_out4_real),
	.in1_imag(Stage1_out4_imag),
	.in2_real(Stage1_out6_real),
	.in2_imag(Stage1_out6_imag),
	.constant_real(Constant_W0_real),
	.constant_imag(Constant_W0_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out4_real),
	.out1_imag(Stage2_out4_imag),
	.out2_real(Stage2_out6_real),
	.out2_imag(Stage2_out6_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit3 (
	.in1_real(Stage1_out5_real),
	.in1_imag(Stage1_out5_imag),
	.in2_real(Stage1_out7_real),
	.in2_imag(Stage1_out7_imag),
	.constant_real(Constant_W8_real),
	.constant_imag(Constant_W8_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out5_real),
	.out1_imag(Stage2_out5_imag),
	.out2_real(Stage2_out7_real),
	.out2_imag(Stage2_out7_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit4 (
	.in1_real(Stage1_out8_real),
	.in1_imag(Stage1_out8_imag),
	.in2_real(Stage1_out10_real),
	.in2_imag(Stage1_out10_imag),
	.constant_real(Constant_W0_real),
	.constant_imag(Constant_W0_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out8_real),
	.out1_imag(Stage2_out8_imag),
	.out2_real(Stage2_out10_real),
	.out2_imag(Stage2_out10_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit5 (
	.in1_real(Stage1_out9_real),
	.in1_imag(Stage1_out9_imag),
	.in2_real(Stage1_out11_real),
	.in2_imag(Stage1_out11_imag),
	.constant_real(Constant_W8_real),
	.constant_imag(Constant_W8_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out9_real),
	.out1_imag(Stage2_out9_imag),
	.out2_real(Stage2_out11_real),
	.out2_imag(Stage2_out11_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit6 (
	.in1_real(Stage1_out12_real),
	.in1_imag(Stage1_out12_imag),
	.in2_real(Stage1_out14_real),
	.in2_imag(Stage1_out14_imag),
	.constant_real(Constant_W0_real),
	.constant_imag(Constant_W0_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out12_real),
	.out1_imag(Stage2_out12_imag),
	.out2_real(Stage2_out14_real),
	.out2_imag(Stage2_out14_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit7 (
	.in1_real(Stage1_out13_real),
	.in1_imag(Stage1_out13_imag),
	.in2_real(Stage1_out15_real),
	.in2_imag(Stage1_out15_imag),
	.constant_real(Constant_W8_real),
	.constant_imag(Constant_W8_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out13_real),
	.out1_imag(Stage2_out13_imag),
	.out2_real(Stage2_out15_real),
	.out2_imag(Stage2_out15_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit8 (
	.in1_real(Stage1_out16_real),
	.in1_imag(Stage1_out16_imag),
	.in2_real(Stage1_out18_real),
	.in2_imag(Stage1_out18_imag),
	.constant_real(Constant_W0_real),
	.constant_imag(Constant_W0_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out16_real),
	.out1_imag(Stage2_out16_imag),
	.out2_real(Stage2_out18_real),
	.out2_imag(Stage2_out18_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit9 (
	.in1_real(Stage1_out17_real),
	.in1_imag(Stage1_out17_imag),
	.in2_real(Stage1_out19_real),
	.in2_imag(Stage1_out19_imag),
	.constant_real(Constant_W8_real),
	.constant_imag(Constant_W8_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out17_real),
	.out1_imag(Stage2_out17_imag),
	.out2_real(Stage2_out19_real),
	.out2_imag(Stage2_out19_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit10 (
	.in1_real(Stage1_out20_real),
	.in1_imag(Stage1_out20_imag),
	.in2_real(Stage1_out22_real),
	.in2_imag(Stage1_out22_imag),
	.constant_real(Constant_W0_real),
	.constant_imag(Constant_W0_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out20_real),
	.out1_imag(Stage2_out20_imag),
	.out2_real(Stage2_out22_real),
	.out2_imag(Stage2_out22_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit11 (
	.in1_real(Stage1_out21_real),
	.in1_imag(Stage1_out21_imag),
	.in2_real(Stage1_out23_real),
	.in2_imag(Stage1_out23_imag),
	.constant_real(Constant_W8_real),
	.constant_imag(Constant_W8_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out21_real),
	.out1_imag(Stage2_out21_imag),
	.out2_real(Stage2_out23_real),
	.out2_imag(Stage2_out23_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit12 (
	.in1_real(Stage1_out24_real),
	.in1_imag(Stage1_out24_imag),
	.in2_real(Stage1_out26_real),
	.in2_imag(Stage1_out26_imag),
	.constant_real(Constant_W0_real),
	.constant_imag(Constant_W0_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out24_real),
	.out1_imag(Stage2_out24_imag),
	.out2_real(Stage2_out26_real),
	.out2_imag(Stage2_out26_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit13 (
	.in1_real(Stage1_out25_real),
	.in1_imag(Stage1_out25_imag),
	.in2_real(Stage1_out27_real),
	.in2_imag(Stage1_out27_imag),
	.constant_real(Constant_W8_real),
	.constant_imag(Constant_W8_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out25_real),
	.out1_imag(Stage2_out25_imag),
	.out2_real(Stage2_out27_real),
	.out2_imag(Stage2_out27_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit14 (
	.in1_real(Stage1_out28_real),
	.in1_imag(Stage1_out28_imag),
	.in2_real(Stage1_out30_real),
	.in2_imag(Stage1_out30_imag),
	.constant_real(Constant_W0_real),
	.constant_imag(Constant_W0_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out28_real),
	.out1_imag(Stage2_out28_imag),
	.out2_real(Stage2_out30_real),
	.out2_imag(Stage2_out30_imag)
);



    MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit15 (
	.in1_real(Stage1_out29_real),
	.in1_imag(Stage1_out29_imag),
	.in2_real(Stage1_out31_real),
	.in2_imag(Stage1_out31_imag),
	.constant_real(Constant_W8_real),
	.constant_imag(Constant_W8_imag),
	.sel(sel),
	.clk(clk),
	.reset(reset),
	.out1_real(Stage2_out29_real),
	.out1_imag(Stage2_out29_imag),
	.out2_real(Stage2_out31_real),
	.out2_imag(Stage2_out31_imag)
);





endmodule