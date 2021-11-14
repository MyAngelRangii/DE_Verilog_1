
module BloodCaculate(
		input [1:0] Father,
		input [1:0] Mother,
		input [1:0] Key,
		output reg [4:0] symbol
    );
	 //Key: 11����AB��10����A��01����B��00����O
	
	reg [3:0] A [0:3];//Aӳ���
	reg [3:0] B [0:3];
	reg [3:0] O [0:3];
	reg [3:0] XF,XM;
	reg [4:0] sum;
	always@(Key)begin
		//����Verilog HDL��֧�ֳ������������︳ֵ
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
		
		2'b11:begin//�Ӵ�AB
			//����A����ת��Ϊλ����3��AΪ2'b0111��Ȼ��ÿ��A������ĸ�׵ĵ�λ�����ϣ������㣩����Ӽ��õ����������16�õ����ʡ�
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
		
		2'b10:begin//�Ӵ�A
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
		
		2'b01:begin//�Ӵ�B
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

