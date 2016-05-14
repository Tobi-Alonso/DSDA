transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {SintetizadorFrec_7_1200mv_85c_slow.vho}

vcom -93 -work work {C:/Users/tobia/Google Drive/Facu/9 semestre/VHDL - FPGA/Proyectos/Lab 4/SintetizadorFrec/testbench/tb_SintetizadorFrec.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /DUT=SintetizadorFrec_7_1200mv_85c_vhd_slow.sdo -L altera -L cycloneive -L gate_work -L work -voptargs="+acc"  tb_sintetizadorFrec

add wave *
view structure
view signals
run -all
