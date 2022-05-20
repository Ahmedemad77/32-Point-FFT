

wire [DATA_WIDTH-1:0]in1_real;
wire [DATA_WIDTH-1:0]in1_imag;
wire [DATA_WIDTH-1:0]_out_real;
wire [DATA_WIDTH-1:0]_out_imag;
wire [1:0]sel;
wire [DATA_WIDTH-1:0]Mux_out;




Mux_4_1  #( .DATA_WIDTH(DATA_WIDTH) ) 

Mux_4_1Unit (	.in1_real(in1_real),
	.in1_imag(in1_imag),
	._out_real(_out_real),
	._out_imag(_out_imag),
	.sel(sel),
	.Mux_out(Mux_out)
);
