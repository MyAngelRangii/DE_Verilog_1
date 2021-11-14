
module YF(input [4:0] high,
	output reg[4:0] high_o,
	output reg[4:0] low_o
    );//���ģ�鸺��Լ��
	reg [4:0] num;
	always@(high)begin
		num = (high & -high);//λ���㼼�ɣ�ֻ��������͵ķ���λ������λȫΪ0����11010������Ϊ00010��
		
		case (num)
			5'b01000:begin
				high_o = high>>3;
				low_o = 5'b10000>>3;
			end
			5'b00100:begin
				high_o = high>>2;
				low_o = 5'b10000>>2;
			end
			5'b00010:begin
				high_o = high>>1;
				low_o = 5'b10000>>1;
			end
			5'b00001:begin
				high_o = high;
				low_o = 5'b10000;
			end
			5'b10000:begin
				high_o = high>>4;
				low_o = 5'b10000>>4;
			end
		endcase
	end

endmodule