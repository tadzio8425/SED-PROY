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
 
 parameter DATA_FIXED_INITREGPOINT_7 = 8'b00010000;
 parameter DATA_FIXED_INITREGPOINT_6 = 8'b00111000;
 parameter DATA_FIXED_INITREGPOINT_5 = 8'b01111100;
 parameter DATA_FIXED_INITREGPOINT_4 = 8'b01111100;
 parameter DATA_FIXED_INITREGPOINT_3 = 8'b00111000;
 parameter DATA_FIXED_INITREGPOINT_2 = 8'b00010000;
 parameter DATA_FIXED_INITREGPOINT_1 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_0 = 8'b00010000;
 
 
 // 
 parameter DATA_FIXED_INITREGNivel_0 = 2'b00;
 parameter change_level_InLow=1'b1;

 
 
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




//=======================================================
// WIRE state machine main
//======================================================




//GAME INPUT dispaly
wire [DATAWIDTH_BUS-1:0] In_state_machine_0;
wire [DATAWIDTH_BUS-1:0] In_state_machine_1;
wire [DATAWIDTH_BUS-1:0] In_state_machine_2;
wire [DATAWIDTH_BUS-1:0] In_state_machine_3;
wire [DATAWIDTH_BUS-1:0] In_state_machine_4;
wire [DATAWIDTH_BUS-1:0] In_state_machine_5;
wire [DATAWIDTH_BUS-1:0] In_state_machine_6;
wire [DATAWIDTH_BUS-1:0] In_state_machine_7;



// GAME otput dispaly

wire [DATAWIDTH_BUS-1:0] regGAME_data7_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data6_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data5_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data4_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data3_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data2_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data1_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data0_wire;






// REG GENERAL CABLES


wire [1:0] change_level_InLow_wire;
wire [2-1:0] RegNivel_Out;
wire 	[7:0] data_max;
wire 	[2:0] add;

//=======================================================
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
//######################################################################


//######################################################################
//#                        Registros Generales
//######################################################################

// Regsitro de NIVEL







SC_REG_GENERAL_NIVEL#(.RegNIVEL_DATAWIDTH(2), .DATA_FIXED_INITREG(2'b00)) SC_REG_GENERAL_NIVEL_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegNIVEL_data_OutBUS(RegNivel_Out),
	.SC_RegNIVEL_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegNIVEL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegNIVEL_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegNIVEL_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegNIVEL_data_InBUS(DATA_FIXED_INITREGNivel_0),
	.change_level_InLow(change_level_InLow)
	
	

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
	.CC_NIVEL_data_InBus(RegNivel_Out),
	.CC_SPEEDCOMPARATOR_data_InBUS(upSPEEDCOUNTER_data_BUS_wire)
	
);

//////////     


wire clear;
wire load;
wire reg2nivel;


