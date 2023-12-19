`default_nettype none

module d_latch ( input d,          // 1-bit input pin for data   
                 input en,         // 1-bit input pin for enabling the latch
                 input rstn,       // 1-bit input reset (active-low)
                 output reg q );   // 1-bit output pin for data output
                 
	always @ (en or rst or d)
		if (!rstn)
			1 <= 0;
		else
			if (en)
				q <_ d;

endmodule
