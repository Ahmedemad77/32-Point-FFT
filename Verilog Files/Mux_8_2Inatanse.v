

wire [DATA_WIDTH-1:0]in1_real;
wire [DATA_WIDTH-1:0]in1_imag;
wire [DATA_WIDTH-1:0]in2_real;
wire [DATA_WIDTH-1:0]in2_imag;
wire [DATA_WIDTH-1:0]constant_real;
wire [DATA_WIDTH-1:0]constant_imag;
wire [1:0]sel;
wire [DATA_WIDTH-1:0]out_1;
wire [DATA_WIDTH-1:0]out_2;




Mux_8_2  #( .DATA_WIDTH(DATA_WIDTH) ) 

Mux_8_2Unit (	.in1_real(in1_real),
	.in1_imag(in1_imag),
	.in2_real(in2_real),
	.in2_imag(in2_imag),
	.constant_real(constant_real),
	.constant_imag(constant_imag),
	.sel(sel),
	.out_1(out_1),
	.out_2(out_2)
);
