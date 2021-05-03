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
module BB_SYSTEM (
//////////// OUTPUTS //////////


//////////// matriz ///////////////
	BB_SYSTEM_max7219DIN_Out,
	BB_SYSTEM_max7219NCS_Out,
	BB_SYSTEM_max7219CLK_Out,

	
//////////// movement //////////
	BB_SYSTEM_startButton_Out, 
	BB_SYSTEM_leftButton_Out,
	BB_SYSTEM_rightButton_Out,
	BB_SYSTEM_upButton_Out,
	BB_SYSTEM_downButton_Out,
	
	BB_SYSTEM_TEST0,
	BB_SYSTEM_TEST1,
	BB_SYSTEM_TEST2,
	
	
//////////// INPUTS //////////

	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_RESET_InHigh,
	BB_SYSTEM_startButton_InLow, 
	BB_SYSTEM_leftButton_InLow,
	BB_SYSTEM_rightButton_InLow,
	BB_SYSTEM_upButton_InLow,
	BB_SYSTEM_downButton_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================
 parameter DATAWIDTH_BUS = 8;
 parameter PRESCALER_DATAWIDTH = 23;
 parameter DISPLAY_DATAWIDTH = 12;
 
 parameter DATA_FIXED_INITREGPOINT_7 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_6 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_5 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_4 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_3 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_2 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_1 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_0 = 8'b00010000;
 

 parameter DATA_FIXED_INITREGBACKG_7 = 8'b11100000;
 parameter DATA_FIXED_INITREGBACKG_6 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_5 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_4 = 8'b11100000;
 parameter DATA_FIXED_INITREGBACKG_3 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_2 = 8'b11100000;
 parameter DATA_FIXED_INITREGBACKG_1 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_0 = 8'b00000000;

 // 
 parameter DATA_FIXED_INITREGNivel_0 = 2'b00;
 
 parameter DATA_FIXED_INITREGVidas_0 = 2'b11;
 
  parameter DATA_FIXED_INITREGNidos_0 = 2'b00;
 
 
reg [8-1:0] 		 DATA_TRANSITION_INITREGPOINT_7;
reg [8-1:0] 		 DATA_TRANSITION_INITREGPOINT_6;
reg [8-1:0] 		 DATA_TRANSITION_INITREGPOINT_5;
reg [8-1:0] 		 DATA_TRANSITION_INITREGPOINT_4;
reg [8-1:0] 		 DATA_TRANSITION_INITREGPOINT_3;
reg [8-1:0] 		 DATA_TRANSITION_INITREGPOINT_2;
reg [8-1:0] 		 DATA_TRANSITION_INITREGPOINT_1;
reg [8-1:0] 		 DATA_TRANSITION_INITREGPOINT_0;

reg [8-1:0] 		 DATA_TRANSITION_INITREGBACKG_7;
reg [8-1:0] 		 DATA_TRANSITION_INITREGBACKG_6;
reg [8-1:0] 		 DATA_TRANSITION_INITREGBACKG_5;
reg [8-1:0] 		 DATA_TRANSITION_INITREGBACKG_4;
reg [8-1:0] 		 DATA_TRANSITION_INITREGBACKG_3;
reg [8-1:0] 		 DATA_TRANSITION_INITREGBACKG_2;
reg [8-1:0] 		 DATA_TRANSITION_INITREGBACKG_1;
reg [8-1:0] 		 DATA_TRANSITION_INITREGBACKG_0;
 
 
 
 
 //=======================================================
//  PORT declarations
//=======================================================
output		BB_SYSTEM_max7219DIN_Out;
output		BB_SYSTEM_max7219NCS_Out;
output		BB_SYSTEM_max7219CLK_Out;

output 		BB_SYSTEM_startButton_Out;
output 		BB_SYSTEM_leftButton_Out;
output 		BB_SYSTEM_rightButton_Out;
output		BB_SYSTEM_upButton_Out;
output		BB_SYSTEM_downButton_Out;

input		BB_SYSTEM_CLOCK_50;
input		BB_SYSTEM_RESET_InHigh;
input		BB_SYSTEM_startButton_InLow;
input		BB_SYSTEM_leftButton_InLow;
input		BB_SYSTEM_rightButton_InLow;
input		BB_SYSTEM_upButton_InLow;
input		BB_SYSTEM_downButton_InLow;

output 		BB_SYSTEM_TEST0;
output 		BB_SYSTEM_TEST1;
output 		BB_SYSTEM_TEST2;

//=======================================================
//  REG/WIRE declarations
//=======================================================
// BUTTONs
wire 	BB_SYSTEM_startButton_InLow_cwire;
wire 	BB_SYSTEM_leftButton_InLow_cwire;
wire 	BB_SYSTEM_rightButton_InLow_cwire;
wire 	BB_SYSTEM_upButton_InLow_cwire;
wire 	BB_SYSTEM_downButton_InLow_cwire;
//=======================================================
// WIRE speed
wire [PRESCALER_DATAWIDTH-1:0] upSPEEDCOUNTER_data_BUS_wire;
wire SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire;


// WIRE STATEMACHINE_MAIN
wire	STATEMACHINE_MAIN_clear_cwire;
wire	STATEMACHINE_MAIN_load_cwire;
wire	STATEMACHINE_MAIN_change_level_cwire;
wire  STATEMACHINE_MAIN_transition_cwire;



// GAME
wire [DATAWIDTH_BUS-1:0] regGAME_data7_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data6_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data5_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data4_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data3_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data2_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data1_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data0_wire;


// REG GENERAL CABLES
wire [2-1:0] RegNivel_Out_wire;
wire 	[7:0] data_max;
wire 	[2:0] add;

//BOTTOMSIDE COMPARATOR
wire BOTTOMSIDECOMPARATOR_2_STATEMACHINEBACKG_bottomside_cwire;

//BACKGROUNG
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data7_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data0_Out;
wire STATEMACHINEBACKG_clear_cwire;
wire STATEMACHINEBACKG_load_cwire;
wire [1:0] STATEMACHINEBACKG_shiftselection_cwire;
wire STATEMACHINEBACKG_upcount_cwire;

//POINT
wire	STATEMACHINEPOINT_clear_cwire;
wire	STATEMACHINEPOINT_load0_cwire;
wire	STATEMACHINEPOINT_load1_cwire;
wire	[1:0] STATEMACHINEPOINT_shiftselection_cwire;

wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data7_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data6_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data5_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data4_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data3_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data2_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data1_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data0_Out;


//REGISTROS DE VIDAS
wire [2-1:0] RegPERDIO_VIDAS_data_OutBUS_wire;
wire [1-1:0] RegSIN_VIDAS_OutLow_wire;

wire [2-1:0] RegNIDOS_data_OutBUS_wire;
wire [1-1:0] RegSIN_VIDAS_OutLow_wir;
//=============================
//  Structural coding
//=======================================================

//######################################################################
//#	INPUTS
//######################################################################
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_startButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_startButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u2 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton_InLow)
);

