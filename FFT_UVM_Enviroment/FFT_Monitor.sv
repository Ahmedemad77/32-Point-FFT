
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
    uvm_analysis_port #(FFT_Seq_Item#()) input_analysis_port;
    uvm_analysis_port #(FFT_Seq_Item#()) output_analysis_port;
    
    function new(string name = "FFT_monitor",uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Get the Virtual Interface From the Configration Db 
        if (!uvm_config_db#(virtual FFT_Dut_Interface)::get(this,"*","FFT_INTERFACE",vinf)) begin
            `uvm_error(get_type_name(),"Can Not reterive the Interface Parmeter");
        end
        input_analysis_port = new ("input_analysis_port",this);
        output_analysis_port = new ("output_analysis_port",this);
        mon_item = FFT_Seq_Item#()::type_id::create();
        
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        //Obtain the Logic Here 
        forever begin
            @(posedge vinf.clk);
            if (vinf.start) begin
                // phase.raise_objection(this);
                // Register the Input Data 
                captureInput(vinf,mon_item);
                // Send it to the scoreBoard by UVM Analysis Input 
                input_analysis_port.write(mon_item);
                
                `uvm_info(get_type_name(),"Item Started",UVM_LOW);
            end
            if(vinf.finish)begin
                // phase.drop_objection(this);
                captureOutput(vinf,mon_item);
                // Send to ScoreBoard 
                output_analysis_port.write(mon_item);
                `uvm_info(get_type_name(),"Item Finshed",UVM_LOW);
            end
            

        end 
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
