#!/usr/bin/env bash

#set -x


CDTV230ROM="/data/230.rom"
CDTV235ROM_CD1000="/data/CDTV Extended-ROM v2.35 (2021)(CDTV Land)(CDTV).rom"
CDTV235ROM_A570="/data/CDTV Extended-ROM v2.35 (2022)(CDTV Land)(A570).rom"
CDTV235ROM_A690="/data/CDTV Extended-ROM v2.35 (2022)(CDTV Land)(A690).rom"
CDTV235ROM_MEMCARD="/data/CDTV Extended-ROM v2.35 (2023)(CDTV Land)(CD1401-CD1405).rom"
CDTV235ROM_MEMCARD_INSTALLER_ADF="/data/CDTVOS235-memcard-installer.adf"
CDTV235ROM_MEMCARD_INSTALLER_ISO="/data/CDTVOS235-memcard-installer.iso"
CDTV230SUM="d98112f18792ee3714df16a6eb421b89"

echo "   __________  _______    __   ____  _____    ___    _____ ______"
echo "  / ____/ __ \/_  __/ |  / /  / __ \/ ___/   |__ \  |__  // ____/"
echo " / /   / / / / / /  | | / /  / / / /\__ \    __/ /   /_ </___ \  "
echo "/ /___/ /_/ / / /   | |/ /  / /_/ /___/ /   / __/_ ___/ /___/ /  "
echo "\____/_____/ /_/    |___/   \____//____/   /____(_)____/_____/   "
echo "  2.30 to 2.35 ROM patcher - written by Captain Future/CDTV Land "
echo ""
echo "[INFO]  PATCH CDTV OS ROM 2.30 TO 2.35 - start"


# check 2.30 ROM is there
if [ ! -f ${CDTV230ROM} ]; then
    echo "[ERROR] Could not find the CDTV 2.30 ROM. Please place it in the current directory and rename it as '230.rom'."
    exit 1
fi
echo "[INFO]  Official 2.30 ROM found."

# verify it is the correct ROM
MD5SUM=$(md5sum -b ${CDTV230ROM} | awk {'print $1'})
if [ $MD5SUM != $CDTV230SUM ]; then
    echo "[ERROR] Checksum of CDTV 2.30 ROM failed. It should be ${CDTV230SUM}, but your ROM is ${MD5SUM}. Please find the correct ROM, place it in the current directory and rename it as '230.rom'."
    exit 1
fi
echo "[INFO]  Official 2.30 ROM hash OK."

# patch 2.30 image to 2.35 for CD1000
echo "[INFO]  Creating the 2.35 ROM for CD1000...."
bspatch "${CDTV230ROM}" "${CDTV235ROM_CD1000}" 235-release-cd1000-patch.bin
if [ $? -ne 0 ]; then
    echo "[ERROR] Patch failed!!"
    exit 1
fi

# patch 2.30 image to 2.35 for A570
echo "[INFO]  Creating the 2.35 ROM for A570...."
bspatch "${CDTV230ROM}" "${CDTV235ROM_A570}" 235-release-a570-patch.bin
if [ $? -ne 0 ]; then
    echo "[ERROR] Patch failed!!"
    exit 1
fi

# patch 2.30 image to 2.35 for A690
echo "[INFO]  Creating the 2.35 ROM for A690...."
bspatch "${CDTV230ROM}" "${CDTV235ROM_A690}" 235-release-a690-patch.bin
if [ $? -ne 0 ]; then
    echo "[ERROR] Patch failed!!"
    exit 1
fi

# patch 2.35 image to 2.35 for CDTV memory cards (CD1401, CD1405)
echo "[INFO]  Creating the 2.35 ROM for CDTV memory cards...."
bspatch "${CDTV235ROM_CD1000}" "${CDTV235ROM_MEMCARD}" 235-release-cd1401-patch.bin
if [ $? -ne 0 ]; then
    echo "[ERROR] Patch failed!!"
    exit 1
fi

# split the CD1000 ROM image for easy burning to EPROM (thx ChadsArcade!)
echo "[INFO]  Splitting CD1000 ROM image"
srec_cat -o /data/CDTV_v2_35_U34_Even.bin -binary "/data/CDTV Extended-ROM v2.35 (2021)(CDTV Land)(CDTV).rom" -binary -split 2 0
srec_cat -o /data/CDTV_v2_35_U35_Odd.bin -binary "/data/CDTV Extended-ROM v2.35 (2021)(CDTV Land)(CDTV).rom" -binary -split 2 1

# byteswap the A570 and A690 images for 27c400
echo "[INFO]  Byteswapping A570 and A690 images"
dd conv=swab <"${CDTV235ROM_A570}" >/data/A570_v2_35.bin
dd conv=swab <"${CDTV235ROM_A690}" >/data/A690_v2_35.bin

# truncate the memory card image to 64K size
echo "[INFO]  Truncating memory card image"
truncate -s 65536 "${CDTV235ROM_MEMCARD}"

# inject memorycard ROM image into installer ADF and ISO
echo "[INFO]  Generating memory card installer ADF and ISO"
xdftool installer-without-rom-image.adf write "${CDTV235ROM_MEMCARD}" /2.35-cd1401-release.rom
cp installer-without-rom-image.adf "${CDTV235ROM_MEMCARD_INSTALLER_ADF}"
dd if="${CDTV235ROM_MEMCARD}" of=installer-without-rom-image.iso bs=2048 count=32 seek=33 conv=notrunc
cp installer-without-rom-image.iso "${CDTV235ROM_MEMCARD_INSTALLER_ISO}"

echo "[INFO]  Patch succesful. Enjoy your new CDTV ROM!!"
echo "[INFO]  PATCH CDTV OS ROM 2.30 TO 2.35 - end"
