
`include "uvm_macros.svh"
`include "FFT_Seq_Item.sv"
import uvm_pkg::*;
//,input float result_Real_part[],input float result_Imag_part[]
import "DPI-C" context function int FFT_Check_Result(input int v[],input real result_Real_part[],input real result_Imag_part[] );
//Define 32 real vector that for real part of the Result and Imaginary Part 
class FFT_ScoreBoard extends uvm_scoreboard;


   `uvm_component_utils(FFT_ScoreBoard);
    uvm_analysis_imp#(FFT_Seq_Item,FFT_ScoreBoard) item_collect_export;
    FFT_Seq_Item item_q[$];
    int Adc_Input[32];
    real result_Real_part[32];
    real result_Imag_part[32];
    integer result;
    function  new(string name = "FFT_ScoreBoard", uvm_component parent = null);
        super.new(name,parent);
        item_collect_export = new("item_collect_export",this);
    endfunction


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction
     //Implement wtite Function For uvm_analysis_imp
    function void write(FFT_Seq_Item req);
        item_q.push_back(req);
    endfunction

    task run_phase(uvm_phase phase);
	    FFT_Seq_Item item;
        super.run_phase(phase);
        // run();  
        forever begin
            
            wait(item_q.size>0);
            item = item_q.pop_front();
            for (int i=0; i<32; ++i) begin
                Adc_Input[i] = item.ADC_in_real[i];
                result_Real_part[i] = fixed_point_to_real(item.FFT_RESULT_real[i]);
                result_Imag_part[i] = fixed_point_to_real(item.FFT_RESULT_imag[i]);
                // `uvm_info(get_type_name(),$sformatf("%d %f %f\n",i,result_Real_part[i],result_Imag_part[i]),UVM_LOW);

            end
            result = FFT_Check_Result(Adc_Input,result_Real_part,result_Imag_part);
            `uvm_info(get_type_name(),$sformatf(" %m Result Is %d \n",result),UVM_LOW);
            $display("----------------------------------------------------------------------------------------------------------");
            `uvm_info(get_type_name(),"Inside Score Board\n",UVM_LOW);
            // printResult(item);  
            $display("----------------------------------------------------------------------------------------------------------");
            // FFT_Check_Result(Adc_Input,result_Real_part,result_Imag_part);
            
            
        end
    endtask
    
    function void printResult( ref FFT_Seq_Item#() mon_item);
        for (int i=0; i<32; ++i) begin
            `uvm_info(get_type_name(),$sformatf("%d_real %f\n",i,fixed_point_to_real(mon_item.FFT_RESULT_real[i])),UVM_LOW);
            `uvm_info(get_type_name(),$sformatf("%d_imag  %f\n",i,fixed_point_to_real(mon_item.FFT_RESULT_imag[i])),UVM_LOW);
        end 
    endfunction

      // Fixed-point number definition (32 bits with 16 bits fraction)
    typedef struct packed {
        logic signed [31:16] integer_part;
        logic unsigned [15:0] fractional_part;
    } fixed_point_t;

   // Function to convert fixed-point to real
    function real fixed_point_to_real(fixed_point_t num);
        real result;
        result = num.integer_part + (num.fractional_part / 65536.0);
        return result;
    endfunction
    task run();
    
    //callPyhon();
  endtask
 
   
    
endclass
