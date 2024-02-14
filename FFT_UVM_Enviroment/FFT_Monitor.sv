
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "FFT_interface.sv"
`include "FFT_Seq_Item.sv"

class FFT_Monitor extends uvm_monitor;
    `uvm_component_utils(FFT_Monitor);
    //Get the Virtual Interface 
    virtual FFT_Dut_Interface vinf;
    FFT_Seq_Item#() mon_item;
    //Define Anaylsis Port 
    uvm_analysis_port #(FFT_Seq_Item#()) analysis_port;
    int counter;
    function new(string name = "FFT_monitor",uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Get the Virtual Interface From the Configration Db 
        if (!uvm_config_db#(virtual FFT_Dut_Interface)::get(this,"*","FFT_INTERFACE",vinf)) begin
            `uvm_error(get_type_name(),"Can Not reterive the Interface Parmeter");
        end
        analysis_port = new ("analysis_port",this);
        mon_item = FFT_Seq_Item#()::type_id::create();
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        //Obtain the Logic Here 
        // forever begin
            phase.raise_objection(this);
            @(posedge vinf.clk);
            if (vinf.PU_enable) begin
                // Register the Input Data 
                captureInput(vinf,mon_item);
                counter = 1;
                while (counter<26) begin
                    @(posedge vinf.clk);
                    counter = counter +1;
                end
                captureOutput(vinf,mon_item);
                // `uvm_info(get_type_name(),$sformatf("Input data is d% \n input address is d% output data is d%",mon_item.data_in,mon_item.addr,mon_item.data_out),UVM_LOW);
                // analysis_port.write(mon_item);
            end
            analysis_port.write(mon_item);
            phase.drop_objection(this);

        // end
    endtask

    function void captureInput(virtual FFT_Dut_Interface vinf, ref FFT_Seq_Item#() mon_item );

                for (int i=0; i<32; ++i) begin
                    mon_item.ADC_in_real[i] =  vinf.ADC_in_real[i] ;    
                end
    endfunction
    
    function void printResult(virtual FFT_Dut_Interface vinf, ref FFT_Seq_Item#() mon_item);
            for (int i=0; i<32; ++i) begin
                `uvm_info(get_type_name(),$sformatf("vinf.FFT_%d_real  %d",i,(mon_item.FFT_RESULT_real[i])>>>16),UVM_LOW);
            end                            
    endfunction
    function void captureOutput(virtual FFT_Dut_Interface vinf, ref FFT_Seq_Item#() mon_item);
                // Register 
                for (int i=0; i<32; ++i) begin
                    mon_item.FFT_RESULT_real[i] = vinf.FFT_RESULT_real[i];
                    mon_item.FFT_RESULT_imag[i] = vinf.FFT_RESULT_imag[i];
                end
                
    endfunction 
endclass
