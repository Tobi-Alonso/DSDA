onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label {clk 50} /tb_sintetizadorfrec/clock_50
add wave -noupdate -label {clk sel} /tb_sintetizadorfrec/clock_sel
add wave -noupdate -label {clk out} /tb_sintetizadorfrec/clock_out
add wave -noupdate -label dig1 /tb_sintetizadorfrec/siete_seg1
add wave -noupdate -label dig0 /tb_sintetizadorfrec/siete_seg0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 79
configure wave -valuecolwidth 52
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
WaveRestoreZoom {0 ps} {30620863764383 ps}
