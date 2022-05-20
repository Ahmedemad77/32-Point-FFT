`timescale 1ns / 1ps


module 
 Mux_6_2 #(parameter
	DATA_WIDTH = 32,INTEGER = 16,FRACTION= 16)
    (
    input [DATA_WIDTH-1:0] in2_real,
    input [DATA_WIDTH-1:0] in2_imag,

    input [DATA_WIDTH-1:0] constant_real,
    input [DATA_WIDTH-1:0] constant_imag,
    
	input  [1:0] sel,

    output reg [DATA_WIDTH-1:0] out_1,
    output reg [DATA_WIDTH-1:0] out_2
    
    
    );
   always @(*) begin
       case (sel)
           2'b00: begin
               out_1 = constant_real ;
               out_2 = in2_real ;
               
           end
           
           2'b01: begin

               out_1 = constant_imag;  //{{{constant_imag[DATA_WIDTH-1:DATA_WIDTH-INTEGER] ^ {INTEGER{1'b1}}}+1'b1},constant_imag[FRACTION-1:0]}  ;
               out_2 = in2_imag ;
               
           end
           
           2'b10: begin
               
               out_1 = constant_imag ;
               out_2 = in2_real ;
               
           end
           
           2'b11: begin    
               
               out_1 = constant_real ;
               out_2 = in2_imag ;

           end
           
           default: begin
               
               out_1 = constant_real ;
               out_2 = in2_imag ;
              
           end
       endcase
   end
endmodule
