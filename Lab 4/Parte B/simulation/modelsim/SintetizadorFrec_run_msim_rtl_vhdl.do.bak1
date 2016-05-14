transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/tobia/Google Drive/Facu/9 semestre/VHDL - FPGA/Proyectos/Lab 4/SintetizadorFrec/rtl_src/SintetizadorFrec.vhd}
vcom -93 -work work {C:/Users/tobia/Google Drive/Facu/9 semestre/VHDL - FPGA/Proyectos/Lab 4/SintetizadorFrec/rtl_src/DivisorFrec.vhd}
vcom -93 -work work {C:/Users/tobia/Google Drive/Facu/9 semestre/VHDL - FPGA/Proyectos/Lab 4/SintetizadorFrec/rtl_src/Deco7Seg.vhd}
vcom -93 -work work {C:/Users/tobia/Google Drive/Facu/9 semestre/VHDL - FPGA/Proyectos/Lab 4/SintetizadorFrec/rtl_src/registro.vhd}

vcom -93 -work work {C:/Users/tobia/Google Drive/Facu/9 semestre/VHDL - FPGA/Proyectos/Lab 4/SintetizadorFrec/testbench/tb_SintetizadorFrec.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  tb_sintetizadorFrec

add wave *
view structure
view signals
run -all
