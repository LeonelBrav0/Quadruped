<!-- Hardware Workflow:
    Generate .xsa
        Generate petalinux
            petalinux-config --get-hw-description ../vivado/project/Project_Q.xsa --silentconfig
            *(petalinux-config -c **)
            petalinux-build
            *(petaliunx-build --sdk)
            petalinux-package --boot --u-boot --force
            petalinux-package --wic --images-dir images/linux/ --bootfiles "ramdisk.cpio.gz.u-boot,boot.scr,Image,system.dtb,system-zynqmp-sck-kr-g-revB.dtb" --disk-name "sda"
            *(ls -latr images/linux/ | grep wic)
        Generate dtbo
            cd /home/use/Projects/quadruped/hardware/fpga/deploy/build/
            xsct
            createdts -hw /home/use/Projects/quadruped/hardware/fpga/vivado/project/Project_Q.xsa -zocl -platform-name Project_Q -git-branch xlnx_rel_v2022.2 -overlay -compile -out ./Project_Q
            exit
            dtc -@ -O dtb -o ./Project_Q/Project_Q/Project_Q/psu_cortexa53_0/device_tree_domain/bsp/pl.dtbo ./Project_Q/Project_Q/Project_Q/psu_cortexa53_0/device_tree_domain/bsp/pl.dtsi 
            <copy .bin file from vivado & copy pl.dtbo from build into deploy folder>
            cp Project_Q/Project_Q/Project_Q/psu_cortexa53_0/device_tree_domain/bsp/pl.dtbo ~/Projects/quadruped/hardware/fpga/deploy/
            cp /home/use/Projects/quadruped/hardware/fpga/vivado/project/Project_Q.runs/impl_1/Project_Q_wrapper.bin ~/Projects/quadruped/hardware/fpga/deploy/
            <rename .bin to Project_Q.bit.bin, pl.dtbo to Project_Q.dtbo>
            cd /home/use/Projects/quadruped/hardware/fpga/deploy
            mv pl.dtbo Project_Q.dtbo
            mv Project_Q_wrapper.bin Project_Q.bit.bin 
            vi shell.json
                {
                    "shell_type" : "XRT_FLAT",
                    "num_slots" : "1"
                }
    
    Boot Kria
        cd /home/use/Projects/quadruped/hardware/fpga/deploy/
        *(ssh-keygen -f "/home/use/.ssh/known_hosts" -R "192.168.1.228")
        scp Project_Q.bit.bin Project_Q.dtbo shell.json petalinux@192.168.1.228:/home/petalinux

        sudo mkdir /lib/firmware/xilinx/Project_Q
        sudo cp shell.json Project_Q.bit.bin Project_Q.dtbo /lib/firmware/xilinx/Project_Q/
        *(sudo xmutil listapps) // Project_Q should be there
        <reboot kria>
        sudo xmutil unloadapp
        sudo xmutil loadapp Project_Q
         -->

<!-- Software Workflow:
    cd software/build
    cmake .. -Ddevice=<device-id> // [1 = Testing on x86_64] [2 = Deploy on ARM]

    // Make deployment
    scp quadruped petalinux@<KR260 IP Address>:/home/petalinux -->

---

# Quadruped Project Workflow

This document provides a step-by-step guide for the hardware and software workflows for the Quadruped project.

## Hardware Workflow

### 1. Generate `.xsa`

#### a. Generate Petalinux

```bash
petalinux-config --get-hw-description ../vivado/project/Project_Q.xsa --silentconfig
# Optional configurations
# petalinux-config -c **
petalinux-build
# Optional SDK build
# petalinux-build --sdk
petalinux-package --boot --u-boot --force
petalinux-package --wic --images-dir images/linux/ --bootfiles "ramdisk.cpio.gz.u-boot,boot.scr,Image,system.dtb,system-zynqmp-sck-kr-g-revB.dtb" --disk-name "sda"
# Optional listing
# ls -latr images/linux/ | grep wic
```

#### b. Generate `dtbo`

