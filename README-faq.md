# CDTV OS 2.35 - FAQ

- [CDTV OS 2.35 - FAQ](#cdtv-os-235---faq)
  - [About CDTV OS 2.35](#about-cdtv-os-235)
    - [What is CDTV OS exactly?](#what-is-cdtv-os-exactly)
    - [Is this an official CDTV OS ROM release?](#is-this-an-official-cdtv-os-rom-release)
    - [Is this another ROM hack?](#is-this-another-rom-hack)
    - [Will you share the source code?](#will-you-share-the-source-code)
    - [Why can't I download the CDTV OS 2.35 ROM image anywhere?](#why-cant-i-download-the-cdtv-os-235-rom-image-anywhere)
    - [Was CDTV OS ever used as a term or are you just making this up?](#was-cdtv-os-ever-used-as-a-term-or-are-you-just-making-this-up)
    - [Is CDTV OS ROM the same as CDTV Extended ROM?](#is-cdtv-os-rom-the-same-as-cdtv-extended-rom)
    - [How did you reverse engineer the CDTV OS ROM?](#how-did-you-reverse-engineer-the-cdtv-os-rom)
    - [Why did you make this ROM?](#why-did-you-make-this-rom)
  - [Compatibility](#compatibility)
    - [What Kickstart ROM versions are compatible with CDTV OS 2.35?](#what-kickstart-rom-versions-are-compatible-with-cdtv-os-235)
    - [Does the CDTV OS 2.35 ROM also work on my A570 or A690?](#does-the-cdtv-os-235-rom-also-work-on-my-a570-or-a690)
    - [Does CDTV OS 2.35 also support 68040 and 68060 accelerators?](#does-cdtv-os-235-also-support-68040-and-68060-accelerators)
    - [Does CDTV OS 2.35 work with PiStorm?](#does-cdtv-os-235-work-with-pistorm)
    - [Which 68030 based accelerators can be used in a CDTV player?](#which-68030-based-accelerators-can-be-used-in-a-cdtv-player)
  - [Technical stuff](#technical-stuff)
    - [Why exactly does the CD-ROM drive stop working on all other ROMs except yours when you install a 68030 accelerator and/or 32-bit Fast RAM in a CDTV player?](#why-exactly-does-the-cd-rom-drive-stop-working-on-all-other-roms-except-yours-when-you-install-a-68030-accelerator-andor-32-bit-fast-ram-in-a-cdtv-player)
    - [You say that the ROM uses the 68030 MMU to do cache-inhibit, but SysInfo and any other tool says the MMU is unused. What gives?](#you-say-that-the-rom-uses-the-68030-mmu-to-do-cache-inhibit-but-sysinfo-and-any-other-tool-says-the-mmu-is-unused-what-gives)
  - [TF536](#tf536)
    - [Why do I need to update my TF536 firmware?](#why-do-i-need-to-update-my-tf536-firmware)
    - [How is the CDTV specific TF536 firmware different?](#how-is-the-cdtv-specific-tf536-firmware-different)
  - [Troubleshooting](#troubleshooting)
    - [My 68030 equipped A500/A500+ with A570 is randomly crashing. What's up?](#my-68030-equipped-a500a500-with-a570-is-randomly-crashing-whats-up)
    - [Why do some CDTV titles not work on my system?](#why-do-some-cdtv-titles-not-work-on-my-system)
    - [What is the HDD bootdelay?](#what-is-the-hdd-bootdelay)
    - [How do I set the HDD boot delay?](#how-do-i-set-the-hdd-boot-delay)
  - [EPROM burning](#eprom-burning)
    - [Do I need to split or byteswap the ROM images for burning to EPROM?](#do-i-need-to-split-or-byteswap-the-rom-images-for-burning-to-eprom)

## About CDTV OS 2.35
### What is CDTV OS exactly?
CDTV OS is the name for all the additional functionality provided by the resident modules inside the CDTV OS ROM, a.k.a. Extended ROM, which is required to make a CDTV player function. It contains -amongst other things- drivers and libraries for the CD-ROM drive, the CDTV memory cards, ISO9660 filesystem support, but also applications and user interface stuff like the CD-Audio playback application, the Preferences screen, the CD+G playback application and more. It integrates with and depends on several exisiting Amiga operating system modules in the Kickstart ROM. 

CDTV OS is not a full operating system in the traditional sense. A crude but apt modern day comparison is the system software/firmware for modern day game consoles. It's just harder to update because you need to replace ROM chips instead of using the update feature of your game console.

### Is this an official CDTV OS ROM release?
No. This is a "custom" ROM. It is not affiliated with, nor is it endorsed by the Amiga Corporation, which is the current owner of the Amiga's IP (and hence also CDTV), nor is it affiliated with or endorsed by Hyperion BVBA (a licensee).

### Is this another ROM hack? 
Most definitely not. A lot of time has gone into reverse engineering the original binary ROM code for this project. This was necessary because the original CDTV OS firmware/software is not open source. The result of the reverse engineering process is 100% assembler source code that can be built into a byte-by-byte exact binary copy of the original ROM modules on modern day machines using open source software. The source code can then be used to easily update, bugfix or otherwise improve these modules. This allows further development of the CDTV OS without needing access to the original Commodore source code anymore.

### Will you share the source code?
I would love to put the source code of the reverse engineered ROM modules on my GitHub page, but I cannot. Although reverse engineering the CDTV OS ROM into source code is all my own work, the resulting source code is still a derivative of the original Commodore ROM and as such contains intellectual property that belongs to Amiga Corporation (Cloanto). I cannot distribute this source code without their permission (which is very unlikely to happen anyway, because the original code is not open source as it is).

### Why can't I download the CDTV OS 2.35 ROM image anywhere?
Although the bugfixes, modifications, and new features that went into CDTV OS 2.35 are all my own work, the resulting ROM image is still a derivative of the original Commodore ROM and as such contains intellectual property that belongs to Amiga Corporation (Cloanto). I have been in touch with Amiga Corporation about making my work part of an official ROM release in whatever shape or form. The contact was very cordial, but -and this is my interpretation of the situation- the currently on-going legal proceedings between Amiga Corporation and Hyperion are making such a release complicated at this point in time. Perhaps once this court case is over my work will be available in a more user friendly manner, but until then this patch method is the best I can do without breaching copyright.

### Was CDTV OS ever used as a term or are you just making this up?
The term CDTV OS has been used by:

-  Carl Sassenrath (creator of the Amiga Exec kernel and many CDTV OS components like cdtv.device, bookmark/cardmark.device, cdfs.library and cdstrap): _"My original CDTV development board (1990) that I used to build and test the CDTV OS, drivers, libs, etc"_ . Source: http://www.rebol.com/article/0491.html
- Reichart von Wolfsheild, another member of the CDTV project team (playerprefs.library, debox.library): _"The core team that made the CDTV OS were Carl Sassenrath (who now is working with Roku), Jim Sachs, Will Ware, Leo Schwab, and myself."_  Source: https://www.gregdonner.org/workbench/wb_cdtv.html: 
- Additionally, the official CDTV Developer Reference manual (1992) from Commodore uses the same term in paragraph 3.3.3: _"There is a bug in the V1.3 graphics.library which can cause the CDTV unit to come up in NTSC mode even though it should come up in PAL mode. There is an update of the CDTV OS ROM which fixes this problem."_ Source: https://archive.org/details/CDTV_Developer_Reference_Manual/page/n253/mode/2up?q=%22cdtv+os%22

### Is CDTV OS ROM the same as CDTV Extended ROM?
Yes, in this specific context the two terms are interchangeable. I prefer using the term CDTV OS ROM, because it is a more specific description of the product, while the term "Extended ROM" is more of a generic description referring to any resident modules or code that might be present in the extended Kickstart ROM address range. Some people also refer to it as a "Boot ROM", which is a misnomer in my opinion. The CDTV Bootstrap module (cdstrap) takes up just a tiny percentage of the ROM, so it's like calling a car a steering wheel.

On the other hand, Commodore has been inconsistent as hell when it comes to naming and branding their software and hardware over the years both internally and publically, so use whatever term makes you feel warm on the inside.

### How did you reverse engineer the CDTV OS ROM?
I used amitools to determine the memory locations of the various resident modules in the official 2.30 ROM. I did not split the modules into loadsegable format, but loaded them straight into Ghidra with the absolute jump addresses still intact (Ghidra seemed to be much better in disassembling the modules this way than using the Amiga hunk format). After Ghidra did its first pass of disassembly I started manually going through the code disassembling the parts that were unidentified (which was usually a lot) and fixing parts that were incorrectly disassembled. It helps to know the common data structures of the Amiga OS (resident modules, devices, libraries, lists etc) and how to recognize library calls, but also to know hardware register addresses of the Amiga chipset and CDTV specific hardware like the DMAC and TriPort chips.

After most of a ROM resident module was disassembled I would dump it out as a text file. Unfortunately Ghidra doesn't export valid 68k assembly so I used a whole bunch of regexes to whip the result into shape. Once I got the module to build in vasm without errors I would start the next stage which is to do a binary diff between my build artifact and the one from the ROM and fixing the differences one by one until I ended up with assembler source that built into a 100% identical binary. I would typically just use xxd to convert the original and new binaries into text and then load the results side by side into vimdiff for analysis/comparison.

This process was repeated for every resident module that needed reverse engineering (cdtv.device, bookmark.device, cdstrap, and cdfs.library). I also partially disassembled cdg.library, but ultimately decided the needed patch was simple enough to just patch the original resident module binary directly without needing to fully resource it. I might finish the resourcing of cdg.library at a later date.

### Why did you make this ROM?
I thought it would be a nice challenge and I'd be helping out many fellow CDTV users. The CDTV platform seemed like an almost forgotten corner of the Amiga universe sorely in need of updates. Some more in-depth explanation about why I did this can be found on [this](https://cdtvland.com/2021/09/19/cdtv-os-2-35-technical-and-legal-stuff/) page.


## Compatibility
### What Kickstart ROM versions are compatible with CDTV OS 2.35?
CDTV OS 2.35 works with any Kickstart ROM from version from 1.3 and up. That means it also works fine with the newest Hyperion Kickstart ROMs (tested up to Kickstart 3.2.1).

### Does the CDTV OS 2.35 ROM also work on my A570 or A690?
Yes, the CDTV OS 2.35 ROM update is also available for the A570 and A690 CD-ROM drive addons. It allows you to use 68030 accelerators with your A500 and have a working CD-ROM drive!

_Make sure you use the correct ROM for your device! There are 3 different ROM builds available, one for each target device: CD1000 (the CDTV player), A570 and A690. Use the correct one!_

### Does CDTV OS 2.35 also support 68040 and 68060 accelerators?
I don't know. I did not have access to 68040 or 68060 based accelerators during the development of CDTV OS 2.35, nor were these accelerators targeted during development.

### Does CDTV OS 2.35 work with PiStorm?
PiStorm currently does not implement bus arbitration. This means that CD-ROM and SCSI device access does not work on CDTV. This is a hardware compatibility issue between the PiStorm and any system that depends on bus arbitration, like the CDTV hardware. It is unrelated to CDTV OS 2.35 and cannot be fixed in software.

### Which 68030 based accelerators can be used in a CDTV player?
CDTV OS 2.35 has succesfully been tested with the TerribleFire TF536 and M-Tec/E-Matrix Viper 530 accelerator boards, although it is very likely that any 68030 based accelerator will work. TF536 users are advised to [update](https://www.exxoshost.co.uk/forum/viewtopic.php?f=76&t=3542&start=30#p70123) their TF536 firmware, though.


## Technical stuff

### Why exactly does the CD-ROM drive stop working on all other ROMs except yours when you install a 68030 accelerator and/or 32-bit Fast RAM in a CDTV player?
That's an oddly specific question, glad you asked! There are three problems that were solved in CDTV OS 2.35: the first is that the DMAC chip (the DMA controller) has a 24-bit addressing limit. The CD-ROM device driver (cdtv.device), the ISO9660 filesystem library (cdfs.library), the CD+G playback app (cdg.library) and the CDTV Bootstrap code (cdstrap) do memory allocations without taking this into account. This works fine as long as there is no 32-bit Fast RAM present on the system. However, as soon as you add 32-bit Fast RAM this falls flat on its face, because then memory allocations take place in 32-bit RAM and the DMAC is instructed to DMA into those unreachable buffers. I fixed this by ensuring that all memory allocations in the CDTV OS ROM that are used for DMAing CD-ROM data take place inside the 24-bit addressing limit.

The second problem has to do with the TriPort (6525) chip and the 68030. The 6525 is used for various functions inside the CDTV player like setting the DAC attenuation, delivering subcode data from CD-ROM, putting the CD-ROM drive in and out of command mode and more. Although every CPU, whether it's a 68000, 68020 or 68030 is "paced" by the system/expansion bus on the CDTV, it seems that the 68030 is still just a tad too fast for the 6525 chip as tests have determined that two consecutive writes to this chip's registers will often fail on a 68030, while working fine on a 68000, 68010 or 68020. I don't know why this is, but I suspect it has to do with the more advanced pipelining of the 68030 compared to older generations of the 680x0 series. This seems to be enough of a speed increase to push it over the write cycle timing limits of the 6525, i.e. the ROM code is not holding the control lines to the TriPort chip in a specific state long enough before changing it again to something else, when executed on a 68030. As a result some commands, like putting the CD-ROM hardware in command mode, will fail from time to time which subsequently causes DMA timeouts on the system (cdfs.library will retry failed DMA transfers up to 32 times, so in the end the transfer might succeed, but I/O is painfully slow and CDXL streaming is broken). I fixed this problem by inserting a NOP between two consecutive writes to 6525 registers in cdtv.device, wherever that occurs (once for putting the drive in command mode and once in the DAC attenuation routine). This resulted in 100% success rate in all tests and has been exhaustively tested. Note: I have not done any measurements to unequivocally confirm that it is actually the 6525 that is to blame here, it might as well be the CR-511-B/CR-512-B MKE CD-ROM drive hardware behind it that is the cause of the issue.

The third problem is CPU caching of the DMAC Autoconfig I/O address range by the 68030. Caching I/O registers is fundamentally bad practice and can lead to unexpected results. In my tests the TF536 seemed to be unaffected, but the Viper 530 definitely had problems and also exhibited some weird corruption of data in the Extended ROM address range (F00000-F7FFFF) when CPU caching was enabled. Unfortunately the Zorro II expansion bus does not have cache inhibit lines so I fixed this problem by creating a [resident module](https://github.com/C4ptFuture/cdtv-mmu) in the CDTV 2.35 OS ROM (with a high priority so that it gets initialized very early in the system startup), that uses the 68030 MMU to disable CPU caching using one of its Transparent Translation registers. This coarse method of cache inhibiting is guaranteed to give a working CD-ROM, but it inhibits caching for the whole 24-bit address range. However, power users can still use more fine grained tools like mmu.library to disable caching of the Zorro II Autoconfig I/O address range and any other ranges that might need cache inhibit. Please consult the mmu.library documentation on how to cache inhibit specific areas of memory.

### You say that the ROM uses the 68030 MMU to do cache-inhibit, but SysInfo and any other tool says the MMU is unused. What gives?
Cache inhibit in CDTV OS 2.35 is configured using the MMU's TTx registers. The MMU does not need any active translation tables to be configured for the Transparent Translation registers to function. 



## TF536
### Why do I need to update my TF536 firmware?
The latest [TF536 firmware for CDTV](https://exxosforum.co.uk/forum/viewtopic.php?f=76&t=5920) is recommended if you want to use your TF536 in a CDTV player or in an A500/A500+ with an A690 CD-ROM drive addon attached, although CDTV OS 2.35 will work with older TF536 firmwares, albeit with some minor limitations.

If you plan to use your TF536 with an A500/A500+ with an A570 CD-ROM drive addon attached, then the update is _strongly_ recommended, because it fixes a compatibility issue between the TF536 and the A570's bookmark memory. If you don't update the TF536 to the latest firmware, you will experience graphical glitching on the CDTV title screen, the CD Audio panel and the Preferences screen, and some CDTV titles may fail to load. Additionally, the bookmark memory EEPROM data inside the A570 may become corrupted and other unpredictable stuff may happen.

### How is the CDTV specific TF536 firmware different?
The [TF536 firmware for CDTV](https://exxosforum.co.uk/forum/viewtopic.php?f=76&t=5920) removes a piece of diagnostic boot code (flashing colors on startup) at $F00000 that overlaps with the first 16K of the CDTV Extended ROM space, which is where the CDTV OS ROM code lives. If your TF536 runs firmware with the flashing colors on startup you will miss some CDTV functionality that is provided by the CDTV OS ROM modules that are overlapped by the TF536 flashing colors boot code, specifically the CDTV custom exec.library and the SCSI/XT driver. As a result there is no SCSI HDD support and the CDTV memory card range (E00000-E7FFFF) is not scanned for resident modules on system startup by exec.library. This is mitigated by the fact that the TF536 already offers IDE-based HDD and most users are very unlikely to use resident modules on memory cards. Just be aware those limitations exist if you do not run the CDTV-specific TF536 firmware. Note: the CDTV-specific firmware will work just fine on an A500/A500+ as well.

## Troubleshooting

### My 68030 equipped A500/A500+ with A570 is randomly crashing. What's up?
The A570 has an internal connector that allows it to be expanded with an extra 2MB of Fast RAM. If yours has one then this is the most likely culprit. Either remove or disable the A570 2MB RAM expansion if you want to use your A570 with a 68030 accelerator based system. (Note: this has nothing to do with the CDTV OS 2.35 ROM. It is an incompatibility regardless of which CDTV OS ROM version you use).

### Why do some CDTV titles not work on my system?
There are many reasons why a specific CDTV title may not work on a specific system. Many early CDTV titles were developed for the base hardware, which is a CDTV player with a 68000 CPU and 1MB of Chip RAM, and they may have problems running on other configurations. 

E.g. most A500s only have 0.5MB of Chip RAM (and 0.5 MB Fast RAM as a trap door expansion), so if you experience issues booting a CDTV title on an A500 with an A570 or A690, this can be a possible cause. 

Another issue may be the use of an accelerator board. Although CDTV OS 2.35 makes your CDTV player and A570/A690 CD-ROM drive work with 68030 accelerators, some CDTV titles (especially games) may not be compatible with the 68030. CDTV OS 2.35 by default disables CPU caching for Zorro-II RAM (24-bit) which increases compatibility with old software, but the software may still be doing dumb stuff like busy loops, which may cause compatibility issues.

### What is the HDD bootdelay?
The HDD bootdelay is a user-configurable delay that is invoked whenever a fixed bootable volume is present on the system, like e.g. a harddisk. The rationale behind this delay is to work around a usability issue caused by the way that CDTV OS is implemented, because whenever a harddisk is installed the system will always immediately bypass the CDTV Title Screen and proceed to boot from the harddisk. The problem with this implementation is that the CDTV Preferences panel becomes inaccessible to the end user. By inserting a small delay before the boot starts the user has a window of opportunity to interact with the CDTV Title Screen to e.g. launch the CDTV Preferences panel.

I have implemented the HDD bootdelay in the CDTV bootstrap module (cdstrap). This module constantly scans the system for bootable volumes (diskdrive, CD-ROM drive or bootable volume on the expansion.device MountList) and will exit if one is found. The behavior when a bootable floppy disk or CD-ROM is inserted is unchanged. However instead of exiting immediately when a bootable volume on expansion.device is found, I start a counter and cdstrap will only exit when the counter value matches or exceeds that of the user configured HDD bootdelay. The user can also force an exit at any time by pressing the ESC key on the CDTV remote controller or keyboard.

The HDD bootdelay value is stored in bookmark memory. When CDTV OS 2.35 starts up and there is no bookmark yet, it will create a default bookmark with an HDD bootdelay with a sane default of approximately 5 seconds. The user can set the HDD bootdelay to any desired value (including 0 to effectively disable it and restore the original behavior of the older official CDTV OS ROMs). Currently the HDD bootdelay can only be configured using a command line utility called [CDTVTools](https://github.com/C4ptFuture/cdtv-cdtvtools). Future CDTV OS ROM releases from CDTV Land will allow you to configure the HDD Bootdelay right inside the CDTV Preferences panel.

### How do I set the HDD boot delay?
You can use the [CDTVTools](https://github.com/C4ptFuture/cdtv-cdtvtools) application for that. See the repo documentation for usage instructions.

## EPROM burning
### Do I need to split or byteswap the ROM images for burning to EPROM?
That will be done for you. The patch will automatically generate both a standard CD1000 ROM image and split the ROM image into two files (odd and even) that you can directly use to program your EPROM. It does the same for the A570 and A690 images where it also produces ready-to-burn byteswapped bin files. Consult the [README.md](README.md) for a list of the filenames and a description of what they are for.

