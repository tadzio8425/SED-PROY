




module SC_REG_GENERAL_NIDOS #(parameter RegNIDOS_DATAWIDTH=2, parameter DATA_FIXED_INITREG=2'b00)(
	//////////// OUTPUTS //////////
	RegNIDOS_data_OutBUS,
	RegNIDOLLENO_OutLow,
	//////////// INPUTS //////////
	RegNIDOS_CLOCK_50,
	RegNIDOS_RESET_InHigh,
	RegNIDOS_clear_InLow, 
	RegNIDOS_load_InLow, 
	RegNIDOS_data_InBUS,
	RegNIDOS_nido_alcanzado_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[RegNIDOS_DATAWIDTH-1:0]	RegNIDOS_data_OutBUS;
output 		[1-1:0] RegNIDOLLENO_OutLow;

input		RegNIDOS_CLOCK_50;
input		RegNIDOS_RESET_InHigh;
input		RegNIDOS_clear_InLow;
input		RegNIDOS_load_InLow;	
input		RegNIDOS_nido_alcanzado_InLow;	
input		[RegNIDOS_DATAWIDTH-1:0]	RegNIDOS_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegNIDOS_DATAWIDTH-1:0] RegNIDOS_Register;
reg [RegNIDOS_DATAWIDTH-1:0] RegNIDOS_Signal;

reg [1-1:0] RegNidosLlenos;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (RegNIDOS_clear_InLow == 1'b0)
		RegNIDOS_Signal = DATA_FIXED_INITREG;
	else if (RegNIDOS_load_InLow == 1'b0)
		RegNIDOS_Signal = RegNIDOS_data_InBUS;
		
	else if (RegNIDOS_nido_alcanzado_InLow == 1'b0)
		RegNIDOS_Signal = RegNIDOS_Register + 2'b01;
	
	else
		RegNIDOS_Signal = RegNIDOS_Register;
	
	
	if (RegNIDOS_Register == 2'b10)
		RegNidosLlenos = 1'b0;
		
	else
		RegNidosLlenos = 1'b1;
		
end	
//STATE REGISTER: SEQUENTIAL
always @(posedge RegNIDOS_CLOCK_50, posedge RegNIDOS_RESET_InHigh)
begin
	if (RegNIDOS_RESET_InHigh == 1'b1)
		RegNIDOS_Register <= 0;
	else
		RegNIDOS_Register <= RegNIDOS_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign RegNIDOS_data_OutBUS = RegNIDOS_Register;
assign RegNIDOLLENO_OutLow = RegNidosLlenos;
endmodule