SC_DEBOUNCE1 SC_DEBOUNCE1_u3 (
// port map - connection between master ports and signals/registers      
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_upButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_upButton_InLow)
);

SC_DEBOUNCE1 SC_DEBOUNCE1_u4 (
// port map - connection between master ports and signals/registers      
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_downButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_downButton_InLow)
);

//######################################################################
//#	!!! ACA VAN TUS COMPONENTES
//######################################################################}


//######################################################################
//#	POINT
//######################################################################
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_7)) SC_RegPOINTTYPE_u7 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegPOINTTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegPOINTTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGPOINT_7)
	
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_6)) SC_RegPOINTTYPE_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegPOINTTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGPOINT_6)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_5)) SC_RegPOINTTYPE_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegPOINTTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGPOINT_5)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_4)) SC_RegPOINTTYPE_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegPOINTTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGPOINT_4)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_3)) SC_RegPOINTTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegPOINTTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGPOINT_3)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_2)) SC_RegPOINTTYPE_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),	
	.SC_RegPOINTTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegPOINTTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGPOINT_2)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_1)) SC_RegPOINTTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegPOINTTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGPOINT_1)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegPOINTTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGPOINT_0)
);

SC_STATEMACHINEPOINT SC_STATEMACHINEPOINT_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEPOINT_clear_OutLow(STATEMACHINEPOINT_clear_cwire), 
	.SC_STATEMACHINEPOINT_load0_OutLow(STATEMACHINEPOINT_load0_cwire), 
	.SC_STATEMACHINEPOINT_load1_OutLow(STATEMACHINEPOINT_load1_cwire), 
	.SC_STATEMACHINEPOINT_shiftselection_Out(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_STATEMACHINEPOINT_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEPOINT_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEPOINT_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_upButton_InLow(BB_SYSTEM_upButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_downButton_InLow(BB_SYSTEM_downButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_leftButton_InLow(BB_SYSTEM_leftButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_rightButton_InLow(BB_SYSTEM_rightButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_bottomsidecomparator_InLow(BOTTOMSIDECOMPARATOR_2_STATEMACHINEBACKG_bottomside_cwire)
);

//######################################################################
//#                        Registros Generales
//######################################################################

// Regsitro de NIVEL



SC_REG_GENERAL_NIVEL#(.RegNIVEL_DATAWIDTH(2), .DATA_FIXED_INITREG(2'b00)) SC_REG_GENERAL_NIVEL_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegNIVEL_data_OutBUS(RegNivel_Out_wire),
	.SC_RegNIVEL_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegNIVEL_change_level_InLow(STATEMACHINE_MAIN_change_level_cwire),

	.SC_RegNIVEL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegNIVEL_clear_InLow(STATEMACHINE_MAIN_clear_cwire),	
	.SC_RegNIVEL_load_InLow(STATEMACHINE_MAIN_load_cwire),
	.SC_RegNIVEL_data_InBUS(DATA_FIXED_INITREGNivel_0)

);

//######################################################################
//#                                SPEED 
//######################################################################

SC_upSPEEDCOUNTER #(.upSPEEDCOUNTER_DATAWIDTH(PRESCALER_DATAWIDTH)) SC_upSPEEDCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upSPEEDCOUNTER_data_OutBUS(upSPEEDCOUNTER_data_BUS_wire),
	.SC_upSPEEDCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upSPEEDCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upSPEEDCOUNTER_upcount_InLow(STATEMACHINEBACKG_upcount_cwire)
);

CC_SPEEDCOMPARATOR #(.SPEEDCOMPARATOR_DATAWIDTH(PRESCALER_DATAWIDTH)) CC_SPEEDCOMPARATOR_u0 (
	.CC_SPEEDCOMPARATOR_T0_OutLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.CC_SPEEDCOMPARATOR_data_InBUS(upSPEEDCOUNTER_data_BUS_wire),
	.CC_NIVEL_data_InBus(RegNivel_Out_wire)
	
);

//////////     

SC_STATEMACHINE_MAIN SC_STATEMACHINE_MAIN_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINE_MAIN_clear_OutLow(STATEMACHINE_MAIN_clear_cwire),
	.SC_STATEMACHINE_MAIN_load_OutLow(STATEMACHINE_MAIN_load_cwire),
	.SC_STATEMACHINE_MAIN_changeLevel_OutLow(STATEMACHINE_MAIN_change_level_cwire),
	.SC_STATEMACHINE_MAIN_transition_OutBUS(STATEMACHINE_MAIN_transition_cwire),	
	
	.SC_STATEMACHINE_MAIN_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINE_MAIN_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINE_MAIN_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire)


);


