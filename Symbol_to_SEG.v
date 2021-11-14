module Symbol_to_SEG ( symbol, dp, SEG ) ;
	input [3:0] symbol ;
	input dp ;
	output [7:0] SEG ;
	
	reg [7:0] SEG ;
	
	always @ ( symbol ) begin		
		case( symbol )
			4'h0 : SEG [7:1] = 7'b1111110 ;
			4'h1 : SEG [7:1] = 7'b0110000 ;
			4'h2 : SEG [7:1] = 7'b1101101 ;
			4'h3 : SEG [7:1] = 7'b1111001 ;
			4'h4 : SEG [7:1] = 7'b0110011 ;
			4'h5 : SEG [7:1] = 7'b1011011 ;
			4'h6 : SEG [7:1] = 7'b1011111 ;
			4'h7 : SEG [7:1] = 7'b1110000 ;
			4'h8 : SEG [7:1] = 7'b1111111 ;
			4'h9 : SEG [7:1] = 7'b1111011 ;
			4'hA : SEG [7:1] = 7'b1110111 ;
			4'hB : SEG [7:1] = 7'b0011111 ; /* shown as 'b' */
			4'hC : SEG [7:1] = 7'b1001110 ;
			4'hD : SEG [7:1] = 7'b0111101 ; /* shown as 'd' */
			4'hE : SEG [7:1] = 7'b1001111 ;
			4'hF : SEG [7:1] = 7'b1000111 ;
		endcase
	end
	
	always @ ( dp ) SEG [0] = dp ;
endmodule