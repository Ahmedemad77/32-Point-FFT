
`include "uvm_macros.svh"
`include "FFT_Seq_Item.sv"
import uvm_pkg::*;

class FFT_Sequence#(parameter DATA_WIDTH = 32 ,ADC_DATA_WIDTH=8)  extends uvm_sequence;
    `uvm_object_utils (FFT_Sequence#(DATA_WIDTH,ADC_DATA_WIDTH));

    FFT_Seq_Item#(DATA_WIDTH,ADC_DATA_WIDTH) data;
    function  new(string name = "FFT_Sequence");
        super.new(name);
    endfunction

    task pre_body();
        `uvm_info(get_type_name(),"Inside pre_body Sequence",UVM_LOW);
        if(starting_phase!=null)begin
           starting_phase.raise_objection(this,"FFT sequence raised Objection"); 
        end
    endtask

    task body();
        `uvm_info(get_type_name(), "Inside Body Task ",UVM_LOW);
        data = FFT_Seq_Item#(DATA_WIDTH,ADC_DATA_WIDTH)::type_id::create("FFT Transction");
        wait_for_grant();
        void'(data.randomize());
        send_request(data);
        wait_for_item_done();

    endtask

    task post_body();
        `uvm_info(get_type_name(),"Inside  Seq post body ",UVM_NONE);
        if(starting_phase!=null)begin
           starting_phase.drop_objection(this,"mem sequence raised Objection"); 
        end
    endtask

endclass