```bash
cd /home/use/Projects/quadruped/hardware/fpga/deploy/build/
xsct
createdts -hw /home/use/Projects/quadruped/hardware/fpga/vivado/project/Project_Q.xsa -zocl -platform-name Project_Q -git-branch xlnx_rel_v2022.2 -overlay -compile -out ./Project_Q
exit
dtc -@ -O dtb -o ./Project_Q/Project_Q/Project_Q/psu_cortexa53_0/device_tree_domain/bsp/pl.dtbo ./Project_Q/Project_Q/Project_Q/psu_cortexa53_0/device_tree_domain/bsp/pl.dtsi 

# Copy files
cp Project_Q/Project_Q/Project_Q/psu_cortexa53_0/device_tree_domain/bsp/pl.dtbo ~/Projects/quadruped/hardware/fpga/deploy/
cp /home/use/Projects/quadruped/hardware/fpga/vivado/project/Project_Q.runs/impl_1/Project_Q_wrapper.bin ~/Projects/quadruped/hardware/fpga/deploy/

# Rename files
cd /home/use/Projects/quadruped/hardware/fpga/deploy
mv pl.dtbo Project_Q.dtbo
mv Project_Q_wrapper.bin Project_Q.bit.bin 

# Edit shell.json
vi shell.json
```

Inside `shell.json`:

```json
{
    "shell_type" : "XRT_FLAT",
    "num_slots" : "1"
}
```

### 2. Boot Kria

```bash
cd /home/use/Projects/quadruped/hardware/fpga/deploy/
# Optional SSH key regeneration
# ssh-keygen -f "/home/use/.ssh/known_hosts" -R "192.168.1.228"
scp Project_Q.bit.bin Project_Q.dtbo shell.json petalinux@192.168.1.228:/home/petalinux

sudo mkdir /lib/firmware/xilinx/Project_Q
sudo cp shell.json Project_Q.bit.bin Project_Q.dtbo /lib/firmware/xilinx/Project_Q/
# Optional app listing
# sudo xmutil listapps
# Reboot Kria
sudo xmutil unloadapp
sudo xmutil loadapp Project_Q
```

## Software Workflow

```bash
cd software/build
cmake .. -Ddevice=<device-id> # [1 = Testing on x86_64] [2 = Deploy on ARM]

# Make deployment
scp quadruped petalinux@<KR260 IP Address>:/home/petalinux
```

---




Debug:

Petalinux JTAG boot (requires .wic)
    petalinux-package --prebuilt --fpga images/linux/system.bit --force
    petalinux-boot --jtag --prebuilt 3 --hw_server-url <hostname:3121>

Open terminal
    sudo screen /dev/ttyUSB<device_num> 115200
    killall screen


Debug: Cannot find mount point for boot
    sd card uses dev/sda1 and dev/sda2
    Issue: Cannot find sda1 nor sda2
    temp solution is to mount in /dev/ram instead " earlycon console=ttyPS1,115200 clk_ignore_unused root=/dev/ram0 rw init_fatal_sh=1" (not actually tried)

    --now changing Vivado to support usb and interrupts
    (Ignore this: Now using new BSP where we mount on /dev/sda )

Where is readme.md?
    https://support.xilinx.com/s/question/0D52E00006iHqAvSAK/vivado-20202-cant-not-find-platform-interface?language=en_US

Enabling TCF from PetaLinux 
    https://www.beyond-circuits.com/wordpress/tutorial/tutorial25/#:~:text=Configuring%20Linux%20for%20Debugging&text=Press%20return%20to%20select%20Filesystem,back%20out%20of%20petalinux%2Dconfig.
    better:
    https://docs.xilinx.com/r/en-US/ug1144-petalinux-tools-reference-guide/Preparing-the-Build-System-for-Debugging?tocId=wj4lwcoPKe3Cco5o1qG_IQ

Board bringup if failed mount:
    https://github.com/Xilinx/KRS/blob/main/sphinx/source/docs/howto.md

    Problem ended up being wrong petalinux bsp installed 

Tutorials:
    Kria KR260 Template:
    https://www.hackster.io/whitney-knitter/getting-started-with-the-kria-kr260-in-vivado-2022-1-33746d
    https://www.hackster.io/whitney-knitter/add-peripheral-support-to-kria-kr260-vivado-2022-1-project-874960
    https://www.hackster.io/whitney-knitter/getting-started-with-the-kria-kr260-in-petalinux-2022-1-daec16#overview
    https://www.hackster.io/whitney-knitter/rpi-pmod-connector-gpio-with-custom-pl-design-in-kria-kr260-53c40e
    https://www.hackster.io/whitney-knitter/independent-custom-rtl-designs-on-kria-kr260-d5cd0b
    https://www.hackster.io/whitney-knitter/accelerated-design-development-on-kria-kr260-in-vitis-2022-1-883799

    Using SPI Device in ZynqMP:
    https://support.xilinx.com/s/article/SPIDEV-application-using-PS-SPI-on-ZYNQMP?language=en_US
    (Have to enable user mode spidev driver support in petalinux)