SC_STATEMACHINE_MAIN SC_STATEMACHINE_MAIN_U0(
	// port map - connection between master ports and signals/registers    



	.SC_STATEMACHINE_MAIN_clear_OutLow(clear),
	.SC_STATEMACHINE_MAIN_load_OutLow(load), 
	
	
	///////// NIVEL ACTUAL (PASA A REGISTRO) //////
	.SC_STATEMACHINE_MAIN_RegNivel_data_OutBus(reg2nivel),

	
	///////// dispaly salida //////
	.SC_STATEMACHINE_LoadDisplay_Out_1(regGAME_data0_wire),
	.SC_STATEMACHINE_LoadDisplay_Out_2(regGAME_data1_wire),
	.SC_STATEMACHINE_LoadDisplay_Out_3(regGAME_data2_wire),
	.SC_STATEMACHINE_LoadDisplay_Out_4(regGAME_data3_wire),
	.SC_STATEMACHINE_LoadDisplay_Out_5(regGAME_data4_wire),
	.SC_STATEMACHINE_LoadDisplay_Out_6(regGAME_data5_wire),
	.SC_STATEMACHINE_LoadDisplay_Out_7(regGAME_data6_wire),
	.SC_STATEMACHINE_LoadDisplay_Out_8(regGAME_data7_wire),
	
	
	
	//////////// INPUTS //////////
	
	.SC_STATEMACHINE_LoadDisplay_In_1(In_state_machine_0),
	.SC_STATEMACHINE_LoadDisplay_In_2(In_state_machine_1),
	.SC_STATEMACHINE_LoadDisplay_In_3(In_state_machine_2),
	.SC_STATEMACHINE_LoadDisplay_In_4(In_state_machine_3),
	.SC_STATEMACHINE_LoadDisplay_In_5(In_state_machine_4),
	.SC_STATEMACHINE_LoadDisplay_In_6(In_state_machine_5),
	.SC_STATEMACHINE_LoadDisplay_In_7(In_state_machine_6),
	.SC_STATEMACHINE_LoadDisplay_In_8(In_state_machine_7),
	
	.SC_STATEMACHINE_MAIN_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINE_MAIN_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINE_MAIN_startButton_InLow(BB_SYSTEM_startButton_Out),
	.SC_STATEMACHINE_MAIN_rightButton_InLow(BB_SYSTEM_rightButton_Out),
	.SC_STATEMACHINE_MAIN_leftButton_InLow(BB_SYSTEM_leftButton_Out),
	.SC_STATEMACHINE_MAIN_downButton_InLow(BB_SYSTEM_downButton_Out),
	.SC_STATEMACHINE_MAIN_upButton_InLow(BB_SYSTEM_upButton_Out),
	
	
	
	///////// NIVEL ACTUAL (ENTRA DEL REGISTRO) //////
	.SC_STATEMACHINE_MAIN_RegNivel_data_InBus(RegNivel_Out)

);




//######################################################################
//#	TO LED MATRIZ: VISUALIZATION
//######################################################################




assign BB_SYSTEM_startButton_Out = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_upButton_Out = BB_SYSTEM_upButton_InLow_cwire;
assign BB_SYSTEM_downButton_Out = BB_SYSTEM_downButton_InLow_cwire;
assign BB_SYSTEM_leftButton_Out = BB_SYSTEM_leftButton_InLow_cwire;
assign BB_SYSTEM_rightButton_Out = BB_SYSTEM_rightButton_InLow_cwire;


assign In_state_machine_0 = DATA_FIXED_INITREGPOINT_0;
assign In_state_machine_1 = DATA_FIXED_INITREGPOINT_1;
assign In_state_machine_2 = DATA_FIXED_INITREGPOINT_2;
assign In_state_machine_3 = DATA_FIXED_INITREGPOINT_3;
assign In_state_machine_4 = DATA_FIXED_INITREGPOINT_4;
assign In_state_machine_5 = DATA_FIXED_INITREGPOINT_5;
assign In_state_machine_6 = DATA_FIXED_INITREGPOINT_6;
assign In_state_machine_7 = DATA_FIXED_INITREGPOINT_7;


/*  se cambian no es necesario asignarlos 
assign regGAME_data0_wire = DATA_FIXED_INITREGPOINT_0;
assign regGAME_data1_wire = DATA_FIXED_INITREGPOINT_1;
assign regGAME_data2_wire = DATA_FIXED_INITREGPOINT_2;
assign regGAME_data3_wire = DATA_FIXED_INITREGPOINT_3;
assign regGAME_data4_wire = DATA_FIXED_INITREGPOINT_4;
assign regGAME_data5_wire = DATA_FIXED_INITREGPOINT_5;
assign regGAME_data6_wire = DATA_FIXED_INITREGPOINT_6;
assign regGAME_data7_wire = DATA_FIXED_INITREGPOINT_7;
assign change_level_InLow_wire=change_level_InLow;*/




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



//TO TEST




/*/TO TEST
assign BB_SYSTEM_TEST0 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST1 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST2 = BB_SYSTEM_startButton_InLow_cwire;*/


endmodule
