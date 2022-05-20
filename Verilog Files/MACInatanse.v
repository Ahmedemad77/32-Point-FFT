

wire [DATA_WIDTH-1:0]in1_real;
wire [DATA_WIDTH-1:0]in1_imag;
wire [DATA_WIDTH-1:0]in2_real;
wire [DATA_WIDTH-1:0]in2_imag;
wire [DATA_WIDTH-1:0]constant_real;
wire [DATA_WIDTH-1:0]constant_imag;
wire [2:0]sel;
wire clk;
wire reset;
wire [DATA_WIDTH-1:0]out1_real;
wire [DATA_WIDTH-1:0]out1_imag;
wire [DATA_WIDTH-1:0]out2_real;
wire [DATA_WIDTH-1:0]out2_imag;




MAC  #( .DATA_WIDTH(DATA_WIDTH),
.INTEGER(INTEGER),
.FRACTION(FRACTION) ) 

MACUnit (
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
