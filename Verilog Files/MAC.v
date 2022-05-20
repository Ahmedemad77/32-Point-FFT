`timescale 1ns / 1ps

// Output1 = I1 + Constant*I2
// Output2 = I1 - Constant*I2
module MAC #(
    parameter
    DATA_WIDTH = 8 , 
    INTEGER = 4, 
	FRACTION = 4
) (
    input  [DATA_WIDTH-1:0] in1_real,
    input  [DATA_WIDTH-1:0] in1_imag,
    
    input  [DATA_WIDTH-1:0] in2_real,
    input  [DATA_WIDTH-1:0] in2_imag,
    
    input  [DATA_WIDTH-1:0] constant_real,
    input  [DATA_WIDTH-1:0] constant_imag,

    input [2:0] sel,

    input clk,
    input reset,

    output reg [DATA_WIDTH-1:0] out1_real,
    output reg [DATA_WIDTH-1:0] out1_imag, 
    output reg [DATA_WIDTH-1:0] out2_real,
    output reg [DATA_WIDTH-1:0] out2_imag
);








wire [DATA_WIDTH-1:0] Mul_Result;

wire [DATA_WIDTH-1:0] Mux_out1_Adder;
wire [DATA_WIDTH-1:0] Mux_out2_Sub;

wire [DATA_WIDTH-1:0] Adder_Result;
wire [DATA_WIDTH-1:0] Sub_Result;
wire [DATA_WIDTH-1:0] Mux_out1;
wire [DATA_WIDTH-1:0] Mux_out2; 


reg [DATA_WIDTH-1:0] ACC1_Real;
reg [DATA_WIDTH-1:0] ACC1_IMAG;     
reg [DATA_WIDTH-1:0] ACC2_REAL;
reg [DATA_WIDTH-1:0] ACC2_IMAG;


always @(posedge clk ,posedge reset) begin
    if (reset) begin
        out1_real <={DATA_WIDTH{1'b0}};
        out1_imag <={DATA_WIDTH{1'b0}};
        out2_real <={DATA_WIDTH{1'b0}};
        out2_imag <={DATA_WIDTH{1'b0}};
    end
    else if (sel[2]==1'b1) begin // First 2 Clks
        out1_real <= ACC1_Real;
        out1_imag <= ACC1_IMAG;
        out2_real <= ACC2_REAL;
        out2_imag <= ACC2_IMAG;
    end
end


always @(posedge clk ,posedge reset) begin
    if (reset) begin
        ACC1_Real <={DATA_WIDTH{1'b0}};
        ACC2_REAL <={DATA_WIDTH{1'b0}};
    end
    else if (sel[1]==1'b0) begin // First 2 Clks
        ACC1_Real <= Adder_Result;
        ACC2_REAL <= Sub_Result;
    end
end

always @(posedge clk ,posedge reset) begin
    if (reset) begin
        ACC1_IMAG <={DATA_WIDTH{1'b0}};
        ACC2_IMAG <={DATA_WIDTH{1'b0}};
    end
    else if (sel[1]==1'b1) begin // Second 2 Clks
        ACC1_IMAG <= Adder_Result ;
        ACC2_IMAG <= Sub_Result ;
    end
end

Mux_6_2  #( .DATA_WIDTH(DATA_WIDTH),.INTEGER(INTEGER), .FRACTION(FRACTION) ) 

Mux_6_2Unit (	
	.in2_real(in2_real),
	.in2_imag(in2_imag),
	.constant_real(constant_real),
	.constant_imag(constant_imag),
	.sel(sel[1:0]),
	.out_1(Mux_out1),
	.out_2(Mux_out2)
);

/////////////////////////////////////////////////////////////////////////////
////////////////////////  Multiplier          ///////////////////////////////
/////////////////////////////////////////////////////////////////////////////

fixed_point_mul #(.DATA_WIDTH(DATA_WIDTH),.INTEGER(INTEGER), .FRACTION(FRACTION)) mul(
        .in1(Mux_out1),.in2(Mux_out2),.out(Mul_Result)
);


/////////////////////////////////////////////////////////////////////////////
////////////////////////  Adder Mux          ///////////////////////////////
/////////////////////////////////////////////////////////////////////////////


Mux_4_1  #( .DATA_WIDTH(DATA_WIDTH) ) 

Mux_4_1Unit1_Add (	.in1_real(in1_real),
	.in1_imag(in1_imag),
	.reg_out_real(ACC1_Real),
	.reg_out_imag(ACC1_IMAG),
	.sel(sel[1:0]),
	.Mux_out(Mux_out1_Adder)
);


Mux_4_1  #( .DATA_WIDTH(DATA_WIDTH) ) 

Mux_4_1Unit1_Sub (	.in1_real(in1_real),
	.in1_imag(in1_imag),
	.reg_out_real(ACC2_REAL),
	.reg_out_imag(ACC2_IMAG),
	.sel(sel[1:0]),
	.Mux_out(Mux_out2_Sub)
);


// Eqations 

// S01_REAL = ((I0_real +  constant_real*I2_REAL)FirstClk - CONSTANT_IMAG*I2_IMAG )SecondClk 
// S11_REAL = ((I0_real -  constant_real*I2_REAL)FirstClk + CONSTANT_IMAG*I2_IMAG )SecondClk
// S01_IMAG = ((I0_imag +  constant_imag*I2_REAL)ThirdClk + CONSTANT_Real*I2_IMAG )FourthClk 
// S11_IMAG = ((I0_imag -  constant_imag*I2_REAL)ThirdClk - CONSTANT_Real*I2_IMAG )FourthClk

assign Adder_Result = (sel[1] ?(Mux_out1_Adder + Mul_Result) : (sel[0] ? Mux_out1_Adder - Mul_Result: Mux_out1_Adder + Mul_Result) ) ; 
assign Sub_Result  =  (sel[1] ?Mux_out2_Sub - Mul_Result : (sel[0] ? Mux_out2_Sub + Mul_Result :Mux_out2_Sub - Mul_Result ));
    
endmodule