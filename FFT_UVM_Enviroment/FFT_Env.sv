
`include "uvm_macros.svh"
`include "FFT_Agent.sv"
`include "FFT_ScoreBoard.sv"
import uvm_pkg::*;


class FFT_Env extends uvm_env;
    `uvm_component_utils(FFT_Env);
    FFT_Agent agentInstanse;
    FFT_ScoreBoard scoreBoardInstanse;

    function new(string name = "FFT_Env",uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agentInstanse = FFT_Agent::type_id::create("FFT_Env",this);
        scoreBoardInstanse = FFT_ScoreBoard::type_id::create("scoreBoardInstanse",this);
    endfunction

    
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        //Connect Monitor Port and ScoreBoard
        agentInstanse.monitorInstanse.analysis_port.connect(scoreBoardInstanse.item_collect_export);
    endfunction

endclass
