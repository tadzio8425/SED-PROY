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
module SC_RegNIVEL #(parameter REG_GENERAL_NIVE_DATAWIDTH=2, parameter DATA_FIXED_INITREG=2'b00)(
	//////////// OUTPUTS //////////
	SC_RegNIVEL_data_OutBUS,
	//////////// INPUTS //////////
	SC_RegNIVEL_CLOCK_50,
	SC_RegNIVEL_RESET_InHigh,
	SC_RegNIVEL_clear_InLow, 
	SC_RegNIVEL_load_InLow, 
	SC_RegNIVEL_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[RegNIVEL_DATAWIDTH-1:0]	SC_RegNIVEL_data_OutBUS;
input		SC_RegNIVEL_CLOCK_50;
input		SC_RegNIVEL_RESET_InHigh;
input		SC_RegNIVEL_clear_InLow;
input		SC_RegNIVEL_load_InLow;	
input		[RegNIVEL_DATAWIDTH-1:0]	SC_RegNIVEL_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegNIVEL_DATAWIDTH-1:0] RegNIVEL_Register;
reg [RegNIVEL_DATAWIDTH-1:0] RegNIVEL_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_RegNIVEL_clear_InLow == 1'b0)
		RegNIVEL_Signal = DATA_FIXED_INITREG;
	else if (SC_RegNIVEL_load_InLow == 1'b0)
		RegNIVEL_Signal = SC_RegNIVEL_data_InBUS;
	else if (SC_RegNIVEL_shiftselection_In == 2'b01)
		RegNIVEL_Signal = {RegNIVEL_Register[RegNIVEL_DATAWIDTH-2:0],RegNIVEL_Register[RegNIVEL_DATAWIDTH-1]};
	else
		RegNIVEL_Signal = RegNIVEL_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_RegNIVEL_CLOCK_50, posedge SC_RegNIVEL_RESET_InHigh)
begin
	if (SC_RegNIVEL_RESET_InHigh == 1'b1)
		RegNIVEL_Register <= 0;
	else
		RegNIVEL_Register <= RegNIVEL_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_RegNIVEL_data_OutBUS = RegNIVEL_Register;

endmodule