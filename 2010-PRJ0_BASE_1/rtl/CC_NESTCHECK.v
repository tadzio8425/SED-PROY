//=======================================================
//  MODULE Definition
//=======================================================
module CC_NESTCHECK #(parameter NESTCHECK_DATAWIDTH=8)(
	
	CC_NESTCHECK_OutLow,

	CC_NESTCHECK_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_NESTCHECK_OutLow;
input 	[NESTCHECK_DATAWIDTH-1:0] CC_NESTCHECK_data_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(CC_NESTCHECK_data_InBUS, CC_NESTCHECK_OutLow)
begin
	if( CC_NESTCHECK_data_InBUS == 8'b00100000 || CC_NESTCHECK_data_InBUS == 8'b00000100)
		CC_NESTCHECK_OutLow = 1'b0;
	else 
		CC_NESTCHECK_OutLow = 1'b1;
end

endmodule
