`timescale 1ns/1ps

module	DDS_tb();

//-----------定义接口-------------//
reg 	sclk;
reg		rst_n;
wire 	[7:0]	cos_a;
wire	signed	[7:0]	cos_b;
//-------------------------------//

//----------时钟信号------------//
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