#!/usr/bin/env bash

#set -x


CDTV230ROM="/data/230.rom"
CDTV235ROM="/data/CDTV Extended-ROM v2.35 (2021)(CDTV Land)(CDTV).rom"
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

# patch it
echo "[INFO]  Creating the 2.35 ROM for CD1000...."
bspatch "${CDTV230ROM}" "${CDTV235ROM}" 235-release-cd1000-patch.bin

if [ $? -ne 0 ]; then
    echo "[ERROR] Patch failed!!"
    exit 1
fi

# split the ROM image for easy burning to EPROM (thx ChadsArcade!)
echo "[INFO]  Splitting ROM image"
srec_cat -o /data/CDTV_v2_35_U34_Even.bin -binary "/data/CDTV Extended-ROM v2.35 (2021)(CDTV Land)(CDTV).rom" -binary -split 2 0
srec_cat -o /data/CDTV_v2_35_U35_Odd.bin -binary "/data/CDTV Extended-ROM v2.35 (2021)(CDTV Land)(CDTV).rom" -binary -split 2 1

echo "[INFO]  Patch succesful. Enjoy your new CDTV ROM!!"
echo "[INFO]  PATCH CDTV OS ROM 2.30 TO 2.35 - end"
