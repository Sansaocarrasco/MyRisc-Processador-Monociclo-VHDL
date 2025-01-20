cd /home/runner
export PATH=/usr/bin:/bin:/tool/pandora64/bin:/usr/share/Riviera-PRO/bin:/usr/local/bin
export RIVIERA_HOME=/usr/share/Riviera-PRO
export CPLUS_INCLUDE_PATH=/usr/share/Riviera-PRO/interfaces/include
export ALDEC_LICENSE_FILE=27009@10.116.0.5
export HOME=/home/runner
vlib work && vcom '-2019' '-o' mux232.vhd rreg32.vhd adder32.vhd rom.vhd fetch.vhd control.vhd registers.vhd decode.vhd ram.vhd alucontrol.vhd alu.vhd memoryAccess.vhd writeBack.vhd execute.vhd mux35.vhd ImmSll.vhd mux332.vhd design.vhd testbench2.vhd testbench.vhd  && vsim -c -do "vsim testbench2; run -all; exit"  ; echo 'Creating result.zip...' && zip -r /tmp/tmp_zip_file_123play.zip . && mv /tmp/tmp_zip_file_123play.zip result.zip