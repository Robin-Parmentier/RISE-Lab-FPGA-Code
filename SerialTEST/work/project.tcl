set projDir "C:/Users/RISELab/Documents/mojo/SerialTEST/work/planAhead"
set projName "SerialTEST"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/mojo_top_0.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/reset_conditioner_1.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/avr_interface_2.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/reg_interface_3.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/quadencoder_4.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/quadencoder_4.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/pwm_6.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/cclk_detector_7.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/spi_slave_8.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/uart_rx_9.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/uart_tx_10.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/pipeline_11.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/pipeline_11.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/edge_detector_13.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/edge_detector_13.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/edge_detector_15.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/edge_detector_15.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/pipeline_11.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/pipeline_11.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/edge_detector_13.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/edge_detector_13.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/edge_detector_15.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/edge_detector_15.v" "C:/Users/RISELab/Documents/mojo/SerialTEST/work/verilog/counter_23.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/RISELab/Documents/mojo/SerialTEST/constraint/encoders.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
