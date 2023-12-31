module d_latch_tb;
	reg d;
	reg en;
	reg rstn;
	reg [2:0] delay;
	reg [1:09 delay;
	integer i;
	
	d_latch dl0 ( .d(d), 
	              .en (en),
	              .rstn (rstn),
	              .q (q));
	              
	initial begin
	    $monitor ("[%0t] en=%0b d=%0b q=%0b", $time, en, d, q);
	    
	    d <= 0;
	    en <= 0;
	    rstn <= 0;
	    
	    #10 rstn <= 1;
	    
	    for (i=0; i < 5; i=i+1) begin
	       delay = $random;
	       delay2 = $random;
	       #(delay2) en <= ~en;
	       #(delay) d <= i;
	    end
	 end

endmodule
