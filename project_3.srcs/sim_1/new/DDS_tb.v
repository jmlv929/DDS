`timescale 1ns/1ps

module	DDS_tb();

//-----------����ӿ�-------------//
reg 	sclk;
reg		rst_n;
wire 	[7:0]	cos_a;
wire	signed	[7:0]	cos_b;
//-------------------------------//

//----------ʱ���ź�------------//
initial		sclk = 1;
always	#5	sclk = ~sclk;
//-----------------------------//

initial		begin
	rst_n = 0;
	#500
	rst_n = 1;
end
//------------------------------//
DDS	DDS_0(
	.clk	(sclk),
	.rst_n	(rst_n),
	.cos_a	(cos_a),
	.cos_b	(cos_b)
);


endmodule