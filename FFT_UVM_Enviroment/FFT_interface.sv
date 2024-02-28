`ifndef INTERFACE_SV
`define INTERFACE_SV


interface FFT_Dut_Interface#(parameter DATA_WIDTH = 32 ,ADC_DATA_WIDTH=8 )(input clk,input reset);
    // Include The Input and output of the DUT 
    logic start;
	logic finish;

	logic [ADC_DATA_WIDTH-1:0] ADC_in_real[32];
	logic signed [DATA_WIDTH-1:0] FFT_RESULT_real[32];
	logic signed [DATA_WIDTH-1:0] FFT_RESULT_imag[32];
		
endinterface

`endif 