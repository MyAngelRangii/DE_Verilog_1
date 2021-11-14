module Double_nixietube_by_segments ( Sys_CLK , COM, SEG, SEG_H, SEG_L, en );
	input Sys_CLK ;
	output [1:0] COM ;
	output [7:0] SEG ;
	input [7:0] SEG_H, SEG_L ;
	input en ;
	
	reg [7:0] SEG ;
	
  localparam DIV_FACTOR = 13'd5000 ;
	
	reg div_clk = 0 ;			/* Sys_CLK = 50MHz, div_clk = 5kHz */
	reg [ 12:0 ] div_cnt = 13'd0 ;
	reg COM_cnt = 0;				/* toggle count for COM */
	
	/* procedual block to divide the Sys_CLK */
	always @( posedge Sys_CLK ) begin
		if( div_cnt < DIV_FACTOR ) div_cnt <= div_cnt + 13'd1 ;
		else begin
			div_clk <= ~div_clk ;
			div_cnt <= 13'd0 ;
		end
	end
	
	always@(posedge div_clk) begin
		if ( en ) COM_cnt <= COM_cnt + 1'b1 ;
	end	
	
	assign COM = (en)?( ( COM_cnt )? 2'b10 : 2'b01 ) : 2'b00 ;
	
	always @ ( COM_cnt or SEG_H or SEG_L ) begin	/* a multiplexer */
		if ( COM_cnt == 1'b1 ) SEG = SEG_H ;
		else SEG = SEG_L ;
	end	
	
endmodule