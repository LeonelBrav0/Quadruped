# (C) Copyright 2020 - 2021 Xilinx, Inc.
# SPDX-License-Identifier: Apache-2.0

RM = rm -rf
VIVADO = $(XILINX_VIVADO)/bin/vivado
JOBS ?= 8
PROJ_NAME ?= Project_Q

VIV_PRJ_DIR = project
VIV_SCRIPTS_DIR = /home/use/Projects/quadruped/hardware/fpga/scripts

VIV_XSA = $(VIV_PRJ_DIR)/*.xsa
VIV_SRC = $(VIV_SCRIPTS_DIR)/vivado_main.tcl

.PHONY: help
help:
	@echo 'Usage:'
	@echo ''
	@echo '  make xsa'
	@echo '    Generate extensible xsa for platform generation'
	@echo ''

.PHONY: all
all: xsa

xsa: $(VIV_XSA)
$(VIV_XSA): $(VIV_SRC)
	$(VIVADO) -mode batch -notrace -source $(VIV_SRC) -tclargs -jobs $(JOBS) -proj_name $(PROJ_NAME)

.PHONY: clean
clean:
	$(RM) $(VIV_PRJ_DIR) vivado* .Xil *dynamic* *.log *.xpe *.jou 

