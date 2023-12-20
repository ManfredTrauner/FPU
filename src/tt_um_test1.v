`default_nettype none


module tt_um_test1 (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  reg [10:0] operand_a_mant;
  reg [10:0] operand_b_mant;
  reg [21:0] iresult_mant;


    // use bidirectionals as outputs
    assign uio_oe = 8'b11111111;
    assign uio_out = 8'hFF;
    assign uo_out = 8'hFF;

    wire reset;
    assign reset = !rst_n;

    // external clock is 10MHz, so need 24 bit counter
    reg [23:0] second_counter;
    reg [3:0] digit;

 assign operand_a_mant = 11'b00011110000;
 assign operand_b_mant = 11'b11100001111;

 
    always @(posedge clk or posedge reset) begin
        // if reset, set counter to 0
        if (reset) begin
            second_counter <= 0;
            digit <= 0;
            iresult_mant <= operand_a_mant * operand_b_mant;
        end 
    end
    
 


endmodule
