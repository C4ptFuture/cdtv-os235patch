# CDTV OS 2.35 - FAQ


<!-- vscode-markdown-toc -->
* 1. [About CDTV OS 2.35](#AboutCDTVOS2.35)
	* 1.1. [What is CDTV OS exactly?](#WhatisCDTVOSexactly)
	* 1.2. [Is this an official CDTV OS ROM release?](#IsthisanofficialCDTVOSROMrelease)
	* 1.3. [Is this another ROM hack?](#IsthisanotherROMhack)
	* 1.4. [Will you share the source code?](#Willyousharethesourcecode)
	* 1.5. [Why can't I download the CDTV OS 2.35 ROM image anywhere?](#WhycantIdownloadtheCDTVOS2.35ROMimageanywhere)
	* 1.6. [Was CDTV OS ever used as a term or are you just making this up?](#WasCDTVOSeverusedasatermorareyoujustmakingthisup)
	* 1.7. [Is CDTV OS ROM the same as CDTV Extended ROM?](#IsCDTVOSROMthesameasCDTVExtendedROM)
	* 1.8. [How did you reverse engineer the CDTV OS ROM?](#HowdidyoureverseengineertheCDTVOSROM)
	* 1.9. [Why did you make this ROM?](#WhydidyoumakethisROM)
	* 1.10. [Why do you have separate ROMs for A570 and A690? Aren't these drives the same?](#WhydoyouhaveseparateROMsforA570andA690Arentthesedrivesthesame)
* 2. [Compatibility](#Compatibility)
	* 2.1. [What Kickstart ROM versions are compatible with CDTV OS 2.35?](#WhatKickstartROMversionsarecompatiblewithCDTVOS2.35)
	* 2.2. [Does the CDTV OS 2.35 ROM also work on my A570 or A690?](#DoestheCDTVOS2.35ROMalsoworkonmyA570orA690)
	* 2.3. [What's this CDTV OS 2.35 for memory cards thing?](#WhatsthisCDTVOS2.35formemorycardsthing)
	* 2.4. [Why doesn't CDTV OS 2.35 for Memory Cards work with Kickstart 3.x?](#WhydoesntCDTVOS2.35forMemoryCardsworkwithKickstart3.x)
	* 2.5. [Does CDTV OS 2.35 for Memory Cards also work with something else than the official CDTV memory cards?](#DoesCDTVOS2.35forMemoryCardsalsoworkwithsomethingelsethantheofficialCDTVmemorycards)
	* 2.6. [Does CDTV OS 2.35 also support 68040 and 68060 accelerators?](#DoesCDTVOS2.35alsosupport68040and68060accelerators)
	* 2.7. [Does CDTV OS 2.35 work with PiStorm?](#DoesCDTVOS2.35workwithPiStorm)
	* 2.8. [Which 68030 based accelerators can be used in a CDTV player?](#Which68030basedacceleratorscanbeusedinaCDTVplayer)
* 3. [Miscellaneous](#Miscellaneous)
	* 3.1. [Why exactly does the CD-ROM drive stop working on all other ROMs except yours when you install a 68030 accelerator and/or 32-bit Fast RAM in a CDTV player?](#WhyexactlydoestheCD-ROMdrivestopworkingonallotherROMsexceptyourswhenyouinstalla68030acceleratorandor32-bitFastRAMinaCDTVplayer)
	* 3.2. [You say that the ROM uses the 68030 MMU to do cache-inhibit, but SysInfo and any other tool says the MMU is unused. What gives?](#YousaythattheROMusesthe68030MMUtodocache-inhibitbutSysInfoandanyothertoolsaystheMMUisunused.Whatgives)
	* 3.3. [What is the HDD bootdelay?](#WhatistheHDDbootdelay)
	* 3.4. [How do I set the HDD boot delay?](#HowdoIsettheHDDbootdelay)
	* 3.5. [Why do you use Docker/containers for patching? It's so much overhead.](#WhydoyouuseDockercontainersforpatchingItssomuchoverhead.)
* 4. [TF536](#TF536)
	* 4.1. [Why do I need to update my TF536 firmware?](#WhydoIneedtoupdatemyTF536firmware)
	* 4.2. [How is the CDTV specific TF536 firmware different?](#HowistheCDTVspecificTF536firmwaredifferent)
* 5. [Troubleshooting](#Troubleshooting)
	* 5.1. [My 68030 equipped A500/A500+ with A570 is randomly crashing. What's up?](#My68030equippedA500A500withA570israndomlycrashing.Whatsup)
	* 5.2. [Why do some CDTV titles not work on my system?](#WhydosomeCDTVtitlesnotworkonmysystem)
* 6. [EPROM burning](#EPROMburning)
	* 6.1. [Do I need to split or byteswap the ROM images for burning to EPROM?](#DoIneedtosplitorbyteswaptheROMimagesforburningtoEPROM)
	* 6.2. [Why is it sometimes called a ROM and sometimes ROMs?](#WhyisitsometimescalledaROMandsometimesROMs)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->



##  1. <a name='AboutCDTVOS2.35'></a>About CDTV OS 2.35
###  1.1. <a name='WhatisCDTVOSexactly'></a>What is CDTV OS exactly?
CDTV OS is the name for all the additional functionality provided by the resident modules inside the CDTV OS ROM, a.k.a. Extended ROM, which is required to make a CDTV player function. It contains -amongst other things- drivers and libraries for the CD-ROM drive, the CDTV memory cards, ISO9660 filesystem support, but also applications and user interface stuff like the CD-Audio playback application, the Preferences screen, the CD+G playback application and more. It integrates with and depends on several exisiting Amiga operating system modules in the Kickstart ROM. 

CDTV OS is not a full operating system in the traditional sense. A crude but apt modern day comparison is the system software/firmware for modern day game consoles. It's just harder to update because you need to replace ROM chips instead of using the update feature of your game console.

CDTV OS 2.35 is an unofficial/custom update to the latest official Commodore version 2.30 release from 1992. CDTV OS 2.35 includes a whole bunch improvements compared to 2.30 and is available for the CD1000 (classic CDTV player), A570 and A690 CD-ROM drive. It is also installable on the CD1401 or CD1405 CDTV memory cards (see more below)

###  1.2. <a name='IsthisanofficialCDTVOSROMrelease'></a>Is this an official CDTV OS ROM release?
No. This is a "custom" ROM. It is not affiliated with, nor is it endorsed by the Amiga Corporation, which is the current owner of the Amiga's IP (and hence also CDTV), nor is it affiliated with or endorsed by Hyperion BVBA (a licensee).

###  1.3. <a name='IsthisanotherROMhack'></a>Is this another ROM hack? 
Most definitely not. A lot of time has gone into reverse engineering the original binary ROM code for this project. This was necessary because the original CDTV OS firmware/software is not open source. The result of the reverse engineering process is 100% assembler source code that can be built into a byte-by-byte exact binary copy of the original ROM modules on modern day machines using open source software. The source code can then be used to easily update, bugfix or otherwise improve these modules. This allows further development of the CDTV OS without needing access to the original Commodore source code anymore.

###  1.4. <a name='Willyousharethesourcecode'></a>Will you share the source code?
I would love to put the source code of the reverse engineered ROM modules on my GitHub page, but I cannot. Although reverse engineering the CDTV OS ROM into source code is all my own work, the resulting source code is still a derivative of the original Commodore ROM and as such contains intellectual property that belongs to Amiga Corporation (Cloanto). I cannot distribute this source code without their permission (which is very unlikely to happen anyway, because the original code is not open source as it is).

###  1.5. <a name='WhycantIdownloadtheCDTVOS2.35ROMimageanywhere'></a>Why can't I download the CDTV OS 2.35 ROM image anywhere?
Although the bugfixes, modifications, and new features that went into CDTV OS 2.35 are all my own work, the resulting ROM image is still a derivative of the original Commodore ROM and as such contains intellectual property that belongs to Amiga Corporation (Cloanto). I have been in touch with Amiga Corporation about making my work part of an official ROM release in whatever shape or form. The contact was very cordial, but -and this is my interpretation of the situation- the currently on-going legal proceedings between Amiga Corporation and Hyperion are making such a release complicated at this point in time. Perhaps once this court case is over my work will be available in a more user friendly manner, but until then this patch method is the best I can do without breaching copyright.

###  1.6. <a name='WasCDTVOSeverusedasatermorareyoujustmakingthisup'></a>Was CDTV OS ever used as a term or are you just making this up?
The term CDTV OS has been used by:

-  Carl Sassenrath (creator of the Amiga Exec kernel and many CDTV OS components like cdtv.device, bookmark/cardmark.device, cdfs.library and cdstrap): _"My original CDTV development board (1990) that I used to build and test the CDTV OS, drivers, libs, etc"_ . Source: http://www.rebol.com/article/0491.html
- Reichart von Wolfsheild, another member of the CDTV project team (playerprefs.library, debox.library): _"The core team that made the CDTV OS were Carl Sassenrath (who now is working with Roku), Jim Sachs, Will Ware, Leo Schwab, and myself."_  Source: https://www.gregdonner.org/workbench/wb_cdtv.html: 
- Additionally, the official CDTV Developer Reference manual (1992) from Commodore uses the same term in paragraph 3.3.3: _"There is a bug in the V1.3 graphics.library which can cause the CDTV unit to come up in NTSC mode even though it should come up in PAL mode. There is an update of the CDTV OS ROM which fixes this problem."_ Source: https://archive.org/details/CDTV_Developer_Reference_Manual/page/n253/mode/2up?q=%22cdtv+os%22

###  1.7. <a name='IsCDTVOSROMthesameasCDTVExtendedROM'></a>Is CDTV OS ROM the same as CDTV Extended ROM?
Yes, in this specific context the two terms are interchangeable. I prefer using the term CDTV OS ROM, because it is a more specific description of the product, while the term "Extended ROM" is more of a generic description referring to any resident modules or code that might be present in the extended Kickstart ROM address range. To the best of my knowledge, the term "Extended ROM" was coined by the Amiga community long after Commodore went under and was never an "official" term used by Commodore.

Some people also refer to the CDTV OS ROM as a "Boot ROM", which is a misnomer in my opinion. The CDTV Bootstrap module (cdstrap) takes up just a tiny percentage of the ROM, so it's like calling a car a steering wheel. On the other hand, Commodore has been inconsistent as hell when it comes to naming and branding their software and hardware over the years both internally and publically, so use whatever term makes you feel warm on the inside.

###  1.8. <a name='HowdidyoureverseengineertheCDTVOSROM'></a>How did you reverse engineer the CDTV OS ROM?
I used amitools to determine the memory locations of the various resident modules in the official 2.30 ROM. I did not split the modules into loadsegable format, but loaded them straight into Ghidra with the absolute jump addresses still intact (Ghidra seemed to be much better in disassembling the modules this way than using the Amiga hunk format). After Ghidra did its first pass of disassembly I started manually going through the code disassembling the parts that were unidentified (which was usually a lot) and fixing parts that were incorrectly disassembled. It helps to know the common data structures of the Amiga OS (resident modules, devices, libraries, lists etc) and how to recognize library calls, but also to know hardware register addresses of the Amiga chipset and CDTV specific hardware like the DMAC and TriPort chips.

After most of a ROM resident module was disassembled I would dump it out as a text file. Unfortunately Ghidra doesn't export valid 68k assembly so I used a whole bunch of regexes to whip the result into shape. Once I got the module to build in vasm without errors I would start the next stage which is to do a binary diff between my build artifact and the one from the ROM and fixing the differences one by one until I ended up with assembler source that built into a 100% identical binary. I would typically just use xxd to convert the original and new binaries into text and then load the results side by side into vimdiff for analysis/comparison.

This process was repeated for every resident module that needed reverse engineering (cdtv.device, bookmark.device, cdstrap, and cdfs.library). I also partially disassembled cdg.library, but ultimately decided the needed patch was simple enough to just patch the original resident module binary directly without needing to fully resource it. I might finish the resourcing of cdg.library at a later date.

###  1.9. <a name='WhydidyoumakethisROM'></a>Why did you make this ROM?
I thought it would be a nice challenge and I'd be helping out many fellow CDTV users. The CDTV platform seemed like an almost forgotten corner of the Amiga universe sorely in need of updates. Some more in-depth explanation about why I did this can be found on [this](https://cdtvland.com/2021/09/19/cdtv-os-2-35-technical-and-legal-stuff/) page.

###  1.10. <a name='WhydoyouhaveseparateROMsforA570andA690Arentthesedrivesthesame'></a>Why do you have separate ROMs for A570 and A690? Aren't these drives the same?
A common myth you will hear in Amiga circles is that the A690 is exactly the same as an A570 with just a different model number badge slapped on the case. The truth is that the A690 was a pre-production/protoype run of around 500 units, while the A570 is the proper retail model that went into production 6 months after the A690 was manufactured. The A570 contains various improvements and cost-reduction changes compared to the A690. The most notable change from a device driver perspective is the fact that the bookmark memory store has changed from battery backed SRAM to EEPROMs. The EEPROMs require additional code to ensure data has been written to them succesfully. As a result the bookmark.device driver inside the CDTV OS ROM for A690 is different from the one in the A570.


##  2. <a name='Compatibility'></a>Compatibility
###  2.1. <a name='WhatKickstartROMversionsarecompatiblewithCDTVOS2.35'></a>What Kickstart ROM versions are compatible with CDTV OS 2.35?
CDTV OS 2.35 works with any Kickstart ROM from version from 1.3 and up. That means it also works fine with the newest Hyperion Kickstart ROMs (tested up to Kickstart 3.2.1).

###  2.2. <a name='DoestheCDTVOS2.35ROMalsoworkonmyA570orA690'></a>Does the CDTV OS 2.35 ROM also work on my A570 or A690?
Yes, the CDTV OS 2.35 ROM update is also available for the A570 and A690 CD-ROM drive addons. It allows you to use 68030 accelerators with your A500 and have a working CD-ROM drive!

_Make sure you use the correct ROM for your device! There are 3 different ROM builds available, one for each target device: CD1000 (the CDTV player), A570 and A690. Use the correct one!_

###  2.3. <a name='WhatsthisCDTVOS2.35formemorycardsthing'></a>What's this CDTV OS 2.35 for memory cards thing?
_CDTV OS 2.35 for Memory Cards_ is a special ROM image that is generated by the patch container. You can install it on a CDTV memory card (models CD1401 and CD1405) by booting a CD1000 from the additionally generated _CDTV OS 2.35 for Memory Cards Installer_ ADF image or ISO 9660 CD-ROM image. It also adds any remaining free RAM on the memory card to the system as Fast RAM every time the system boots. The installer has a GUI and online help, but you can also directly load the ROM image into address $E00000 using any binary load command line tool from Aminet.

It is currently more a proof-of-concept than anything else, but functional and useful nonetheless for the target audience (Kickstart 1.3 users with 1.0 CDTV OS ROMs). It has been tested with CD1000s with CDTV OS ROMs 1.0 and Kickstart ROM 1.3. Although it has not been tested, it should also work fine with CDTV OS ROMs 2.0, 2.7 and 2.30 in combination with a Kickstart 2.x ROM. It is unfortunately _not_ compatible with Kickstart 3.x ROMs.

###  2.4. <a name='WhydoesntCDTVOS2.35forMemoryCardsworkwithKickstart3.x'></a>Why doesn't CDTV OS 2.35 for Memory Cards work with Kickstart 3.x?
_CDTV OS 2.35 for Memory Cards_ works by installing resident modules on the CDTV memory card. The CDTV OS ROMs carry a specially modified version of exec.library that also scans the memory address range where the CDTV memory cards are mapped to for any resident modules that might be located there. The "normal" exec.library in Kickstart ROMs does not look for resident modules there. When using the CDTV OS 1.0 ROMs in combination with a Kickstart 1.3 ROM, the exec.library on the CDTV OS 1.0 ROMs overrides the exec.library on the Kickstart ROM, because it has a higher priority. Likewise, the 2.x CDTV OS ROMs carry a modified exec.library that can override the exec.library in Kickstart 2.x ROMs.

Because Commodore all but abandoned CDTV in 1992 in favor of CD32, there never was a CDTV OS ROM released that contains a modified Kickstart 3.x exec.library, and so the exec.library in Kickstart 3.x ROMs cannot be overridden. The Kickstart 3.x exec.library has a higher version number and is therefor the one that always "wins". This also means that the memory cards are not scanned for resident modules, and any modules there are not initialized.

Hint: If you have a memory card and you're really really desperate to use this with Kickstart 3.x and if you're feeling adventurous and know what you're doing, you can always patch your Kickstart 3.x ROM image's scan table to also scan E00000-E7FFFF for resident modules. _CDTV OS 2.35 for Memory Cards_ works fine in WinUAE, so you can experiment there before committing to EPROM. ;-)

###  2.5. <a name='DoesCDTVOS2.35forMemoryCardsalsoworkwithsomethingelsethantheofficialCDTVmemorycards'></a>Does CDTV OS 2.35 for Memory Cards also work with something else than the official CDTV memory cards?
Theoretically, yes. If you have a custom memory expansion in your CD1000 that maps to address $E00000 _and_ is battery backed or in some other way is able to survive resets and power downs, then that should work just fine as well, because you then have the functional equivalent of a memory card, (but without the option of easy insertion and removal through the front panel). These replacement memory card alternatives are not officially supported at the moment, but there is no reason they should not work.


###  2.6. <a name='DoesCDTVOS2.35alsosupport68040and68060accelerators'></a>Does CDTV OS 2.35 also support 68040 and 68060 accelerators?
I don't know. I did not have access to 68040 or 68060 based accelerators during the development of CDTV OS 2.35, nor were these accelerators targeted during development.

###  2.7. <a name='DoesCDTVOS2.35workwithPiStorm'></a>Does CDTV OS 2.35 work with PiStorm?
PiStorm currently does not implement bus arbitration. This means that CD-ROM and SCSI device access does not work on CDTV. This is a hardware compatibility issue between the PiStorm and any system that depends on bus arbitration, like the CDTV hardware. It is unrelated to CDTV OS 2.35 and cannot be fixed in software.

###  2.8. <a name='Which68030basedacceleratorscanbeusedinaCDTVplayer'></a>Which 68030 based accelerators can be used in a CDTV player?
CDTV OS 2.35 has succesfully been tested with the TerribleFire TF536 and M-Tec/E-Matrix Viper 530 accelerator boards, although it is very likely that any 68030 based accelerator will work. TF536 users are advised to [update](https://exxosforum.co.uk/forum/viewtopic.php?f=76&t=5920) their TF536 firmware, though.


##  3. <a name='Miscellaneous'></a>Miscellaneous

###  3.1. <a name='WhyexactlydoestheCD-ROMdrivestopworkingonallotherROMsexceptyourswhenyouinstalla68030acceleratorandor32-bitFastRAMinaCDTVplayer'></a>Why exactly does the CD-ROM drive stop working on all other ROMs except yours when you install a 68030 accelerator and/or 32-bit Fast RAM in a CDTV player?
That's an oddly specific question, glad you asked! There are three problems that were solved in CDTV OS 2.35: the first is that the DMAC chip (the DMA controller) has a 24-bit addressing limit. The CD-ROM device driver (cdtv.device), the ISO9660 filesystem library (cdfs.library), the CD+G playback app (cdg.library) and the CDTV Bootstrap code (cdstrap) do memory allocations without taking this into account. This works fine as long as there is no 32-bit Fast RAM present on the system. However, as soon as you add 32-bit Fast RAM this falls flat on its face, because then memory allocations take place in 32-bit RAM and the DMAC is instructed to DMA into those unreachable buffers. I fixed this by ensuring that all memory allocations in the CDTV OS ROM that are used for DMAing CD-ROM data take place inside the 24-bit addressing limit.

The second problem has to do with the TriPort (6525) chip and the 68030. The 6525 is used for various functions inside the CDTV player like setting the DAC attenuation, delivering subcode data from CD-ROM, putting the CD-ROM drive in and out of command mode and more. Although every CPU, whether it's a 68000, 68020 or 68030 is "paced" by the system/expansion bus on the CDTV, it seems that the 68030 is still just a tad too fast for the 6525 chip as tests have determined that two consecutive writes to this chip's registers will often fail on a 68030, while working fine on a 68000, 68010 or 68020. I don't know why this is, but I suspect it has to do with the more advanced pipelining of the 68030 compared to older generations of the 680x0 series. This seems to be enough of a speed increase to push it over the write cycle timing limits of the 6525, i.e. the ROM code is not holding the control lines to the TriPort chip in a specific state long enough before changing it again to something else, when executed on a 68030. As a result some commands, like putting the CD-ROM hardware in command mode, will fail from time to time which subsequently causes DMA timeouts on the system (cdfs.library will retry failed DMA transfers up to 32 times, so in the end the transfer might succeed, but I/O is painfully slow and CDXL streaming is broken). I fixed this problem by inserting a NOP between two consecutive writes to 6525 registers in cdtv.device, wherever that occurs (once for putting the drive in command mode and once in the DAC attenuation routine). This resulted in 100% success rate in all tests and has been exhaustively tested. Note: I have not done any measurements to unequivocally confirm that it is actually the 6525 that is to blame here, it might as well be the CR-511-B/CR-512-B MKE CD-ROM drive hardware behind it that is the cause of the issue.

The third problem is CPU caching of the DMAC Autoconfig I/O address range by the 68030. Caching I/O registers is fundamentally bad practice and can lead to unexpected results. In my tests the TF536 seemed to be unaffected, but the Viper 530 definitely had problems and also exhibited some weird corruption of data in the Extended ROM address range (F00000-F7FFFF) when CPU caching was enabled. Unfortunately the Zorro II expansion bus does not have cache inhibit lines so I fixed this problem by creating a [resident module](https://github.com/C4ptFuture/cdtv-mmu) in the CDTV 2.35 OS ROM (with a high priority so that it gets initialized very early in the system startup), that uses the 68030 MMU to disable CPU caching using one of its Transparent Translation registers. This coarse method of cache inhibiting is guaranteed to give a working CD-ROM, but it inhibits caching for the whole 24-bit address range. However, power users can still use more fine grained tools like mmu.library to disable caching of the Zorro II Autoconfig I/O address range and any other ranges that might need cache inhibit. Please consult the mmu.library documentation on how to cache inhibit specific areas of memory.

###  3.2. <a name='YousaythattheROMusesthe68030MMUtodocache-inhibitbutSysInfoandanyothertoolsaystheMMUisunused.Whatgives'></a>You say that the ROM uses the 68030 MMU to do cache-inhibit, but SysInfo and any other tool says the MMU is unused. What gives?
Cache inhibit in CDTV OS 2.35 is configured using the MMU's TTx registers. The MMU does not need any active translation tables to be configured for the Transparent Translation registers to function. 

###  3.3. <a name='WhatistheHDDbootdelay'></a>What is the HDD bootdelay?
The HDD bootdelay is a user-configurable delay that is invoked whenever a fixed bootable volume is present on the system, like e.g. a harddisk. The rationale behind this delay is to work around a usability issue caused by the way that CDTV OS is implemented, because whenever a harddisk is installed the system will always immediately bypass the CDTV Title Screen and proceed to boot from the harddisk. The problem with this implementation is that the CDTV Preferences panel becomes inaccessible to the end user. By inserting a small delay before the boot starts the user has a window of opportunity to interact with the CDTV Title Screen to e.g. launch the CDTV Preferences panel.

I have implemented the HDD bootdelay in the CDTV bootstrap module (cdstrap). This module constantly scans the system for bootable volumes (diskdrive, CD-ROM drive or bootable volume on the expansion.library MountList) and will exit if one is found. The behavior when a bootable floppy disk or CD-ROM is inserted is unchanged. However instead of exiting immediately when a bootable volume on expansion.library is found, I start a counter and cdstrap will only exit when the counter value matches or exceeds that of the user configured HDD bootdelay. The user can also force an exit at any time by pressing the ESC key on the CDTV remote controller or keyboard.

The HDD bootdelay value is stored in bookmark memory. When CDTV OS 2.35 starts up and there is no bookmark yet, it will create a default bookmark with an HDD bootdelay with a sane default of approximately 5 seconds. The user can set the HDD bootdelay to any desired value (including 0 to effectively disable it and restore the original behavior of the older official CDTV OS ROMs). Currently the HDD bootdelay can only be configured using a command line utility called [CDTVTools](https://github.com/C4ptFuture/cdtv-cdtvtools). Future CDTV OS ROM releases from CDTV Land will allow you to configure the HDD Bootdelay right inside the CDTV Preferences panel.

###  3.4. <a name='HowdoIsettheHDDbootdelay'></a>How do I set the HDD boot delay?
You can use the [CDTVTools](https://github.com/C4ptFuture/cdtv-cdtvtools) application for that. See the repo documentation for usage instructions.


###  3.5. <a name='WhydoyouuseDockercontainersforpatchingItssomuchoverhead.'></a>Why do you use Docker/containers for patching? It's so much overhead.
Short answer: Ease of use. Once you have Docker or an equivalent container runtime installed, stuff will just work. It's easier to support than making sure someone has working installs of bspatch, dd, amitools, srec_cat, md5sum and whatever else is or will be needed on their specific operating system. But that's just one of the many advantages containers offer me.

Long ass rant answer: in case you've been living under a rock for the past 10 years, container technology has become near-ubiquitous in the field of software development, but also in operational environments ranging from small business to giant enterprise environments, (with container orchestration solutions like Kubernetes more or less becoming the platforms that run workloads instead of the native underlying OS). Many IT professionals and hobbyists use container technology daily, both for work and at home. And although I wish I could just distribute these ROMs as they are, that's not a realistic goal. This puts me in the unfortunate position where I need to spend a not so insignificant amount of my available engineering time into creating solutions that do not breach copyright, and that inevatibly involves patching original binaries. But if that was all that's needed, I would've just released the patch files and called it a day. However, as you can see, this patch container does not just apply a patch: it also splits the CD1000 ROMs in odd and even images, byteswaps the A570/A690 images so they are ready to burn, and now with the addition of _CDTV OS 2.35 for Memory Cards_ it also patches the 2.35 CD1000 image into a CD1401 image, and then proceeds to inject that image into a copyright "clean" ADF image and ISO image.

This functionality would have been a nightmare to implement and support running natively on any OS, which is a constantly moving and changing environment as it is, let alone supporting it on _multiple_ OS'es. Using containers I can focus on placing all the current (and future) complexity inside the container image and making sure _that_ works. Then I know it will work exactly the same on the end user's system. The end user only needs to worry about installing a container runtime once, and has the guarantee that all future container image version will "just work". This is the most effective way and most preferred way for me to deliver this functionality. Of course, I would rather avoid all this crap and offer you to the ROM images directly, but alas, that's not an option at this point in time.

Then again, if you're 1337 enough to patch, split and byte swap ROM images and dd a file into an ISO9660 sector all by yourself: the patch files are right there in the docker folder, so have at it. :-)


##  4. <a name='TF536'></a>TF536
###  4.1. <a name='WhydoIneedtoupdatemyTF536firmware'></a>Why do I need to update my TF536 firmware?
The latest [TF536 firmware for CDTV](https://exxosforum.co.uk/forum/viewtopic.php?f=76&t=5920) is recommended if you want to use your TF536 in a CDTV player or in an A500/A500+ with an A690 CD-ROM drive addon attached, although CDTV OS 2.35 will work with older TF536 firmwares, albeit with some minor limitations.

If you plan to use your TF536 with an A500/A500+ with an A570 CD-ROM drive addon attached, then the update is _strongly_ recommended, because it fixes a compatibility issue between the TF536 and the A570's bookmark memory. If you don't update the TF536 to the latest firmware, you will experience graphical glitching on the CDTV title screen, the CD Audio panel and the Preferences screen, and some CDTV titles may fail to load. Additionally, the bookmark memory EEPROM data inside the A570 may become corrupted and other unpredictable stuff may happen.

###  4.2. <a name='HowistheCDTVspecificTF536firmwaredifferent'></a>How is the CDTV specific TF536 firmware different?
The [TF536 firmware for CDTV](https://exxosforum.co.uk/forum/viewtopic.php?f=76&t=5920) removes a piece of diagnostic boot code (flashing colors on startup) at $F00000 that overlaps with the first 16K of the CDTV Extended ROM space, which is where the CDTV OS ROM code lives. If your TF536 runs firmware with the flashing colors on startup you will miss some CDTV functionality that is provided by the CDTV OS ROM modules that are overlapped by the TF536 flashing colors boot code, specifically the CDTV custom exec.library and the SCSI/XT driver. As a result there is no SCSI HDD support and the CDTV memory card range (E00000-E7FFFF) is not scanned for resident modules on system startup by exec.library. This is mitigated by the fact that the TF536 already offers IDE-based HDD and most users are very unlikely to use resident modules on memory cards. Just be aware those limitations exist if you do not run the CDTV-specific TF536 firmware. Note: the CDTV-specific firmware will work just fine on an A500/A500+ as well.

##  5. <a name='Troubleshooting'></a>Troubleshooting

###  5.1. <a name='My68030equippedA500A500withA570israndomlycrashing.Whatsup'></a>My 68030 equipped A500/A500+ with A570 is randomly crashing. What's up?
The A570 has an internal connector that allows it to be expanded with an extra 2MB of Fast RAM. If yours has one then this is the most likely culprit. Either remove or disable the A570 2MB RAM expansion if you want to use your A570 with a 68030 accelerator based system. (Note: this has nothing to do with the CDTV OS 2.35 ROM. It is an incompatibility regardless of which CDTV OS ROM version you use).

###  5.2. <a name='WhydosomeCDTVtitlesnotworkonmysystem'></a>Why do some CDTV titles not work on my system?
There are many reasons why a specific CDTV title may not work on a specific system. Many early CDTV titles were developed for the base hardware, which is a CDTV player with a 68000 CPU and 1MB of Chip RAM, and they may have problems running on other configurations. 

E.g. most A500s only have 0.5MB of Chip RAM (and 0.5 MB Fast RAM as a trap door expansion), so if you experience issues booting a CDTV title on an A500 with an A570 or A690, this can be a possible cause. 

Another issue may be the use of an accelerator board. Although CDTV OS 2.35 makes your CDTV player and A570/A690 CD-ROM drive work with 68030 accelerators, some CDTV titles (especially games) may not be compatible with the 68030. CDTV OS 2.35 by default disables CPU caching for Zorro-II RAM (24-bit) which increases compatibility with old software, but the software may still be doing dumb stuff like busy loops, which may cause compatibility issues.


##  6. <a name='EPROMburning'></a>EPROM burning
###  6.1. <a name='DoIneedtosplitorbyteswaptheROMimagesforburningtoEPROM'></a>Do I need to split or byteswap the ROM images for burning to EPROM?
That will be done for you. The patch will automatically generate both a standard CD1000 ROM image and split the ROM image into two files (odd and even) that you can directly use to program your EPROM. It does the same for the A570 and A690 images where it also produces ready-to-burn byteswapped bin files. Consult the [README.md](README.md) for a list of the filenames and a description of what they are for.

###  6.2. <a name='WhyisitsometimescalledaROMandsometimesROMs'></a>Why is it sometimes called a ROM and sometimes ROMs?
This can be a little confusing to newcomers, because very often the terms ROM (singular) and ROMs (plural) are used interchangably when it comes to CDTV. But don't worry, they refer to the same thing. Basically, the CDTV OS ROM image when it is built is typically just a single file on a computer. However, depending on which chip or chips need to be programmed, the data inside this file might need to be re-arranged before it can be programmed/burned onto an EPROM, which is a reprogrammable type of ROM.

For the CD1000 the ROM image is split across two separate 8-bit chips. One that contains all the odd bytes and one that contains all the even bytes, because that is how the CD1000 mainboard has been designed. That's why you will often hear people referring to them as ROMs instead of just a ROM. (The A570 and A690 just use a single ROM chip, so there's usually no confusion there).
