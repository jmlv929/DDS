@echo off
set xv_path=D:\\Xilinx2016p4\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 0adcfa989dd844d98823cb39650a04f0 -m64 --debug typical --relax --mt 2 -L blk_mem_gen_v8_3_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot DDS_tb_behav xil_defaultlib.DDS_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
