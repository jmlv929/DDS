module DDS(
	input	clk,
	input	rst_n,
	output	reg	[7:0]	cos_a,
	output	reg	signed	[7:0]	cos_b
);

//---------------------------------------//
parameter freq_a = 32'd4294967;		//N=2^32 * 10000 / 100M ----->100k
parameter freq_b = 32'd42949673;	//---->1M
parameter cnt_width = 8'd32;
//---------------------------------------//

//---------------------------------------//
reg		[cnt_width-1:0]	cnt_a = 0;
reg		[cnt_width-1:0]	cnt_b = 0;
wire 	[9:0]	addr_a;
wire	[9:0]	addr_b;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		cnt_a <= 0;
		cnt_b <= 0;
	end
	else	begin
		cnt_a <= cnt_a + freq_a;
		cnt_b <= cnt_b + freq_b;
	end
end

assign	addr_a = cnt_a[cnt_width-1:cnt_width-10];
assign	addr_b = cnt_b[cnt_width-1:cnt_width-10];
//------------------------------------------//

//-------------µ÷ÓÃROMºË---------------------//
wire	signed	[7:0]	cos_a_r;
wire	signed	[7:0]	cos_b_r;

blk_mem_gen_0 your_instance_name (
  .clka(clk),    // input wire clka
  .ena(1'b1),      // input wire ena
  .addra(addr_a),  // input wire [9 : 0] addra
  .douta(cos_a_r),  // output wire [7 : 0] douta
  .clkb(clk),    // input wire clkb
  .enb(1'b1),      // input wire enb
  .addrb(addr_b),  // input wire [9 : 0] addrb
  .doutb(cos_b_r)  // output wire [7 : 0] doutb
);
//-------------------------------------------//

//-------------------------------------------//
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		cos_a <= 0;
		cos_b <= 0;
	end
	else	begin
		cos_a <= cos_a_r + 8'd128;
		cos_b <= cos_b_r;
	end
end

endmodule 
