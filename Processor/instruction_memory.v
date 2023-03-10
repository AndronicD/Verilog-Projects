///////////////////////////////////////INSTRUCTION_MEMORY/////////////////////////////////////////////////////
module instruction_memory(input [9:0] address,
                          output reg [31:0] instruction);
 
  reg [31:0] codeMemory [0:1023];
  
  initial $readmemh("code.mem", codeMemory);
  
  always@(address) begin
    instruction <= codeMemory[address];
  end

endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
