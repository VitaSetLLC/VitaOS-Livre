module BitBitJump_64Bit(input clk);
	reg BBJreg[191:0] = 0;
	reg memory[18446744073709551615:0] = 0;
	reg BBJipAddr[63:0] = 0;
	reg BBJsrcAddr[63:0] = 0;
	reg BBJdestAddr[63:0] = 0;
	initial
		BBJipAddr[7:0] = 8'b10111111;
	always @(posedge clk)
		begin
			BBJreg[191:0] <= memory[BBJipAddr-:192];
			BBJipAddr[63:0] <= BBJreg[191:128];
			BBJsrcAddr[63:0] <= BBJreg[127:64];
			BBJdestAddr[63:0] <= BBJreg[63:0];
			BBJreg[192:192] <= memory[BBJsrcAddr];
			memory[BBJdestAddr] <= BBJreg[192:192];
		end
endmodule
