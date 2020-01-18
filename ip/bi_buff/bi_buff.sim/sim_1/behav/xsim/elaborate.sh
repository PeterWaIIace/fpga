#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Sat Jan 18 03:03:30 CET 2020
# SW Build 2729669 on Thu Dec  5 04:48:12 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 867648cfd9554671817fc1e2964b8548 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot bi_buff_tb_behav xil_defaultlib.bi_buff_tb -log elaborate.log"
xelab -wto 867648cfd9554671817fc1e2964b8548 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot bi_buff_tb_behav xil_defaultlib.bi_buff_tb -log elaborate.log

