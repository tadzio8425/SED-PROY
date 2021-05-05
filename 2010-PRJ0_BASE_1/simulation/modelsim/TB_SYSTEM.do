do BB_SYSTEM_run_msim_rtl_verilog.do
onerror {resume}
quietly WaveActivateNextPane {} 0
delete wave *
add wave -noupdate /TB_SYSTEM/eachvec

add wave -divider STATE_MACHINE
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_MAIN_u0/STATE_Register


add wave  -divider LedMATRIX
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_CLOCK_50
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_RESET_InHigh
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_startButton_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_leftButton_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_rightButton_InLow



add wave -divider DISPLAY
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data7_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data6_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data5_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data4_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data3_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data2_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data1_wire
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/regGAME_data0_wire


add wave -divider TIME

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_upSPEEDCOUNTER_u0/upSPEEDCOUNTER_Register
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_SPEEDCOMPARATOR_u0/CC_SPEEDCOMPARATOR_T0_OutLow


add wave -divider POINT
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegPOINTTYPE_2_POINTMATRIX_data7_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegPOINTTYPE_2_POINTMATRIX_data6_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegPOINTTYPE_2_POINTMATRIX_data5_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegPOINTTYPE_2_POINTMATRIX_data4_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegPOINTTYPE_2_POINTMATRIX_data3_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegPOINTTYPE_2_POINTMATRIX_data2_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegPOINTTYPE_2_POINTMATRIX_data1_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegPOINTTYPE_2_POINTMATRIX_data0_Out

add wave -divider BACK
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegBACKGTYPE_2_BACKGMATRIX_data7_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegBACKGTYPE_2_BACKGMATRIX_data6_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegBACKGTYPE_2_BACKGMATRIX_data5_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegBACKGTYPE_2_BACKGMATRIX_data4_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegBACKGTYPE_2_BACKGMATRIX_data3_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegBACKGTYPE_2_BACKGMATRIX_data2_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegBACKGTYPE_2_BACKGMATRIX_data1_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/RegBACKGTYPE_2_BACKGMATRIX_data0_Out





restart
run 500ms

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {319999492 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 445
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {59829352 ps} {60892417 ps}
