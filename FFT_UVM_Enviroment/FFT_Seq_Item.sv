
`ifndef FFT_SEQ_ITEM
`define FFT_SEQ_ITEM


`include "uvm_macros.svh"
import uvm_pkg::*;


class FFT_Seq_Item#(parameter DATA_WIDTH = 32 ,ADC_DATA_WIDTH=8 ) extends uvm_sequence_item;
    
    `uvm_object_utils(FFT_Seq_Item);
    
    logic PU_enable;
	rand logic [ADC_DATA_WIDTH-1:0] ADC_in_real[32];
	logic signed [DATA_WIDTH-1:0] FFT_RESULT_real[32];
	logic signed [DATA_WIDTH-1:0] FFT_RESULT_imag[32];
	
    constraint ADC_in_real_Input { foreach (ADC_in_real[i]) 
        ADC_in_real[i] inside { [0:100]}; 
      }

    function new (string name = "FFT_Seq_Item" );
        super.new(name);
    endfunction
    

endclass

`endif 