SC_STATEMACHINEBACKG SC_STATEMACHINEBACKG_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEBACKG_clear_OutLow(STATEMACHINEBACKG_clear_cwire), 
	.SC_STATEMACHINEBACKG_load_OutLow(STATEMACHINEBACKG_load_cwire), 
	.SC_STATEMACHINEBACKG_shiftselection_Out(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_STATEMACHINEBACKG_upcount_out(STATEMACHINEBACKG_upcount_cwire),
	.SC_STATEMACHINEBACKG_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEBACKG_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEBACKG_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEBACKG_T0_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire)
);




/////////////////////// CAMBIO VALOR PREDETERMINADO PARA LAS TRANSICIONES ////////////
always @(*) 
begin

	if (STATEMACHINE_MAIN_transition_cwire == 3'b001) begin

		 DATA_TRANSITION_INITREGPOINT_7 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_6 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_5 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_4 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_3 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_2 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_1 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_0 = 8'b00000000;

		 DATA_TRANSITION_INITREGBACKG_7 = 8'b00000000;
		 DATA_TRANSITION_INITREGBACKG_6 = 8'b00011000;
		 DATA_TRANSITION_INITREGBACKG_5 = 8'b00111000;
		 DATA_TRANSITION_INITREGBACKG_4 = 8'b00011000;
		 DATA_TRANSITION_INITREGBACKG_3 = 8'b00011000;
		 DATA_TRANSITION_INITREGBACKG_2 = 8'b00011000;
		 DATA_TRANSITION_INITREGBACKG_1 = 8'b00111100;
		 DATA_TRANSITION_INITREGBACKG_0 = 8'b00000000;
		 end
		 
		 
	else if (STATEMACHINE_MAIN_transition_cwire == 3'b010) begin

		 DATA_TRANSITION_INITREGPOINT_7 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_6 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_5 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_4 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_3 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_2 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_1 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_0 = 8'b00000000;
		 
		 
		 //////////// POS INICIAL FONDO / OBSTACULOS /////
		 DATA_TRANSITION_INITREGBACKG_7 = 8'b00000000;
		 DATA_TRANSITION_INITREGBACKG_6 = 8'b00111000;
		 DATA_TRANSITION_INITREGBACKG_5 = 8'b01000100;
		 DATA_TRANSITION_INITREGBACKG_4 = 8'b00001000;
		 DATA_TRANSITION_INITREGBACKG_3 = 8'b00010000;
		 DATA_TRANSITION_INITREGBACKG_2 = 8'b00100000;
		 DATA_TRANSITION_INITREGBACKG_1 = 8'b01111100;
		 DATA_TRANSITION_INITREGBACKG_0 = 8'b00000000;
		 end
		 
		 
	else if (STATEMACHINE_MAIN_transition_cwire == 3'b011) begin

		 DATA_TRANSITION_INITREGPOINT_7 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_6 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_5 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_4 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_3 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_2 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_1 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_0 = 8'b00000000;
		 
		 
		 //////////// POS INICIAL FONDO / OBSTACULOS /////
		 DATA_TRANSITION_INITREGBACKG_7 = 8'b00000000;
		 DATA_TRANSITION_INITREGBACKG_6 = 8'b01111100;
		 DATA_TRANSITION_INITREGBACKG_5 = 8'b00000010;
		 DATA_TRANSITION_INITREGBACKG_4 = 8'b00000010;
		 DATA_TRANSITION_INITREGBACKG_3 = 8'b01111100;
		 DATA_TRANSITION_INITREGBACKG_2 = 8'b00000010;
		 DATA_TRANSITION_INITREGBACKG_1 = 8'b00000010;
		 DATA_TRANSITION_INITREGBACKG_0 = 8'b01111110;
		 end
		 
		 
	else if (STATEMACHINE_MAIN_transition_cwire == 3'b100) begin

		 DATA_TRANSITION_INITREGPOINT_7 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_6 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_5 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_4 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_3 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_2 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_1 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_0 = 8'b00000000;
		 
		 
		 //////////// POS INICIAL FONDO / OBSTACULOS /////
		 DATA_TRANSITION_INITREGBACKG_7 = 8'b00000000;
		 DATA_TRANSITION_INITREGBACKG_6 = 8'b01000010;
		 DATA_TRANSITION_INITREGBACKG_5 = 8'b01000010;
		 DATA_TRANSITION_INITREGBACKG_4 = 8'b01000010;
		 DATA_TRANSITION_INITREGBACKG_3 = 8'b01111010;
		 DATA_TRANSITION_INITREGBACKG_2 = 8'b00000010;
		 DATA_TRANSITION_INITREGBACKG_1 = 8'b00000010;
		 DATA_TRANSITION_INITREGBACKG_0 = 8'b00000000;
		
		 end
		 
	
	else if (STATEMACHINE_MAIN_transition_cwire == 3'b101) begin

		 DATA_TRANSITION_INITREGPOINT_7 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_6 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_5 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_4 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_3 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_2 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_1 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_0 = 8'b00000000;
		 
		 
		 //////////// POS INICIAL FONDO / OBSTACULOS /////
		 DATA_TRANSITION_INITREGBACKG_7 = 8'b11111111;
		 DATA_TRANSITION_INITREGBACKG_6 = 8'b01111110;
		 DATA_TRANSITION_INITREGBACKG_5 = 8'b01111110;
		 DATA_TRANSITION_INITREGBACKG_4 = 8'b01111110;
		 DATA_TRANSITION_INITREGBACKG_3 = 8'b00011000;
		 DATA_TRANSITION_INITREGBACKG_2 = 8'b00011000;
		 DATA_TRANSITION_INITREGBACKG_1 = 8'b00011000;
		 DATA_TRANSITION_INITREGBACKG_0 = 8'b00111100;
		
		 end
		 		 
		
	else begin

		 DATA_TRANSITION_INITREGPOINT_7 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_6 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_5 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_4 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_3 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_2 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_1 = 8'b00000000;
		 DATA_TRANSITION_INITREGPOINT_0 = 8'b00010000;
		 
		
		 DATA_TRANSITION_INITREGBACKG_7 = 8'b11100000;
		 DATA_TRANSITION_INITREGBACKG_6 = 8'b00000000;
		 DATA_TRANSITION_INITREGBACKG_5 = 8'b00000000;
		 DATA_TRANSITION_INITREGBACKG_4 = 8'b11100000;
		 DATA_TRANSITION_INITREGBACKG_3 = 8'b00000000;
		 DATA_TRANSITION_INITREGBACKG_2 = 8'b11100000;
		 DATA_TRANSITION_INITREGBACKG_1 = 8'b00000000;
		 DATA_TRANSITION_INITREGBACKG_0 = 8'b00000000;
		 end
	 
	 end 

//######################################################################
//#	BACKGROUND
//######################################################################
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_7)) SC_RegBACKGTYPE_u7 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data7_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_0),
	.SC_RegBACKTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegBACKTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGBACKG_7)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_6)) SC_RegBACKGTYPE_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data6_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_0),
	.SC_RegBACKTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegBACKTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGBACKG_6)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_5)) SC_RegBACKGTYPE_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data5_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_0),
	.SC_RegBACKTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegBACKTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGBACKG_5)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_4)) SC_RegBACKGTYPE_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data4_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_0),
	.SC_RegBACKTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegBACKTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGBACKG_4)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_3)) SC_RegBACKGTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data3_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_0),
	.SC_RegBACKTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegBACKTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGBACKG_3)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_2)) SC_RegBACKGTYPE_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data2_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_0),
	.SC_RegBACKTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegBACKTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGBACKG_2)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_1)) SC_RegBACKGTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data1_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_0),
	.SC_RegBACKTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegBACKTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGBACKG_1)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_0)) SC_RegBACKGTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data0_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(DATA_FIXED_INITREGBACKG_0),
	.SC_RegBACKTYPE_transition_InBUS(STATEMACHINE_MAIN_transition_cwire),
	.SC_RegBACKTYPE_transitionDATA_InBUS(DATA_TRANSITION_INITREGBACKG_0)

);


