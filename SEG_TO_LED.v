module SEG_TO_LED( symbol, dp, SEG ) ;
	input [4:0] symbol ;
	input dp ;
	output reg[7:0] SEG ;
	
	wire [7:0] SEG_temp;
	reg [3:0] symbol_3d;//3位symbol
	
	Symbol_to_SEG repack(.symbol(symbol_3d),.dp(dp),.SEG(SEG_temp));
	
	always@(symbol or SEG_temp)begin//等待SEG_temp变化
		
		if(symbol == 5'b10000)begin
			symbol_3d = 5'b0;
			SEG[7:1] = 7'b0110111;
			SEG[0] = dp;
		end
		else begin
			symbol_3d = symbol[3:0];
			SEG = SEG_temp;
		end
		
	end
	
	
	
endmodule