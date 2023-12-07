onerror {quit -f}
vlib work
vlog -work work acumulador8.vo
vlog -work work acumulador8.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.acumulador8_vlg_vec_tst
vcd file -direction acumulador8.msim.vcd
vcd add -internal acumulador8_vlg_vec_tst/*
vcd add -internal acumulador8_vlg_vec_tst/i1/*
add wave /*
run -all
