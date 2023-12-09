onerror {exit -code 1}
vlib work
vlog -work work MaquinaDeSalgadosFinal.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.vending_machine_vlg_vec_tst -voptargs="+acc"
vcd file -direction MaquinaDeSalgadosFinal.msim.vcd
vcd add -internal vending_machine_vlg_vec_tst/*
vcd add -internal vending_machine_vlg_vec_tst/i1/*
run -all
quit -f
