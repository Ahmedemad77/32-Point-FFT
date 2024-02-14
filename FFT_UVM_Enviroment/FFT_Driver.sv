
`ifndef UVM_DRIVER
`define UVM_DRIVER

`include "uvm_macros.svh"
`include "FFT_Interface.sv"
`include "FFT_Seq_Item.sv"
`include "FFT_Configrations.svh"
import uvm_pkg::*;

class FFT_Driver extends uvm_driver#(FFT_Seq_Item#(`DATA_WIDTH,`ADC_DATA_WIDTH));
    `uvm_component_utils(FFT_Driver);
    virtual FFT_Dut_Interface vinf;
    int counter;
    function new(string name = "FFT_DRIVER",uvm_component parent =null);
        super.new(name,parent);
    endfunction 
    
    function void build_phase(uvm_phase phase);
        
        super.build_phase(phase);

        // #Get the Virtual Interface 
        if (!uvm_config_db#(virtual FFT_Dut_Interface)::get(this,"*","FFT_INTERFACE",vinf)) begin
            `uvm_error(get_type_name(),"Can Not reterive the Interface Parmeter");
        end
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        // Get Items from the Sequencer 
        seq_item_port.get_next_item(req);
        //Proceed to the Dut 
        `uvm_info(get_type_name()," Driving Signals to the Dut",UVM_LOW);
        vinf.PU_enable = 1'b0;
        //Drive To the Dut
        @(negedge vinf.clk);
        
        for (int i=0; i<32; ++i) begin
            vinf.ADC_in_real[i] = req.ADC_in_real[i];
        end
        vinf.PU_enable = 1'b1;
        
        repeat (25) begin
           @(posedge vinf.clk); 
        end
        vinf.PU_enable = 1'b0;
        seq_item_port.item_done();
        phase.drop_objection(this);
        
    endtask
endclass 

`endif 