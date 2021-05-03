/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module SC_REG_GENERAL_NIDOS #(parameter RegNIDOS_DATAWIDTH=2, parameter DATA_FIXED_INITREG=2'b00)(
	//////////// OUTPUTS //////////
	RegNIDOS_data_OutBUS,
	RegSIN_VIDAS_OutLow,
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
output [1:0] RegSIN_VIDAS_OutLow;
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
reg [1:0] RegNivelCompletado;
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
		 RegNivelCompletado = 1'b0;
		
	else
		 RegNivelCompletado = 1'b1;
		
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
assign RegSIN_VIDAS_OutLow =  RegNivelCompletado;

endmodule