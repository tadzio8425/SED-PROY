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
	SC_STATEMACHINE_MAIN_changeLevel_OutLow,
	SC_STATEMACHINE_MAIN_transition_OutBUS,	
	
	
	//////////// INPUTS //////////
	SC_STATEMACHINE_MAIN_CLOCK_50,
	SC_STATEMACHINE_MAIN_RESET_InHigh,
	SC_STATEMACHINE_MAIN_startButton_InLow,
	SC_STATEMACHINE_MAIN_nidosCompletos_InLow,
	SC_STATEMACHINE_MAIN_PerdioVidas_InLow

);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK_0									= 2;
localparam STATE_CHECK_1									= 3;
localparam STATE_INIT_0										= 4;
localparam ESTADO_CAMBIO_NIVEL_1							= 5;
localparam NIVEL_1 											= 6;
localparam ESTADO_CAMBIO_NIVEL_2							= 7;
localparam NIVEL_2							            = 8;
localparam ESTADO_CAMBIO_NIVEL_3							= 9;
localparam NIVEL_3                                 = 10;
localparam ESTADO_CAMBIO_NIVEL_4							= 11;
localparam NIVEL_4                                 = 12;
localparam ESTADO_FINAL                            = 13;


//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINE_MAIN_clear_OutLow;
output reg		SC_STATEMACHINE_MAIN_load_OutLow;
output reg		SC_STATEMACHINE_MAIN_changeLevel_OutLow;
output reg	[3-1:0]SC_STATEMACHINE_MAIN_transition_OutBUS;




input			SC_STATEMACHINE_MAIN_CLOCK_50;
input 		SC_STATEMACHINE_MAIN_RESET_InHigh;
input			SC_STATEMACHINE_MAIN_startButton_InLow;
input 		SC_STATEMACHINE_MAIN_nidosCompletos_InLow;
input 		SC_STATEMACHINE_MAIN_PerdioVidas_InLow;

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
		STATE_CHECK_0: if (SC_STATEMACHINE_MAIN_startButton_InLow == 1'b0) STATE_Signal = STATE_INIT_0;
			else STATE_Signal = STATE_CHECK_0;
						
		STATE_INIT_0:	STATE_Signal = ESTADO_CAMBIO_NIVEL_1;
		
		ESTADO_CAMBIO_NIVEL_1: STATE_Signal = NIVEL_1;
		
		NIVEL_1: if (SC_STATEMACHINE_MAIN_nidosCompletos_InLow == 1'b0) STATE_Signal = ESTADO_CAMBIO_NIVEL_2;
		
					else if (SC_STATEMACHINE_MAIN_PerdioVidas_InLow == 1'b0)  STATE_Signal = STATE_START_0;
					
					else STATE_Signal = NIVEL_1;
					
					
		ESTADO_CAMBIO_NIVEL_2: STATE_Signal = NIVEL_2;
		
		
		
		NIVEL_2: if (SC_STATEMACHINE_MAIN_nidosCompletos_InLow == 1'b0) STATE_Signal = ESTADO_CAMBIO_NIVEL_3;
		
					else if (SC_STATEMACHINE_MAIN_PerdioVidas_InLow == 1'b0)  STATE_Signal = STATE_START_0;
					
					else STATE_Signal = NIVEL_2;
					
				
					

		ESTADO_CAMBIO_NIVEL_3: STATE_Signal = NIVEL_3;
		
		
		
		NIVEL_3: if (SC_STATEMACHINE_MAIN_nidosCompletos_InLow == 1'b0) STATE_Signal = ESTADO_CAMBIO_NIVEL_4;
		
					else if (SC_STATEMACHINE_MAIN_PerdioVidas_InLow == 1'b0)  STATE_Signal = STATE_START_0;
					
					else STATE_Signal = NIVEL_3;
					
					
		
		ESTADO_CAMBIO_NIVEL_4: STATE_Signal = NIVEL_4;
		
		NIVEL_4: if (SC_STATEMACHINE_MAIN_nidosCompletos_InLow == 1'b0) STATE_Signal = ESTADO_FINAL;
		
					else if (SC_STATEMACHINE_MAIN_PerdioVidas_InLow == 1'b0)  STATE_Signal = STATE_START_0;
					
					else STATE_Signal = NIVEL_4;		
					
		ESTADO_FINAL: STATE_Signal = STATE_START_0;
		
		
		
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
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b000;
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b0;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_transition_OutBUS= 3'b000;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b000;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_1 :
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b000;
		end
//=========================================================
// ESTADO_INICIAL
//=========================================================

	STATE_INIT_0:
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b000;
		end


//=========================================================
// ESTADO_CAMBIO_NIVEL_1
//=========================================================

	ESTADO_CAMBIO_NIVEL_1:
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b001;

		end
		
		
	NIVEL_1:
	
		begin
	
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b000;
			
		end

//=========================================================
// ESTADO_CAMBIO_NIVEL_2
//=========================================================

	ESTADO_CAMBIO_NIVEL_2:
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b0;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b010;

		end		
		
	NIVEL_2:
	
		begin
	
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b000;
		end

//=========================================================
// ESTADO_CAMBIO_NIVEL_3
//=========================================================

	ESTADO_CAMBIO_NIVEL_3:
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b0;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b011;

		end		
		
	NIVEL_3:
	
		begin
	
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b000;
		end

//=========================================================
// ESTADO_CAMBIO_NIVEL_4
//=========================================================

	ESTADO_CAMBIO_NIVEL_4:
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b0;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b100;

		end		
		
	NIVEL_4:
	
		begin
	
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b000;
		end
			
//=========================================================
// Estado FINAL
//=========================================================			

ESTADO_FINAL: 

	begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b0;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 3'b101;
	end
		
//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINE_MAIN_clear_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_load_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_changeLevel_OutLow = 1'b1;
			SC_STATEMACHINE_MAIN_transition_OutBUS = 2'b00;
		end
	endcase
end
endmodule
