`default_nettype none
module VitaFieldProgrammableGateArrayArchitectureLogicBlock(InputNorthLine, InputEastLine, InputSouthLine, InputWestLine, OutputNorthLine, OutputEastLine, OutputSouthLine, OutputWestLine, ClockLine, ReInitializationWriteEnableLine, ReInitializationLines);
	input wire [0:0] InputNorthLine;
	input wire [0:0] InputEastLine;
	input wire [0:0] InputSouthLine;
	input wire [0:0] InputWestLine;
	output wire [0:0] OutputNorthLine;
	output wire [0:0] OutputEastLine;
	output wire [0:0] OutputSouthLine;
	output wire [0:0] OutputWestLine;
	input wire [0:0] ClockLine;
	input wire [0:0] ReInitializationWriteEnableLine;
	input wire [6:0] ReInitializationLines;
	reg [0:0] OutputNorthReg = 1'b0;
	reg [0:0] OutputEastReg = 1'b0;
	reg [0:0] OutputSouthReg = 1'b0;
	reg [0:0] OutputWestReg = 1'b0;
	reg [2:0] IOReconfigurationTripleDTypeFlipFlopRegister = 3'b000;
	reg [3:0] LookUpTableQuadrupleDTypeFlipFlopRegister = 4'b0000;
	assign OutputNorthLine[0:0] = OutputNorthReg[0:0];
	assign OutputEastLine[0:0] = OutputEastReg[0:0];
	assign OutputSouthLine[0:0] = OutputSouthReg[0:0];
	assign OutputWestLine[0:0] = OutputWestReg[0:0];
	always @(posedge ClockLine) begin
		if (ReInitializationWriteEnableLine[0:0] == 1'b1) begin
			IOReconfigurationTripleDTypeFlipFlopRegister[2:0] <= ReInitializationLines[6:4];
			LookUpTableQuadrupleDTypeFlipFlopRegister[3:0] <= ReInitializationLines[3:0];
		end else begin
			OutputNorthReg[0:0] <= ( ( ( ( ( ~ InputEastLine[0:0] ) &
				( ~ InputSouthLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputEastLine[0:0] ) &
				InputSouthLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputEastLine[0:0] &
				( ~ InputSouthLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputEastLine[0:0] &
				InputSouthLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) |
				( ( ( ( ~ InputEastLine[0:0] ) &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputEastLine[0:0] ) &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputEastLine[0:0] &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputEastLine[0:0] &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( IOReconfigurationTripleDTypeFlipFlopRegister[2:2] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) |
				( ( ( ( ~ InputSouthLine[0:0] ) &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputSouthLine[0:0] ) &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputSouthLine[0:0] &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputSouthLine[0:0] &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[1:1] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) );
			OutputEastReg[0:0] <= ( ( ( ( ( ~ InputNorthLine[0:0] ) &
				( ~ InputSouthLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputNorthLine[0:0] ) &
				InputSouthLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputNorthLine[0:0] &
				( ~ InputSouthLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputNorthLine[0:0] &
				InputSouthLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( IOReconfigurationTripleDTypeFlipFlopRegister[2:2] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) |
				( ( ( ( ~ InputNorthLine[0:0] ) &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputNorthLine[0:0] ) &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputNorthLine[0:0] &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputNorthLine[0:0] &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[1:1] &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) |
				( ( ( ( ~ InputSouthLine[0:0] ) &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputSouthLine[0:0] ) &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputSouthLine[0:0] &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputSouthLine[0:0] &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[1:1] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) );
			OutputSouthReg[0:0] <= ( ( ( ( ( ~ InputNorthLine[0:0] ) &
				( ~ InputEastLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputNorthLine[0:0] ) &
				InputEastLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputNorthLine[0:0] &
				( ~ InputEastLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputNorthLine[0:0] &
				InputEastLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) |
				( ( ( ( ~ InputNorthLine[0:0] ) &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputNorthLine[0:0] ) &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputNorthLine[0:0] &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputNorthLine[0:0] &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[1:1] &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) |
				( ( ( ( ~ InputEastLine[0:0] ) &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputEastLine[0:0] ) &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputEastLine[0:0] &
				( ~ InputWestLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputEastLine[0:0] &
				InputWestLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( IOReconfigurationTripleDTypeFlipFlopRegister[2:2] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) );
			OutputWestReg[0:0] <= ( ( ( ( ( ~ InputNorthLine[0:0] ) &
				( ~ InputEastLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputNorthLine[0:0] ) &
				InputEastLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputNorthLine[0:0] &
				( ~ InputEastLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputNorthLine[0:0] &
				InputEastLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) |
				( ( ( ( ~ InputNorthLine[0:0] ) &
				( ~ InputSouthLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputNorthLine[0:0] ) &
				InputSouthLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputNorthLine[0:0] &
				( ~ InputSouthLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputNorthLine[0:0] &
				InputSouthLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( IOReconfigurationTripleDTypeFlipFlopRegister[2:2] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) |
				( ( ( ( ~ InputEastLine[0:0] ) &
				( ~ InputSouthLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ InputEastLine[0:0] ) &
				InputSouthLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( InputEastLine[0:0] &
				( ~ InputSouthLine[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( InputEastLine[0:0] &
				InputSouthLine[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) );
		end
	end
endmodule
