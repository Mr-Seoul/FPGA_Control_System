SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += ../Controller.sv

COCOTB_TOPLEVEL = controller

# COCOTB_TEST_MODULES is the basename of the Python test file(s)
COCOTB_TEST_MODULES = PlotResponse

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim