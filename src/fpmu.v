// IEEE 754 
// FP16 (float16) half-precision floating-point format
// 1-bit sign
// 5-bit exponent
// 11-bit mantissa (10 bits are stored because of normalizsation

// for first testing mantisa have got length of 11 bits
// is used to check if fmpu is realizable with given contraints of 
// maximal numbers of transistors


module fpmu (
  input wire       clk_alu,
  input reg [10:0] operand_a_mant,
  input reg [10:0] operand_b_mant,
  input reg [4:0]  operand_a_exp,  
  input reg [4:0]  operand_b_exp,
  input reg [0:0]  operand_a_sign,
  input reg [0:0]  operand_b_sign,
  output reg [21:0]  result_mant, // max number of digits of 11 x 11 bit multiplication is 22 bit  
  output reg [5:0]   result_exp, //max number of digits of 5 bit + 5 bit addition is 6 bit
  output reg [0:0]   result_sign
  );
  
  //internal data storage 
  reg [21:0] iresult_mant;
  reg [5:0]  iresult_exp;
  reg [0:0]  iresult_sign;
  
  
  // Sign multiplication
  always @(posedge clk_alu) begin
     result_sign <= operand_a_sign ^ operand_b_sign;
  end
  
  
  // Mantissa multiplication
  always @(posedge clk_alu) begin
     iresult_mant <= operand_a_mant * operand_b_mant;
  end
  
  
 // Exponentent addition
 always @(posedge clk_alu) begin
    iresult_exp <= operand_a_exp + operand_b_exp;
 end
 
 endmodule
 
