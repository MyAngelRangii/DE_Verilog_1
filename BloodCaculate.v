
module BloodCaculate(
		input [1:0] Father,
		input [1:0] Mother,
		input [1:0] Key,
		output reg [4:0] symbol
    );
	 //Key: 11代表AB，10代表A，01代表B，00代表O
	
	reg [3:0] A [0:3];//A映射表
	reg [3:0] B [0:3];
	reg [3:0] O [0:3];
	reg [3:0] XF,XM;
	reg [4:0] sum;
	always@(Key)begin
		//垃圾Verilog HDL不支持常量表，所以这里赋值
		A[0] = 4'b0000;
		A[1] = 4'b0000;
		A[2] = 4'b0111;
		A[3] = 4'b0011;
		B[0] = 4'b0000;
		B[1] = 4'b0111;
		B[2] = 4'b0000;
		B[3] = 4'b0011;
		O[0] = 4'b1111;
		O[1] = 4'b0001;
		O[2] = 4'b0001;
		O[3] = 4'b0000;
		symbol[4] = 0;
		sum = 0;
		case (Key)
		
		2'b11:begin//子代AB
			//父亲A基因转化为位，如3个A为2'b0111。然后每个A基因与母亲的等位基因结合（与运算），相加即得到结果，除以16得到概率。
			XF = A[Father];
			XM = B[Mother];
			sum = sum + (XF[0]&XM[0]) + (XF[0]&XM[1]) + (XF[0]&XM[2]) + (XF[0]&XM[3]) 
			+ (XF[1]&XM[0]) + (XF[1]&XM[1]) + (XF[1]&XM[2]) + (XF[1]&XM[3]) 
			+ (XF[2]&XM[0]) + (XF[2]&XM[1]) + (XF[2]&XM[2]) + (XF[2]&XM[3]) 
			+ (XF[3]&XM[0]) + (XF[3]&XM[1]) + (XF[3]&XM[2]) + (XF[3]&XM[3]);
			XF = B[Father];
			XM = A[Mother];
			sum = sum + (XF[0]&XM[0]) + (XF[0]&XM[1]) + (XF[0]&XM[2]) + (XF[0]&XM[3]) 
			+ (XF[1]&XM[0]) + (XF[1]&XM[1]) + (XF[1]&XM[2]) + (XF[1]&XM[3]) 
			+ (XF[2]&XM[0]) + (XF[2]&XM[1]) + (XF[2]&XM[2]) + (XF[2]&XM[3]) 
			+ (XF[3]&XM[0]) + (XF[3]&XM[1]) + (XF[3]&XM[2]) + (XF[3]&XM[3]);
			symbol = sum;
		end
		
		2'b10:begin//子代A
			XF = A[Father];
			XM = A[Mother];
		  sum = sum + (XF[0]&XM[0]) + (XF[0]&XM[1]) + (XF[0]&XM[2]) + (XF[0]&XM[3]) 
			+ (XF[1]&XM[0]) + (XF[1]&XM[1]) + (XF[1]&XM[2]) + (XF[1]&XM[3]) 
			+ (XF[2]&XM[0]) + (XF[2]&XM[1]) + (XF[2]&XM[2]) + (XF[2]&XM[3]) 
			+ (XF[3]&XM[0]) + (XF[3]&XM[1]) + (XF[3]&XM[2]) + (XF[3]&XM[3]);
			XF = A[Father];
			XM = O[Mother];
			sum = sum + (XF[0]&XM[0]) + (XF[0]&XM[1]) + (XF[0]&XM[2]) + (XF[0]&XM[3]) 
			+ (XF[1]&XM[0]) + (XF[1]&XM[1]) + (XF[1]&XM[2]) + (XF[1]&XM[3]) 
			+ (XF[2]&XM[0]) + (XF[2]&XM[1]) + (XF[2]&XM[2]) + (XF[2]&XM[3]) 
			+ (XF[3]&XM[0]) + (XF[3]&XM[1]) + (XF[3]&XM[2]) + (XF[3]&XM[3]);
			XF = O[Father];
			XM = A[Mother];
			sum = sum + (XF[0]&XM[0]) + (XF[0]&XM[1]) + (XF[0]&XM[2]) + (XF[0]&XM[3]) 
			+ (XF[1]&XM[0]) + (XF[1]&XM[1]) + (XF[1]&XM[2]) + (XF[1]&XM[3]) 
			+ (XF[2]&XM[0]) + (XF[2]&XM[1]) + (XF[2]&XM[2]) + (XF[2]&XM[3]) 
			+ (XF[3]&XM[0]) + (XF[3]&XM[1]) + (XF[3]&XM[2]) + (XF[3]&XM[3]);
			symbol = sum;
		end
		
		2'b01:begin//子代B
			XF = B[Father];
			XM = B[Mother];
			sum = sum + (XF[0]&XM[0]) + (XF[0]&XM[1]) + (XF[0]&XM[2]) + (XF[0]&XM[3]) 
			+ (XF[1]&XM[0]) + (XF[1]&XM[1]) + (XF[1]&XM[2]) + (XF[1]&XM[3]) 
			+ (XF[2]&XM[0]) + (XF[2]&XM[1]) + (XF[2]&XM[2]) + (XF[2]&XM[3]) 
			+ (XF[3]&XM[0]) + (XF[3]&XM[1]) + (XF[3]&XM[2]) + (XF[3]&XM[3]);
			XF = B[Father];
			XM = O[Mother];
			sum = sum + (XF[0]&XM[0]) + (XF[0]&XM[1]) + (XF[0]&XM[2]) + (XF[0]&XM[3]) 
			+ (XF[1]&XM[0]) + (XF[1]&XM[1]) + (XF[1]&XM[2]) + (XF[1]&XM[3]) 
			+ (XF[2]&XM[0]) + (XF[2]&XM[1]) + (XF[2]&XM[2]) + (XF[2]&XM[3]) 
			+ (XF[3]&XM[0]) + (XF[3]&XM[1]) + (XF[3]&XM[2]) + (XF[3]&XM[3]);
			XF = O[Father];
			XM = B[Mother];
			sum = sum + (XF[0]&XM[0]) + (XF[0]&XM[1]) + (XF[0]&XM[2]) + (XF[0]&XM[3]) 
			+ (XF[1]&XM[0]) + (XF[1]&XM[1]) + (XF[1]&XM[2]) + (XF[1]&XM[3]) 
			+ (XF[2]&XM[0]) + (XF[2]&XM[1]) + (XF[2]&XM[2]) + (XF[2]&XM[3]) 
			+ (XF[3]&XM[0]) + (XF[3]&XM[1]) + (XF[3]&XM[2]) + (XF[3]&XM[3]);
			symbol = sum;
		end
		
		2'b00:begin
			XF = O[Father];
			XM = O[Mother];
			sum = sum + (XF[0]&XM[0]) + (XF[0]&XM[1]) + (XF[0]&XM[2]) + (XF[0]&XM[3]) 
			+ (XF[1]&XM[0]) + (XF[1]&XM[1]) + (XF[1]&XM[2]) + (XF[1]&XM[3]) 
			+ (XF[2]&XM[0]) + (XF[2]&XM[1]) + (XF[2]&XM[2]) + (XF[2]&XM[3]) 
			+ (XF[3]&XM[0]) + (XF[3]&XM[1]) + (XF[3]&XM[2]) + (XF[3]&XM[3]);
			symbol = sum;
		end
		
		endcase
	end


endmodule

