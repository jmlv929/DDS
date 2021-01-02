@echo off
set xv_path=D:\\Xilinx2016p4\\Vivado\\2016.4\\bin
call %xv_path%/xsim DDS_tb_behav -key {Behavioral:sim_1:Functional:DDS_tb} -tclbatch DDS_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
