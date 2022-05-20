
`timescale 1ns / 1ps

module FFT_32TB;
localparam ADC_DATA_WIDTH =8;
localparam DATA_WIDTH = 16;
reg clk;
    reg reset;
    reg PU_enable;
    reg [ADC_DATA_WIDTH-1:0] ADC_in0_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in1_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in2_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in3_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in4_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in5_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in6_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in7_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in8_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in9_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in10_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in11_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in12_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in13_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in14_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in15_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in16_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in17_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in18_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in19_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in20_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in21_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in22_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in23_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in24_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in25_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in26_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in27_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in28_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in29_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in30_real;
    reg [ADC_DATA_WIDTH-1:0] ADC_in31_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_0_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_0_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_1_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_1_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_2_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_2_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_3_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_3_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_4_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_4_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_5_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_5_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_6_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_6_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_7_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_7_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_8_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_8_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_9_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_9_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_10_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_10_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_11_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_11_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_12_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_12_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_13_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_13_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_14_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_14_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_15_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_15_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_16_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_16_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_17_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_17_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_18_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_18_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_19_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_19_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_20_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_20_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_21_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_21_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_22_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_22_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_23_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_23_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_24_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_24_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_25_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_25_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_26_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_26_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_27_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_27_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_28_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_28_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_29_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_29_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_30_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_30_imag;
	wire [DATA_WIDTH-1:0] FFT_RESULT_31_real;
	wire [DATA_WIDTH-1:0] FFT_RESULT_31_imag;


FFT_32  #( .DATA_WIDTH(16),.INTEGER(8),.FRACTION(8) ) UUT (
.clk(clk),
.reset(reset),
.PU_enable(PU_enable),
.ADC_in0_real(ADC_in0_real),
.ADC_in1_real(ADC_in1_real),
.ADC_in2_real(ADC_in2_real),
.ADC_in3_real(ADC_in3_real),
.ADC_in4_real(ADC_in4_real),
.ADC_in5_real(ADC_in5_real),
.ADC_in6_real(ADC_in6_real),
.ADC_in7_real(ADC_in7_real),
.ADC_in8_real(ADC_in8_real),
.ADC_in9_real(ADC_in9_real),
.ADC_in10_real(ADC_in10_real),
.ADC_in11_real(ADC_in11_real),
.ADC_in12_real(ADC_in12_real),
.ADC_in13_real(ADC_in13_real),
.ADC_in14_real(ADC_in14_real),
.ADC_in15_real(ADC_in15_real),
.ADC_in16_real(ADC_in16_real),
.ADC_in17_real(ADC_in17_real),
.ADC_in18_real(ADC_in18_real),
.ADC_in19_real(ADC_in19_real),
.ADC_in20_real(ADC_in20_real),
.ADC_in21_real(ADC_in21_real),
.ADC_in22_real(ADC_in22_real),
.ADC_in23_real(ADC_in23_real),
.ADC_in24_real(ADC_in24_real),
.ADC_in25_real(ADC_in25_real),
.ADC_in26_real(ADC_in26_real),
.ADC_in27_real(ADC_in27_real),
.ADC_in28_real(ADC_in28_real),
.ADC_in29_real(ADC_in29_real),
.ADC_in30_real(ADC_in30_real),
.ADC_in31_real(ADC_in31_real),
.FFT_RESULT_0_real(FFT_RESULT_0_real),
.FFT_RESULT_0_imag(FFT_RESULT_0_imag),
.FFT_RESULT_1_real(FFT_RESULT_1_real),
.FFT_RESULT_1_imag(FFT_RESULT_1_imag),
.FFT_RESULT_2_real(FFT_RESULT_2_real),
.FFT_RESULT_2_imag(FFT_RESULT_2_imag),
.FFT_RESULT_3_real(FFT_RESULT_3_real),
.FFT_RESULT_3_imag(FFT_RESULT_3_imag),
.FFT_RESULT_4_real(FFT_RESULT_4_real),
.FFT_RESULT_4_imag(FFT_RESULT_4_imag),
.FFT_RESULT_5_real(FFT_RESULT_5_real),
.FFT_RESULT_5_imag(FFT_RESULT_5_imag),
.FFT_RESULT_6_real(FFT_RESULT_6_real),
.FFT_RESULT_6_imag(FFT_RESULT_6_imag),
.FFT_RESULT_7_real(FFT_RESULT_7_real),
.FFT_RESULT_7_imag(FFT_RESULT_7_imag),
.FFT_RESULT_8_real(FFT_RESULT_8_real),
.FFT_RESULT_8_imag(FFT_RESULT_8_imag),
.FFT_RESULT_9_real(FFT_RESULT_9_real),
.FFT_RESULT_9_imag(FFT_RESULT_9_imag),
.FFT_RESULT_10_real(FFT_RESULT_10_real),
.FFT_RESULT_10_imag(FFT_RESULT_10_imag),
.FFT_RESULT_11_real(FFT_RESULT_11_real),
.FFT_RESULT_11_imag(FFT_RESULT_11_imag),
.FFT_RESULT_12_real(FFT_RESULT_12_real),
.FFT_RESULT_12_imag(FFT_RESULT_12_imag),
.FFT_RESULT_13_real(FFT_RESULT_13_real),
.FFT_RESULT_13_imag(FFT_RESULT_13_imag),
.FFT_RESULT_14_real(FFT_RESULT_14_real),
.FFT_RESULT_14_imag(FFT_RESULT_14_imag),
.FFT_RESULT_15_real(FFT_RESULT_15_real),
.FFT_RESULT_15_imag(FFT_RESULT_15_imag),
.FFT_RESULT_16_real(FFT_RESULT_16_real),
.FFT_RESULT_16_imag(FFT_RESULT_16_imag),
.FFT_RESULT_17_real(FFT_RESULT_17_real),
.FFT_RESULT_17_imag(FFT_RESULT_17_imag),
.FFT_RESULT_18_real(FFT_RESULT_18_real),
.FFT_RESULT_18_imag(FFT_RESULT_18_imag),
.FFT_RESULT_19_real(FFT_RESULT_19_real),
.FFT_RESULT_19_imag(FFT_RESULT_19_imag),
.FFT_RESULT_20_real(FFT_RESULT_20_real),
.FFT_RESULT_20_imag(FFT_RESULT_20_imag),
.FFT_RESULT_21_real(FFT_RESULT_21_real),
.FFT_RESULT_21_imag(FFT_RESULT_21_imag),
.FFT_RESULT_22_real(FFT_RESULT_22_real),
.FFT_RESULT_22_imag(FFT_RESULT_22_imag),
.FFT_RESULT_23_real(FFT_RESULT_23_real),
.FFT_RESULT_23_imag(FFT_RESULT_23_imag),
.FFT_RESULT_24_real(FFT_RESULT_24_real),
.FFT_RESULT_24_imag(FFT_RESULT_24_imag),
.FFT_RESULT_25_real(FFT_RESULT_25_real),
.FFT_RESULT_25_imag(FFT_RESULT_25_imag),
.FFT_RESULT_26_real(FFT_RESULT_26_real),
.FFT_RESULT_26_imag(FFT_RESULT_26_imag),
.FFT_RESULT_27_real(FFT_RESULT_27_real),
.FFT_RESULT_27_imag(FFT_RESULT_27_imag),
.FFT_RESULT_28_real(FFT_RESULT_28_real),
.FFT_RESULT_28_imag(FFT_RESULT_28_imag),
.FFT_RESULT_29_real(FFT_RESULT_29_real),
.FFT_RESULT_29_imag(FFT_RESULT_29_imag),
.FFT_RESULT_30_real(FFT_RESULT_30_real),
.FFT_RESULT_30_imag(FFT_RESULT_30_imag),
.FFT_RESULT_31_real(FFT_RESULT_31_real),
.FFT_RESULT_31_imag(FFT_RESULT_31_imag)
);
parameter CLK_PERIOD =10;
always #(CLK_PERIOD/2) clk = ~clk ;
initial begin




clk =  0  ;
reset =   1 ;

PU_enable =  0  ;
#500;

reset =   0 ;

clk =  1  ;
PU_enable = 1   ;
ADC_in0_real =  8'b00000000   ;
ADC_in1_real =  8'b00000001   ;
ADC_in2_real =  8'b00000010   ;
ADC_in3_real =  8'b00000011   ;
ADC_in4_real =  8'b00000100   ;
ADC_in5_real =  8'b00000101   ;
ADC_in6_real =  8'b00000110   ;
ADC_in7_real =  8'b00000111   ;
ADC_in8_real =  8'b00001000   ;
ADC_in9_real =  8'b00001001   ;
ADC_in10_real =  8'b00001010   ;
ADC_in11_real =  8'b00001011   ;
ADC_in12_real =  8'b00001100   ;
ADC_in13_real =  8'b00001101   ;
ADC_in14_real =  8'b00001110   ;
ADC_in15_real =  8'b00001111   ;
ADC_in16_real =  8'b00010000   ;
ADC_in17_real =  8'b00010001   ;
ADC_in18_real =  8'b00010010   ;
ADC_in19_real =  8'b00010011   ;
ADC_in20_real =  8'b00010100   ;
ADC_in21_real =  8'b00010101   ;
ADC_in22_real =  8'b00010110   ;
ADC_in23_real =  8'b00010111   ;
ADC_in24_real =  8'b00011000   ;
ADC_in25_real =  8'b00011001   ;
ADC_in26_real =  8'b00011010   ;
ADC_in27_real =  8'b00011011   ;
ADC_in28_real =  8'b00011100   ;
ADC_in29_real =  8'b00011101   ;
ADC_in30_real =  8'b00011110   ;
ADC_in31_real =  8'b00011111   ;

//Wait For (40 Nsec) then cahnge the inut 
#(CLK_PERIOD*4);
/////////////////////////////////////////////////////////////////////////////
////////////////////////  Second Input 		 ///////////////////////////////
/////////////////////////////////////////////////////////////////////////////

ADC_in0_real =  8'b00000001   ;
ADC_in1_real =  8'b00000000   ;
ADC_in2_real =  8'b00000001   ;
ADC_in3_real =  8'b00000000   ;
ADC_in4_real =  8'b00000001   ;
ADC_in5_real =  8'b00000000   ;
ADC_in6_real =  8'b00000001   ;
ADC_in7_real =  8'b00000000   ;
ADC_in8_real =  8'b00000001   ;
ADC_in9_real =  8'b00000000   ;
ADC_in10_real =  8'b00000001   ;
ADC_in11_real =  8'b00000000   ;
ADC_in12_real =  8'b00000001   ;
ADC_in13_real =  8'b00000000   ;
ADC_in14_real =  8'b00000001   ;
ADC_in15_real =  8'b00000000   ;
ADC_in16_real =  8'b00000001   ;
ADC_in17_real =  8'b00000001   ;
ADC_in18_real =  8'b00000001   ;
ADC_in19_real =  8'b00000001   ;
ADC_in20_real =  8'b00000001   ;
ADC_in21_real =  8'b00000001   ;
ADC_in22_real =  8'b00000001   ;
ADC_in23_real =  8'b00000001   ;
ADC_in24_real =  8'b00000001   ;
ADC_in25_real =  8'b00000001   ;
ADC_in26_real =  8'b00000001   ;
ADC_in27_real =  8'b00000001   ;
ADC_in28_real =  8'b00000001   ;
ADC_in29_real =  8'b00000001   ;
ADC_in30_real =  8'b00000001   ;
ADC_in31_real =  8'b00000001   ;

//Wait For (50 Nsec) then cahnge the inut 
#(CLK_PERIOD*4);
/////////////////////////////////////////////////////////////////////////////
////////////////////////  Third Input 		 ///////////////////////////////
/////////////////////////////////////////////////////////////////////////////

ADC_in0_real =  8'b00000000   ;
ADC_in1_real =  8'b00000000   ;
ADC_in2_real =  8'b00000000   ;
ADC_in3_real =  8'b00000000   ;
ADC_in4_real =  8'b00000001   ;
ADC_in5_real =  8'b00000000   ;
ADC_in6_real =  8'b00000001   ;
ADC_in7_real =  8'b00000000   ;
ADC_in8_real =  8'b00000001   ;
ADC_in9_real =  8'b00000000   ;
ADC_in10_real =  8'b00000001   ;
ADC_in11_real =  8'b00000000   ;
ADC_in12_real =  8'b00000001   ;
ADC_in13_real =  8'b00000000   ;
ADC_in14_real =  8'b00000001   ;
ADC_in15_real =  8'b00000000   ;
ADC_in16_real =  8'b00000001   ;
ADC_in17_real =  8'b00000001   ;
ADC_in18_real =  8'b00000001   ;
ADC_in19_real =  8'b00000001   ;
ADC_in20_real =  8'b00000001   ;
ADC_in21_real =  8'b00000001   ;
ADC_in22_real =  8'b00000001   ;
ADC_in23_real =  8'b00000001   ;
ADC_in24_real =  8'b00000001   ;
ADC_in25_real =  8'b00000001   ;
ADC_in26_real =  8'b00000001   ;
ADC_in27_real =  8'b00000001   ;
ADC_in28_real =  8'b00000001   ;
ADC_in29_real =  8'b00000001   ;
ADC_in30_real =  8'b00000001   ;
ADC_in31_real =  8'b00000001   ;



#3000;
$finish;
end
endmodule