//######################################################################
//#	COMPARATOR END OF MATRIX (BOTTON SIDE)
//######################################################################
CC_BOTTOMSIDECOMPARATOR #(.BOTTOMSIDECOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) CC_BOTTOMSIDECOMPARATOR_u0 (
	.CC_BOTTOMSIDECOMPARATOR_bottomside_OutLow(BOTTOMSIDECOMPARATOR_2_STATEMACHINEBACKG_bottomside_cwire),
	.CC_BOTTOMSIDECOMPARATOR_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out)
);


//######################################################################
//#	Registro Vidas y Nidos
//######################################################################

SC_REG_GENERAL_PERDIO_VIDAS #(.RegPERDIO_VIDAS_DATAWIDTH(2), .DATA_FIXED_INITREG(2'b11)) SC_REG_GENERAL_PERDIO_VIDAS_u0 (
// port map - connection between master ports and signals/registers   
	.RegPERDIO_VIDAS_data_OutBUS(RegPERDIO_VIDAS_data_OutBUS_wire),
	.RegSIN_VIDAS_OutLow(RegSIN_VIDAS_OutLow_wire),
	//////////// INPUTS //////////
	.RegPERDIO_VIDAS_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.RegPERDIO_VIDAS_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.RegPERDIO_VIDAS_clear_InLow(STATEMACHINE_MAIN_clear_cwire), 
	.RegPERDIO_VIDAS_load_InLow(STATEMACHINE_MAIN_load_cwire), 
	.RegPERDIO_VIDAS_data_InBUS(DATA_FIXED_INITREGVidas_0)
	// FALTA POR CONECTAR  .RegPERDIO_VIDAS_substract_life_InLow()

);



