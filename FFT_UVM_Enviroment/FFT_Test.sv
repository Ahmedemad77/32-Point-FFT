
`timescale 1ns / 1ps
//FFT Configration 


`include "uvm_macros.svh"
import uvm_pkg::*;
`include "FFT_Configrations.svh"
`include "FFT_Env.sv"
`include "FFT_Sequence.sv"



class FFT_Test extends uvm_test;
    `uvm_component_utils(FFT_Test);
    FFT_Env env;
    FFT_Sequence seq;
    function  new(string name ="FFT_Test",uvm_component parent =null);
        super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = FFT_Env::type_id::create("env",this);
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name()," Inside Test Class",UVM_LOW);
        seq = FFT_Sequence#(`DATA_WIDTH,`ADC_DATA_WIDTH)::type_id::create("testSequence");
        void'(seq.randomize());
        seq.start(env.agentInstanse.SequencerInstanse);
        #1000
        phase.drop_objection(this);
    endtask

endclass




module FFT_Test;
    
    logic clk; 
    logic reset;

    //Instaniate Interface 
    FFT_Dut_Interface#(32,8)Intf(clk,reset);

    virtual FFT_Dut_Interface vinf ;
    //Instaniate the DUT 
    FFT_32  #( .DATA_WIDTH(32),.INTEGER(16),.FRACTION(16) ) UUT (
    .clk(clk),
    .reset(reset),
    .PU_enable(Intf.PU_enable),
    .ADC_in0_real(Intf.ADC_in_real[0]),
    .ADC_in1_real(Intf.ADC_in_real[1]),
    .ADC_in2_real(Intf.ADC_in_real[2]),
    .ADC_in3_real(Intf.ADC_in_real[3]),
    .ADC_in4_real(Intf.ADC_in_real[4]),
    .ADC_in5_real(Intf.ADC_in_real[5]),
    .ADC_in6_real(Intf.ADC_in_real[6]),
    .ADC_in7_real(Intf.ADC_in_real[7]),
    .ADC_in8_real(Intf.ADC_in_real[8]),
    .ADC_in9_real(Intf.ADC_in_real[9]),
    .ADC_in10_real(Intf.ADC_in_real[10]),
    .ADC_in11_real(Intf.ADC_in_real[11]),
    .ADC_in12_real(Intf.ADC_in_real[12]),
    .ADC_in13_real(Intf.ADC_in_real[13]),
    .ADC_in14_real(Intf.ADC_in_real[14]),
    .ADC_in15_real(Intf.ADC_in_real[15]),
    .ADC_in16_real(Intf.ADC_in_real[16]),
    .ADC_in17_real(Intf.ADC_in_real[17]),
    .ADC_in18_real(Intf.ADC_in_real[18]),
    .ADC_in19_real(Intf.ADC_in_real[19]),
    .ADC_in20_real(Intf.ADC_in_real[20]),
    .ADC_in21_real(Intf.ADC_in_real[21]),
    .ADC_in22_real(Intf.ADC_in_real[22]),
    .ADC_in23_real(Intf.ADC_in_real[23]),
    .ADC_in24_real(Intf.ADC_in_real[24]),
    .ADC_in25_real(Intf.ADC_in_real[25]),
    .ADC_in26_real(Intf.ADC_in_real[26]),
    .ADC_in27_real(Intf.ADC_in_real[27]),
    .ADC_in28_real(Intf.ADC_in_real[28]),
    .ADC_in29_real(Intf.ADC_in_real[29]),
    .ADC_in30_real(Intf.ADC_in_real[30]),
    .ADC_in31_real(Intf.ADC_in_real[31]),
    .FFT_RESULT_0_real(Intf.FFT_RESULT_real[0]),
    .FFT_RESULT_0_imag(Intf.FFT_RESULT_imag[0]),
    .FFT_RESULT_1_real(Intf.FFT_RESULT_real[1]),
    .FFT_RESULT_1_imag(Intf.FFT_RESULT_imag[1]),
    .FFT_RESULT_2_real(Intf.FFT_RESULT_real[2]),
    .FFT_RESULT_2_imag(Intf.FFT_RESULT_imag[2]),
    .FFT_RESULT_3_real(Intf.FFT_RESULT_real[3]),
    .FFT_RESULT_3_imag(Intf.FFT_RESULT_imag[3]),
    .FFT_RESULT_4_real(Intf.FFT_RESULT_real[4]),
    .FFT_RESULT_4_imag(Intf.FFT_RESULT_imag[4]),
    .FFT_RESULT_5_real(Intf.FFT_RESULT_real[5]),
    .FFT_RESULT_5_imag(Intf.FFT_RESULT_imag[5]),
    .FFT_RESULT_6_real(Intf.FFT_RESULT_real[6]),
    .FFT_RESULT_6_imag(Intf.FFT_RESULT_imag[6]),
    .FFT_RESULT_7_real(Intf.FFT_RESULT_real[7]),
    .FFT_RESULT_7_imag(Intf.FFT_RESULT_imag[7]),
    .FFT_RESULT_8_real(Intf.FFT_RESULT_real[8]),
    .FFT_RESULT_8_imag(Intf.FFT_RESULT_imag[8]),
    .FFT_RESULT_9_real(Intf.FFT_RESULT_real[9]),
    .FFT_RESULT_9_imag(Intf.FFT_RESULT_imag[9]),
    .FFT_RESULT_10_real(Intf.FFT_RESULT_real[10]),
    .FFT_RESULT_10_imag(Intf.FFT_RESULT_imag[10]),
    .FFT_RESULT_11_real(Intf.FFT_RESULT_real[11]),
    .FFT_RESULT_11_imag(Intf.FFT_RESULT_imag[11]),
    .FFT_RESULT_12_real(Intf.FFT_RESULT_real[12]),
    .FFT_RESULT_12_imag(Intf.FFT_RESULT_imag[12]),
    .FFT_RESULT_13_real(Intf.FFT_RESULT_real[13]),
    .FFT_RESULT_13_imag(Intf.FFT_RESULT_imag[13]),
    .FFT_RESULT_14_real(Intf.FFT_RESULT_real[14]),
    .FFT_RESULT_14_imag(Intf.FFT_RESULT_imag[14]),
    .FFT_RESULT_15_real(Intf.FFT_RESULT_real[15]),
    .FFT_RESULT_15_imag(Intf.FFT_RESULT_imag[15]),
    .FFT_RESULT_16_real(Intf.FFT_RESULT_real[16]),
    .FFT_RESULT_16_imag(Intf.FFT_RESULT_imag[16]),
    .FFT_RESULT_17_real(Intf.FFT_RESULT_real[17]),
    .FFT_RESULT_17_imag(Intf.FFT_RESULT_imag[17]),
    .FFT_RESULT_18_real(Intf.FFT_RESULT_real[18]),
    .FFT_RESULT_18_imag(Intf.FFT_RESULT_imag[18]),
    .FFT_RESULT_19_real(Intf.FFT_RESULT_real[19]),
    .FFT_RESULT_19_imag(Intf.FFT_RESULT_imag[19]),
    .FFT_RESULT_20_real(Intf.FFT_RESULT_real[20]),
    .FFT_RESULT_20_imag(Intf.FFT_RESULT_imag[20]),
    .FFT_RESULT_21_real(Intf.FFT_RESULT_real[21]),
    .FFT_RESULT_21_imag(Intf.FFT_RESULT_imag[21]),
    .FFT_RESULT_22_real(Intf.FFT_RESULT_real[22]),
    .FFT_RESULT_22_imag(Intf.FFT_RESULT_imag[22]),
    .FFT_RESULT_23_real(Intf.FFT_RESULT_real[23]),
    .FFT_RESULT_23_imag(Intf.FFT_RESULT_imag[23]),
    .FFT_RESULT_24_real(Intf.FFT_RESULT_real[24]),
    .FFT_RESULT_24_imag(Intf.FFT_RESULT_imag[24]),
    .FFT_RESULT_25_real(Intf.FFT_RESULT_real[25]),
    .FFT_RESULT_25_imag(Intf.FFT_RESULT_imag[25]),
    .FFT_RESULT_26_real(Intf.FFT_RESULT_real[26]),
    .FFT_RESULT_26_imag(Intf.FFT_RESULT_imag[26]),
    .FFT_RESULT_27_real(Intf.FFT_RESULT_real[27]),
    .FFT_RESULT_27_imag(Intf.FFT_RESULT_imag[27]),
    .FFT_RESULT_28_real(Intf.FFT_RESULT_real[28]),
    .FFT_RESULT_28_imag(Intf.FFT_RESULT_imag[28]),
    .FFT_RESULT_29_real(Intf.FFT_RESULT_real[29]),
    .FFT_RESULT_29_imag(Intf.FFT_RESULT_imag[29]),
    .FFT_RESULT_30_real(Intf.FFT_RESULT_real[30]),
    .FFT_RESULT_30_imag(Intf.FFT_RESULT_imag[30]),
    .FFT_RESULT_31_real(Intf.FFT_RESULT_real[31]),
    .FFT_RESULT_31_imag(Intf.FFT_RESULT_imag[31])
    );

    initial begin
        vinf = Intf;
        //sET THE vIRTUAL interface 
        uvm_config_db#(virtual FFT_Dut_Interface)::set(null,"uvm_test_top.*","FFT_INTERFACE",vinf);
        run_test("FFT_Test");
    end


    initial begin
        reset_task();
        clk_task();
    end

    // Define Reset Task 
    task reset_task();
    clk = 1;
    reset = 1'b1;
    #100
    reset = 1'b0;
    endtask
    // Define Clk Task 
    task clk_task();
    forever begin
        #(`CLK_PERIOD/2)
        clk = ~clk;
    end
    endtask

endmodule