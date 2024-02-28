
`include "uvm_macros.svh"
`include "FFT_Seq_Item.sv"
import uvm_pkg::*;
`uvm_analysis_imp_decl (_input)
`uvm_analysis_imp_decl (_output)
//,input float result_Real_part[],input float result_Imag_part[]
import "DPI-C" context function int FFT_Check_Result(input int v[],input real result_Real_part[],input real result_Imag_part[] );
import "DPI-C" context function void init();
import "DPI-C" context function void finalize();

//Define 32 real vector that for real part of the Result and Imaginary Part 
class FFT_ScoreBoard extends uvm_scoreboard;


   `uvm_component_utils(FFT_ScoreBoard);
    uvm_analysis_imp_input #(FFT_Seq_Item,FFT_ScoreBoard) input_item_collect_export;
    uvm_analysis_imp_output #(FFT_Seq_Item,FFT_ScoreBoard) output_item_collect_export;

    FFT_Seq_Item input_item_q[$];
    FFT_Seq_Item output_item_q[$];
    int Adc_Input[32];
    real result_Real_part[32];
    real result_Imag_part[32];
    integer result;
    function  new(string name = "FFT_ScoreBoard", uvm_component parent = null);
        super.new(name,parent);
        input_item_collect_export = new("input_item_collect_export",this);
        output_item_collect_export = new("output_item_collect_export",this);

    endfunction


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction
     //Implement wtite Function For uvm_analysis_imp
    function void write_input(FFT_Seq_Item req);
        `uvm_info(get_type_name(),"Write Input Is called",UVM_LOW);
        input_item_q.push_back(req);
    endfunction

    function void write_output(FFT_Seq_Item req);
        `uvm_info(get_type_name(),"Write output Is called",UVM_LOW);
        output_item_q.push_back(req);
    endfunction

    task run_phase(uvm_phase phase);
	    FFT_Seq_Item item;
        super.run_phase(phase);
         init();
        forever begin
            wait(input_item_q.size>0);
            item = input_item_q.pop_front();
            //Get the input 
            for (int i=0; i<32; ++i) begin
                Adc_Input[i] = item.ADC_in_real[i];
            end
            wait(output_item_q.size>0);
            item = output_item_q.pop_front();
            
            // Wait for the Output 
            for (int i=0; i<32; ++i) begin
                result_Real_part[i] = fixed_point_to_real(item.FFT_RESULT_real[i]);
                result_Imag_part[i] = fixed_point_to_real(item.FFT_RESULT_imag[i]);
                // `uvm_info(get_type_name(),$sformatf("%d %d %f %f\n",i,Adc_Input[i],result_Real_part[i],result_Imag_part[i]),UVM_LOW);
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
    
    function void final_phase(uvm_phase phase);
        super.final_phase(phase);
        finalize();
    endfunction
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