Updating Linux Device Tree ZynqMP:
    First, copy the system-user.dtsi file into the <Project
    Path>/components/plnx_workspace/device-tree/device-tree folder (if not already there) from
    <Project Path>/project-spec/meta-user/recipes-bsp/device-tree/files. 
    
    Update the file with desired device-tree changes.

    Modify the system-top.dts file to replace all instances of #include with /include/. In my project,
    this is the only file with #includes. This is really just to make a change to this file. EDIT: You
    can actually just add a space character and save.

    Perform the following commands (see note below about distclean):
    petalinux-build -c device-tree -x cleansstate
    petalinux-build -c device-tree
    petalinux-build -c kernel -x distclean
    petalinux-build -c kernel
    
    The device-tree builds update the system.dtb file in the <Project Path>/images/Linux folder. The kernel builds pull those changes into the kernel images (e.g. image.ub). EDIT: As an
    alternative to distclean, which will wipe out any kernel configuration changes that you may
    have made, you could use "petalinux-config -c kernel", toggle anything on and off (resulting in
    no actual configuration change), save the kernel, and then just perform a petalinux-build. Or
    better yet, you could probably just run the touch command on the kernel configuration file (if
    you know where it is) and then perform the petalinux-build.

## Register Calculations

1. **TSUSTA Register (Setup time for a repeated START condition)**
   - Encoder: tSU;STA = 0.26μs
   - Multiplexer: tsts = 4.7μs (Standard Mode)
   - We should use the maximum value to ensure compatibility: 4.7μs
   - Register Value = 4.7μs / 40ns = 117.5 (rounded up to 118)

2. **TSUSTO Register (Setup time for a repeated STOP condition)**
   - Encoder: tSU;STO = 0.26μs
   - Multiplexer: tsps = 4μs (Standard Mode)
   - We should use the maximum value: 4μs
   - Register Value = 4μs / 40ns = 100

3. **THDSTA Register (Hold time for a repeated START condition)**
   - Encoder: tHD;STA = 0.26μs
   - Multiplexer: tsth = 4μs (Standard Mode)
   - We should use the maximum value: 4μs
   - Register Value = 4μs / 40ns = 100

4. **TSUDAT Register (Data setup time)**
   - Encoder: tSU;DAT = 50ns
   - Multiplexer: tsds = 250ns (Standard Mode)
   - We should use the maximum value: 250ns
   - Register Value = 250ns / 40ns = 6.25 (rounded up to 7)

5. **TBUF Register (Bus free time between a STOP and START condition)**
   - Encoder: tBUF = 0.5μs
   - Multiplexer: tbuf = 4.7μs (Standard Mode)
   - We should use the maximum value: 4.7μs
   - Register Value = 4.7μs / 40ns = 117.5 (rounded up to 118)

6. **THIGH Register (High period of the scl clock)**
   - Using the formula provided:
     Value = ((AXI Clock frequency in Hz)/(2 × IIC frequency in Hz)) – 7 – SCL_INERTIAL_DELAY
   - For Encoder: IIC frequency = 1MHz
     Value = ((25e6)/(2 × 1e6)) - 7 = 5.5 (rounded up to 6)
   - For Multiplexer (Standard Mode): IIC frequency = 100kHz
     Value = ((25e6)/(2 × 100e3)) - 7 = 118
   - We should use the maximum value: 118

7. **TLOW Register (Low period of the scl clock)**
   - Encoder: tLOW = 0.5μs
   - Multiplexer (Standard Mode): tscl = 4.7μs
   - We should use the maximum value: 4.7μs
   - Register Value = 4.7μs / 40ns = 117.5 (rounded up to 118)

8. **THDDAT Register (Data hold time)**
   - Encoder: tHD;DAT = 0.45μs
   - Multiplexer doesn't specify this, so we'll use the encoder's value.
   - Register Value = 0.45μs / 40ns = 11.25 (rounded up to 12)

## Summary of Register Values:
- TSUSTA: 118
- TSUSTO: 100
- THDSTA: 100
- TSUDAT: 7
- TBUF: 118
- THIGH: 118
- TLOW: 118
- THDDAT: 12
