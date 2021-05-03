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
module SC_REG_GENERAL_PERDIO_VIDAS #(parameter RegPERDIO_VIDAS_DATAWIDTH=2, parameter DATA_FIXED_INITREG=2'b11)(
	//////////// OUTPUTS //////////
	RegPERDIO_VIDAS_data_OutBUS,
	RegSIN_VIDAS_OutLow,
	//////////// INPUTS //////////
	RegPERDIO_VIDAS_CLOCK_50,
	RegPERDIO_VIDAS_RESET_InHigh,
	RegPERDIO_VIDAS_clear_InLow, 
	RegPERDIO_VIDAS_load_InLow, 
	RegPERDIO_VIDAS_data_InBUS,
	RegPERDIO_VIDAS_substract_life_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[RegPERDIO_VIDAS_DATAWIDTH-1:0]	RegPERDIO_VIDAS_data_OutBUS;
output [1:0] RegSIN_VIDAS_OutLow;
input		RegPERDIO_VIDAS_CLOCK_50;
input		RegPERDIO_VIDAS_RESET_InHigh;
input		RegPERDIO_VIDAS_clear_InLow;
input		RegPERDIO_VIDAS_load_InLow;	
input		RegPERDIO_VIDAS_substract_life_InLow;	
input		[RegPERDIO_VIDAS_DATAWIDTH-1:0]	RegPERDIO_VIDAS_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegPERDIO_VIDAS_DATAWIDTH-1:0] RegPERDIO_VIDAS_Register;
reg [RegPERDIO_VIDAS_DATAWIDTH-1:0] RegPERDIO_VIDAS_Signal;
reg [1:0] RegSinVidas;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (RegPERDIO_VIDAS_clear_InLow == 1'b0)
		RegPERDIO_VIDAS_Signal = DATA_FIXED_INITREG;
	else if (RegPERDIO_VIDAS_load_InLow == 1'b0)
		RegPERDIO_VIDAS_Signal = RegPERDIO_VIDAS_data_InBUS;
		
	else if (RegPERDIO_VIDAS_substract_life_InLow == 1'b0)
		RegPERDIO_VIDAS_Signal = RegPERDIO_VIDAS_Register - 2'b01;
	
	else
		RegPERDIO_VIDAS_Signal = RegPERDIO_VIDAS_Register;
		
		
	if (RegPERDIO_VIDAS_Register == 2'b00)
		RegSinVidas = 1'b0;
		
	else
		RegSinVidas = 1'b1;
		
	end	
	
//STATE REGISTER: SEQUENTIAL
always @(posedge RegPERDIO_VIDAS_CLOCK_50, posedge RegPERDIO_VIDAS_RESET_InHigh)
begin
	if (RegPERDIO_VIDAS_RESET_InHigh == 1'b1)
		RegPERDIO_VIDAS_Register <= 0;
	else
		RegPERDIO_VIDAS_Register <= RegPERDIO_VIDAS_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign RegPERDIO_VIDAS_data_OutBUS = RegPERDIO_VIDAS_Register;
assign RegSIN_VIDAS_OutLow = RegSinVidas;

endmodule