SC_REG_GENERAL_NIDOS #(.RegNIDOS_DATAWIDTH(2), .DATA_FIXED_INITREG(2'b11)) SC_REG_GENERAL_NIDOS_u0 (
// port map - connection between master ports and signals/registers   
	.RegNIDOS_data_OutBUS(RegNIDOS_data_OutBUS_wire),
	.RegSIN_VIDAS_OutLow(RegSIN_VIDAS_OutLow_wire),
	//////////// INPUTS //////////
	.RegNIDOS_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.RegNIDOS_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.RegNIDOS_clear_InLow(STATEMACHINE_MAIN_clear_cwire), 
	.RegNIDOS_load_InLow(STATEMACHINE_MAIN_load_cwire), 
	.RegNIDOS_data_InBUS(DATA_FIXED_INITREGNidos_0)
	// FALTA POR CONECTAR  .RegNIDOS_nido_alcanzado_InLow()

);




//######################################################################
//#	TO LED MATRIZ: VISUALIZATION
//######################################################################


assign regGAME_data0_wire = RegPOINTTYPE_2_POINTMATRIX_data0_Out | RegBACKGTYPE_2_BACKGMATRIX_data0_Out;
assign regGAME_data1_wire = RegPOINTTYPE_2_POINTMATRIX_data1_Out | RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
assign regGAME_data2_wire = RegPOINTTYPE_2_POINTMATRIX_data2_Out | RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
assign regGAME_data3_wire = RegPOINTTYPE_2_POINTMATRIX_data3_Out | RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
assign regGAME_data4_wire = RegPOINTTYPE_2_POINTMATRIX_data4_Out | RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
assign regGAME_data5_wire = RegPOINTTYPE_2_POINTMATRIX_data5_Out | RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
assign regGAME_data6_wire = RegPOINTTYPE_2_POINTMATRIX_data6_Out | RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
assign regGAME_data7_wire = RegPOINTTYPE_2_POINTMATRIX_data7_Out | RegBACKGTYPE_2_BACKGMATRIX_data7_Out;

