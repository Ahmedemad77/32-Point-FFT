

`include "uvm_macros.svh"
import uvm_pkg::*;

`include "FFT_Driver.sv"
`include "FFT_Sequencer.sv"
`include "FFT_Monitor.sv"

class  FFT_Agent extends uvm_agent;
    `uvm_component_utils(FFT_Agent);
    FFT_Driver driverInstanse;
    FFT_Sequencer SequencerInstanse;
    FFT_Monitor monitorInstanse;
    function new(string name ="FFT_AGENT",uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        driverInstanse = FFT_Driver::type_id::create("FFT_Driver",this);
        SequencerInstanse = FFT_Sequencer::type_id::create("FFT_Sequencer",this);
        monitorInstanse = FFT_Monitor::type_id::create("FFT_Monitor",this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        driverInstanse.seq_item_port.connect(SequencerInstanse.seq_item_export);
    endfunction
    
endclass
