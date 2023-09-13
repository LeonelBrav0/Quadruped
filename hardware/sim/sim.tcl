set DUMP_WAVEFORM 1
set MULTI_CORE 0

set GTEST_DPI 0
set GTEST_DPI_PATH "unit_test/build"
set GTEST_DPI_LIB "dpi_test"

set TOP_SIM_MODULE "q_top_tb"
set RTL_FILELIST "../filelist/rtl.f"

set VSIM_OPTIONS "work.${TOP_SIM_MODULE} "

#set VLOG_OPTIONS " -32 -lint -sv -f ${RTL_FILELIST} tb/${TOP_SIM_MODULE}.sv -top ${TOP_SIM_MODULE}"
set VLOG_OPTIONS "tb/${TOP_SIM_MODULE}.sv -f ${RTL_FILELIST}"

if {$GTEST_DPI == 1} {
    set VSIM_OPTIONS "$VSIM_OPTIONS -sv_root ${GTEST_DPI_PATH} -sv_lib ${GTEST_DPI_LIB}"
}

eval [format "vlog %s" $VLOG_OPTIONS]
eval [format "vsim %s" $VSIM_OPTIONS]
eval [format "run -all"]

#eval [format "qrun %s %s %s" $VLOG_OPTIONS $VOPT_OPTIONS $VSIM_OPTIONS]

exit