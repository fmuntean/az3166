# My notes and findings related this AZ3166 board

This board is based on the EMW3166 module from MXCHIP:
http://mxchip.cc/wifi/EMW3166-P.html

EMW3166 is a single 2.6v-3.6V powered embedded Wi-Fi module integrating Wi-Fi and Cortex-M4 MCU (ST - STM32F412). 
EMW3166 has 256KB RAM, 1MB on-chip Flash, 2MB off-chip SPI Flash, Cortex-M4 MCU with a frequency of up to 100MHz, and UART/I2C/ADC/PWM/SPI/GPIO interfaces. EMW3166 includes IEEE 802.11 b/g/n WLAN MAC/Baseband/RF, as well as built-in PCB antenna.


[Internal Photo](https://cdn-0.fccid.io/png.php?id=3234831&page=0)


Official Microsoft Page: https://microsoft.github.io/azure-iot-developer-kit/

Microsoft IOT DEVKIT Documentation: https://microsoft.github.io/azure-iot-developer-kit/docs/projects/ 

The Arduino SDK: https://github.com/microsoft/devkit-sdk I have this forked under the https://github.com/fmuntean/az3166-devkit-sdk

This repo seems to contain a list of precompiled binaries:
- bootloader/boot.bin
  - http://mxchip.cc/Document/20171219194759.html
  - http://mxchip.cc/Document/20171219231643.html
  - https://docs.mxchip.com/en/xgk73y/orruioi3xg1n8ate.html
  - https://github.com/MXCHIP/mico-os/blob/master/sub_build/bootloader/BootloaderEntrance.c
- System/libdevkit-sdk-core-lib.a 
  - https://github.com/arthma/devkit-sdk-core-lib
- System/az3166-driver/libstsafe.a
- System/az3166-driver/libwlan/TARGET_EMW1062/libwlan.a
 


https://github.com/VSChina/azureiotdevkit_tools

https://github.com/Azure/azure-iot-sdk-c

PlatformIO framework repository for the MXCHIP AZ3166 board: https://github.com/platformio/platform-ststm32/blob/master/builder/frameworks/arduino/mxchip.py (however as of today is very old.)


## Other links:
https://github.com/MXCHIP

MICO OS: Mico-controller based Internet Connectivity Operation System: https://github.com/MXCHIP/mico-os

https://github.com/MXCHIP/mbed-os-AZ3166

https://github.com/peterblazejewicz/az3166-mxchip-iot-devkit-pinout
https://github.com/StephenMMorris-PB/framework-arduinostm32mxchip
https://github.com/kfessel/mxchip-iot-devkit
https://github.com/arthma/devkit-sdk-core-lib
https://github.com/liydu/mxchip-az3166
https://github.com/obastemur/mxchip_az3166_firmware
https://github.com/SeeedJP/mbed-az3166-driver

# STM32F103CBT6
DEV KIT contains an externalARM Cortex-M3 STM32F1 Microcontroller IC 32-Bit Single-Core 72MHz 128KB (128K x 8) FLASH

Used for programming and is wired to the Debug Serial IO and JTAG pins of the EMW3166 module.

The board USB is wired to this uController.
A green LED is connected and controlled by this uC during the programming phase.

Header4: is the Serial JTAG for this uC.

**Note**: Currently I don't know where the firmware for this device is.

This one is handling the external storage too. I guess reading the external flash from the EMW3166 module.


# STM32F412 

Program memory, data memory, registers and I/O ports are organized within the same linear 4-Gbyte address space.

The bytes are coded in memory in Little Endian format. The lowest numbered byte in a word is considered the word’s least significant byte and the highest numbered byte the most significant.

The addressable memory space is divided into 8 main blocks, of 512 Mbytes each.

## Internal Flash:
The Flash memory is organized as follows (from DataSheet):
– A main memory block divided into 4 sectors of 16 Kbyte, plus 1 sector of 64 Kbyte and plus 7 sector of 128 Kbyte.
- System memory from which the device boots in System memory boot mode
– 512 OTP (one-time programmable) bytes for user data
The OTP area contains 32 additional bits used to lock the corresponding OTP 
data block.
– Option bytes to configure read and write protection, BOR level, watchdog 
software/hardware and reset when the device is in Standby or Stop mode.

Table 5. Flash module organization 

|Block  Name  | Block base addresses      | Size|
|-------------|:---------------------------:|-----:|
|Main memory|
|Sector 0     | 0x0800 0000 - 0x0800 3FFF |16 Kbyte|
|Sector 1     | 0x0800 4000 - 0x0800 7FFF |16 Kbyte|
|Sector 2     | 0x0800 8000 - 0x0800 BFFF |16 Kbyte|
|Sector 3     | 0x0800 C000 - 0x0800 FFFF |16 Kbyte|
|Sector 4     | 0x0801 0000 - 0x0801 FFFF |64 Kbyte|
|Sector 5     | 0x0802 0000 - 0x0803 FFFF |128 Kbyte|
|Section 6    | 0x0804 0000 - 0x0805 FFFF |128 Kbyte|
|Section 7    | 0x0806 0000 - 0x0807 FFFF |128 Kbyte|
|Section 8    | 0x0808 0000 - 0x0809 FFFF |128 Kbyte|
|Section 9    | 0x080A 0000 - 0x080B FFFF |128 Kbyte|
|Section 10   | 0x080C 0000 - 0x080D FFFF |128 Kbyte|
|Section 11   | 0x080E 0000 - 0x080F FFFF |128 Kbyte|
|||||
|System memory| 0x1FFF 0000 - 0x1FFF 77FF |30 Kbyte|
|OTP area     | 0x1FFF 7800 - 0x1FFF 7A0F |528 byte|
|Option bytes | 0x1FFF C000 - 0x1FFF C00F |16 byte|

## External Flash:
In memory-mapped mode, the external Flash memory is seen as internal memory but with 
some latency during accesses. Only read operations are allowed to the external Flash 
memory in this mode.

## Partitions:

Logic partition on flash devices: https://github.com/MXCHIP/mico-os/blob/master/board/AZ3166/mico_board.c

|Define name | Device| Name | Start | Length|
|-------------------------|-------------------|----------|---------|-----|
|MICO_PARTITION_BOOTLOADER|MICO_FLASH_EMBEDDED|Bootloader|0x08000000|0x8000 //32k bytes|
|MICO_PARTITION_APPLICATION|MICO_FLASH_EMBEDDED|Application|0x08008000|0xF8000 //992k bytes|
|MICO_PARTITION_ATE|MICO_FLASH_EMBEDDED|ATEFirmware|0x080A0000|0x60000 //384k bytes|
|MICO_PARTITION_PARAMETER_1|MICO_FLASH_QSPI|PARAMETER1|0x0|0x1000 //4k bytes|
|MICO_PARTITION_PARAMETER_2|MICO_FLASH_QSPI|PARAMETER2| 0x1000|0x1000 //4k bytes|
|MICO_PARTITION_RF_FIRMWARE|MICO_FLASH_QSPI|RF Firmware| 0x2000|0x6E000 //440k bytes|
|MICO_PARTITION_OTA_TEMP|MICO_FLASH_QSPI|OTA Storage| 0x70000| 0x98000 //608k bytes|
|MICO_PARTITION_FILESYS| MICO_FLASH_QSPI|FILESYS|0x118000| 0x0E8000 //928k bytes|



# PlatformIO Custom Framework Guidance: 
Looks like it is possible to leverage using just github. A little bit of reverse engineering here:
	1. need to have a package.json at the root of my “framework” project, e.g. from simba:
https://github.com/eerimoq/simba/blob/master/package.json
Project should synchronize the version in this file with release/tag versions of repo.
This way, a binary tgz of the repo at a particular release version (including package.json) can be obtained from github, e.g. “https://github.com/eerimoq/simba/archive/15.0.3.tar.gz 2”
	1. need to have manifest which points to above versioned framework artifact listed in platform.json of platform repo. This can be directly listed in packageRepositories section or pointer to manifest.json kept somewhere else. In this example I see Simba project again has placed this in master branch of framework repo - convenient! e.g.,
https://github.com/eerimoq/simba/blob/master/make/platformio/manifest.json
	1. also there seems to be how the build integration with target framework is handled by calling the builder framework py script. Again, Simba framework example from esp8266 platform:
https://github.com/platformio/platform-espressif8266/blob/develop/builder/frameworks/simba.py
Which instead of hardcoding many things, instead calls makefile targets on simba framework, which just calls another py buildscript which seems to handle the framework specific stuff.
https://github.com/eerimoq/simba/blob/master/make/platformio/platformio.py
Overall, this seems to be a decent abstraction which keeps most framework details (including metadata) inside the framework repo itself.

From <https://community.platformio.org/t/custom-framework-development-guidance/4716/2> 
