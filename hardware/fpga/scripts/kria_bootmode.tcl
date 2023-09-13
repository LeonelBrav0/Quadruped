#######################################################################################
# This script will overwrite the hardwired boot mode on the KV260 and boot the Kria   #
# from eighter JTAG or the SD card.                                                   #
#                                                                                     #
# Usage:                                                                              #
# $ source /opt/Xilinx/Vivado/2020.2/settings64.sh                                    #
# $ xsct kria_bootmode.tcl sd                                                         #
#######################################################################################

# Check for arguments
if { $argc != 1 } {
    puts "The kria_bootmode.tcl script requires one argument."
    puts "$ xsct kria_bootmode.tcl sd"
    exit 2
}

# Assign list elements to variables
lassign $argv bootmode

connect
targets -set -filter {name =~ "PSU"}
stop

if {$bootmode == "jtag"} {
    puts "Switch to JTAG bootmode"
    targets -set -nocase -filter {name =~ "PSU"}
    stop
    # update multiboot to ZERO
    mwr 0xffca0010 0x0
    # change boot mode to JTAG
    mwr 0xff5e0200 0x0100
    # reset
    rst -system
} elseif {$bootmode == "sd"} {
    puts "Switch to SD1 bootmode"
    # update multiboot to ZERO
    mwr 0xffca0010 0x0
    # change boot mode to SD
    mwr 0xff5e0200 0x5100
    # reset
    rst -system

    #Sometimes A53 may be held in reset catch .. so start it with "con"
    after 2000
    con
} elseif {$bootmode == "qspi"} {
    ############################
    # Switch to QSPI boot mode #
    ############################
    targets -set -filter {name =~ "PSU"}
    # update multiboot to ZERO
    mwr 0xffca0010 0x0
    # change boot mode to QSPI
    mwr 0xff5e0200 0x2100
    # reset
    rst -system
    #A53 may be held in reset catch, start it with "con"
    after 2000
    con
} elseif {$bootmode == "usb"} {
    ############################
    # Switch to usb0 boot mode #
    ############################
    targets -set -nocase -filter {name =~ "PSU"}
    # update multiboot to ZERO
    mwr 0xffca0010 0x0
    # change boot mode to EMMC
    mwr 0xff5e0200 0x7100
    # reset
    rst -system
    #A53 may be held in reset catch, start it with "con"
    after 2000
    con
} else {
    puts "Unsupported bootmode $bootmode"
}

puts "Done!!"