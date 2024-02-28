/******************************************************************************
*
* Module: CtrlShiftRegister
*
* File Name: CtrlShiftRegister.v
*
* Description: Shift register used to generate enable signal for # clk cycles
*
* Author: Ahmed Emad ,Bassem Essam 
******************************************************************************/

module CtrlShiftRegister #(parameter CLK_CYCLES =3) (

    input clk,
    input reset,
    input start,
    output internal_enable,
    output finish

);
    
 reg [CLK_CYCLES -1 :0] shiftReg;
//else
//   reg shiftReg ;
//endgenerate

reg internal_enable_delayed ;

generate 
if ( CLK_CYCLES >=3) 
 always @(posedge clk ,posedge reset) begin
    if (reset) begin
        shiftReg <= { {CLK_CYCLES}{1'b0} };
    end
    else if ( internal_enable == 1'b1 )
    begin
        shiftReg <= {1'b0,shiftReg[CLK_CYCLES-1:1]};
    end
    else if (start) begin
        shiftReg <= { {CLK_CYCLES}{1'b1} };
    end
    
 end
else if (CLK_CYCLES ==2) 
 always @(posedge clk ,posedge reset) begin
    if (reset) begin
        shiftReg <= { {CLK_CYCLES}{1'b0} };
    end
    else if ( internal_enable == 1'b1 )begin
        shiftReg <= {1'b0,shiftReg[1]};
    end
    else if (start) begin
        shiftReg <= { {CLK_CYCLES}{1'b1}  };
    end
 end
else if (CLK_CYCLES ==1) 
 always @(posedge clk ,posedge reset) begin
    if (reset) begin
        shiftReg <= { {CLK_CYCLES}{1'b0} };
    end
    else if ( internal_enable == 1'b1 )begin
        shiftReg <= {1'b0};
    end
    else if (start) begin
        shiftReg <= { {CLK_CYCLES}{1'b1}  };
    end
   
end

endgenerate

always @(posedge clk ,posedge reset) begin
    if (reset)
        internal_enable_delayed <= 1'b0;
    else if (internal_enable != internal_enable_delayed)
        internal_enable_delayed <= internal_enable;
end

assign internal_enable = shiftReg[0]; 
// Finish is pulse when the internal enable change from 0 to 1
assign finish = internal_enable_delayed & (!internal_enable);

endmodule