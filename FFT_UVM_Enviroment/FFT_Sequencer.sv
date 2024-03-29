

`include "uvm_macros.svh"

`include "FFT_Seq_Item.sv"
`include "FFT_Configrations.svh"
import uvm_pkg::*;


class FFT_Sequencer extends uvm_sequencer#(FFT_Seq_Item#(`DATA_WIDTH,`ADC_DATA_WIDTH));
    `uvm_component_utils(FFT_Sequencer);

    function  new(string name = "FFT_Sequencer",uvm_component parent = null);
        super.new(name,parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction
    
endclass    