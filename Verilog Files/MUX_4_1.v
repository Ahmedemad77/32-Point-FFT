`timescale 1ns / 1ps


module 
 Mux_4_1 #(parameter
	DATA_WIDTH = 32)
    (
    input [DATA_WIDTH-1:0] in1_real,
    input [DATA_WIDTH-1:0] in1_imag,
    
    input [DATA_WIDTH-1:0] reg_out_real,
    input [DATA_WIDTH-1:0] reg_out_imag,

    
	input  [1:0] sel,

    output reg [DATA_WIDTH-1:0] Mux_out
    
    
    );
   always @(*) begin
       case (sel)
           2'b00: begin

               Mux_out = in1_real;

           end
           
           2'b01: begin

               Mux_out = reg_out_real;
               
           end
           
           2'b10: begin
               
               Mux_out = in1_imag;
                              
           end
           
           2'b11: begin    
               
               Mux_out = reg_out_imag;
               
           end
           
           default: begin
               
                 Mux_out = reg_out_imag;
              
           end
       endcase
   end
endmodule
