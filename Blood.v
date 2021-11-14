`timescale 1ns / 1ps

module Blood(input Sys_CLK,
	input [1:0] Switch,
	input [1:0] Key,
	output [7:0] SEG,
	output [1:0] COM,
	output [3:0] LED,
	input Sys_RST
    );
	 wire [7:0] SEG_H;
	 wire [7:0] SEG_L;
	 wire [4:0] High_Digit;//����
	 wire [4:0] Low_Digit_O;//Լ����ĸ
	 wire [4:0] High_Digit_O;//Լ������
	 //�԰���Key[1]ΪA������Key[0]ΪB��Switch[1]Ϊ���ף�Switch[0]Ϊĸ�ס�
	 reg [1:0] Father,Mother;
	 
	 //����
	 always@(posedge Switch[1])begin
		if(Switch[1])begin
			Father <= Key;
		end
	 end
	 
	 always@(posedge Switch[0])begin
		if(Switch[0])begin
			Mother <= Key;
		end
	 end
	 
	 BloodCaculate caculate(.Father(Father),.Mother(Mother),.Key(Key),.symbol(High_Digit));
	 //Com[0]����ʮλ
	 assign LED = {Father,Mother};
	 //��Լ��
	 YF u1(.high(High_Digit),.high_o(High_Digit_O),.low_o(Low_Digit_O));
	 
	 SEG_TO_LED display1( .symbol(High_Digit_O), .dp(0), .SEG(SEG_H) );
	 SEG_TO_LED display2( .symbol(Low_Digit_O), .dp(0), .SEG(SEG_L) );
	 //SEG�����SEG�����display_gen��SEG_H��L
	 Double_nixietube_by_segments display_gen(.Sys_CLK(Sys_CLK) , .COM(COM), .SEG(SEG), .SEG_H(SEG_L), .SEG_L(SEG_H), .en(1));
	 
	 
endmodule