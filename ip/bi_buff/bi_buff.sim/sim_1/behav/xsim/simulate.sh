#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sat Dec 28 13:45:52 CET 2019
# SW Build 2729669 on Thu Dec  5 04:48:12 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim bi_buff_tb_behav -key {Behavioral:sim_1:Functional:bi_buff_tb} -tclbatch bi_buff_tb.tcl -log simulate.log"
xsim bi_buff_tb_behav -key {Behavioral:sim_1:Functional:bi_buff_tb} -tclbatch bi_buff_tb.tcl -log simulate.log