assign data_max =(add==3'b000)?{regGAME_data0_wire[7],regGAME_data1_wire[7],regGAME_data2_wire[7],regGAME_data3_wire[7],regGAME_data4_wire[7],regGAME_data5_wire[7],regGAME_data6_wire[7],regGAME_data7_wire[7]}:
	       (add==3'b001)?{regGAME_data0_wire[6],regGAME_data1_wire[6],regGAME_data2_wire[6],regGAME_data3_wire[6],regGAME_data4_wire[6],regGAME_data5_wire[6],regGAME_data6_wire[6],regGAME_data7_wire[6]}:
	       (add==3'b010)?{regGAME_data0_wire[5],regGAME_data1_wire[5],regGAME_data2_wire[5],regGAME_data3_wire[5],regGAME_data4_wire[5],regGAME_data5_wire[5],regGAME_data6_wire[5],regGAME_data7_wire[5]}:
	       (add==3'b011)?{regGAME_data0_wire[4],regGAME_data1_wire[4],regGAME_data2_wire[4],regGAME_data3_wire[4],regGAME_data4_wire[4],regGAME_data5_wire[4],regGAME_data6_wire[4],regGAME_data7_wire[4]}:
	       (add==3'b100)?{regGAME_data0_wire[3],regGAME_data1_wire[3],regGAME_data2_wire[3],regGAME_data3_wire[3],regGAME_data4_wire[3],regGAME_data5_wire[3],regGAME_data6_wire[3],regGAME_data7_wire[3]}:
	       (add==3'b101)?{regGAME_data0_wire[2],regGAME_data1_wire[2],regGAME_data2_wire[2],regGAME_data3_wire[2],regGAME_data4_wire[2],regGAME_data5_wire[2],regGAME_data6_wire[2],regGAME_data7_wire[2]}:
	       (add==3'b110)?{regGAME_data0_wire[1],regGAME_data1_wire[1],regGAME_data2_wire[1],regGAME_data3_wire[1],regGAME_data4_wire[1],regGAME_data5_wire[1],regGAME_data6_wire[1],regGAME_data7_wire[1]}:
						{regGAME_data0_wire[0],regGAME_data1_wire[0],regGAME_data2_wire[0],regGAME_data3_wire[0],regGAME_data4_wire[0],regGAME_data5_wire[0],regGAME_data6_wire[0],regGAME_data7_wire[0]};
									 
matrix_ctrl matrix_ctrl_unit_0( 
.max7219_din(BB_SYSTEM_max7219DIN_Out),//max7219_din 
.max7219_ncs(BB_SYSTEM_max7219NCS_Out),//max7219_ncs 
.max7219_clk(BB_SYSTEM_max7219CLK_Out),//max7219_clk
.disp_data(data_max), 
.disp_addr(add),
.intensity(4'hA),
.clk(BB_SYSTEM_CLOCK_50),
.reset(BB_SYSTEM_RESET_InHigh) //~lowRst_System
 ); 
 
//######################################################################
//#	TO TEST
//######################################################################

assign BB_SYSTEM_startButton_Out = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_leftButton_Out = BB_SYSTEM_leftButton_InLow_cwire;
assign BB_SYSTEM_rightButton_Out = BB_SYSTEM_rightButton_InLow_cwire;
assign BB_SYSTEM_upButton_Out = BB_SYSTEM_upButton_InLow_cwire;
assign BB_SYSTEM_downButton_Out = BB_SYSTEM_downButton_InLow_cwire;



//TO TEST
assign BB_SYSTEM_TEST0 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST1 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST2 = BB_SYSTEM_startButton_InLow_cwire;



endmodule
