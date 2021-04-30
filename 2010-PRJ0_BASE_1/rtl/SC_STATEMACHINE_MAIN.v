///*######################################################################
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
module SC_STATEMACHINE_MAIN (
	//////////// OUTPUTS //////////
	SC_STATEMACHINE_MAIN_clear_OutLow,
	SC_STATEMACHINE_MAIN_load_OutLow,
	///////// NIVEL ACTUAL (PASA A REGISTRO) //////
	SC_STATEMACHINE_MAIN_RegNivel_data_OutBus,
	
	SC_STATEMACHINE_LoadDisplay_Out_1,
	SC_STATEMACHINE_LoadDisplay_Out_2,
	SC_STATEMACHINE_LoadDisplay_Out_3,
	SC_STATEMACHINE_LoadDisplay_Out_4,
	SC_STATEMACHINE_LoadDisplay_Out_5,
	SC_STATEMACHINE_LoadDisplay_Out_6,
	SC_STATEMACHINE_LoadDisplay_Out_7,
	SC_STATEMACHINE_LoadDisplay_Out_8,
	
	
	
	//////////// INPUTS //////////
	SC_STATEMACHINE_MAIN_CLOCK_50,
	SC_STATEMACHINE_MAIN_RESET_InHigh,
	SC_STATEMACHINE_MAIN_startButton_InLow,
	///////// NIVEL ACTUAL (ENTRA DEL REGISTRO) //////
	SC_STATEMACHINE_MAIN_RegNivel_data_OutBus
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK_0									= 2;
localparam STATE_CHECK_1									= 3;
localparam ESTADO_INICIAL									= 4;
localparam ESTADO_CAMBIO_NIVEL_1							= 5;

//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINE_MAIN_clear_OutLow;
output reg		SC_STATEMACHINE_MAIN_load_OutLow;
output reg 		SC_STATEMACHINE_MAIN_RegNivel_data_OutBus;


output reg 		SC_STATEMACHINE_LoadDisplay_Out_1;
output reg 		SC_STATEMACHINE_LoadDisplay_Out_2;
output reg 		SC_STATEMACHINE_LoadDisplay_Out_3;
output reg 		SC_STATEMACHINE_LoadDisplay_Out_4;
output reg 		SC_STATEMACHINE_LoadDisplay_Out_5;
output reg 		SC_STATEMACHINE_LoadDisplay_Out_6;
output reg 		SC_STATEMACHINE_LoadDisplay_Out_7;
output reg 		SC_STATEMACHINE_LoadDisplay_Out_8;


input			SC_STATEMACHINE_MAIN_CLOCK_50;
input 			SC_STATEMACHINE_MAIN_RESET_InHigh;
input			SC_STATEMACHINE_MAIN_startButton_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] STATE_Register;
reg [3:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0: STATE_Signal = STATE_START_0;
		STATE_START_0: STATE_Signal = STATE_CHECK_0;
		STATE_CHECK_0: if (SC_STATEMACHINE_MAIN_startButton_InLow == 1'b0) STATE_Signal = ESTADO_INICIAL;
						
		ESTADO_INICIAL:	STATE_Signal = ESTADO_CAMBIO_NIVEL_1;
		
		
		
		
		
		STATE_CHECK_1: if (SC_STATEMACHINE_MAIN_startButton_InLow == 1'b0) STATE_Signal = STATE_CHECK_1;
						else STATE_Signal = STATE_CHECK_0;

		default : 		STATE_Signal = STATE_CHECK_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINE_MAIN_CLOCK_50 , posedge SC_STATEMACHINE_MAIN_RESET_InHigh)
begin
	if (SC_STATEMACHINE_MAIN_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_RESET_0;
	else
		STATE_Register <= STATE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	case (STATE_Register)
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_0 :	
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_RegNivel_data_OutBus = 2'b00;
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_RegNivel_data_OutBus = 2'b00;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_RegNivel_data_OutBus = SC_STATEMACHINE_MAIN_RegNivel_data_OutBus;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_1 :
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_RegNivel_data_OutBus = SC_STATEMACHINE_MAIN_RegNivel_data_OutBus;
		end
//=========================================================
// ESTADO_INICIAL
//=========================================================

	ESTADO_INICIAL:
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_RegNivel_data_OutBus = 2'b00;
		end


//=========================================================
// ESTADO_CAMBIO_NIVEL_1
//=========================================================

	ESTADO_CAMBIO_NIVEL_1:
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_RegNivel_data_OutBus = 2'b00;
			
			SC_STATEMACHINE_LoadDisplay_Out_1 = 8'b00000000;
			SC_STATEMACHINE_LoadDisplay_Out_2 = 8'b00011000;
			SC_STATEMACHINE_LoadDisplay_Out_3 = 8'b00111000;
			SC_STATEMACHINE_LoadDisplay_Out_4 = 8'b00011000;
			SC_STATEMACHINE_LoadDisplay_Out_5 = 8'b00011000;
			SC_STATEMACHINE_LoadDisplay_Out_6 = 8'b00011000;
			SC_STATEMACHINE_LoadDisplay_Out_7 = 8'b00111100;
			SC_STATEMACHINE_LoadDisplay_Out_8 = 8'b00000000;
			
		end
		
		
		
//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_RegNivel_data_OutBus = 2'b00;
		end
	endcase
end
endmodule