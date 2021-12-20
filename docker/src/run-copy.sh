#!/usr/bin/env bash

set -x


TMPDIR=$(mktemp -d)
CDTV230MODULES=${TMPDIR}/CDTV_Extended_2.30
CDTV235MODULES=${TMPDIR}/CDTV_Extended_2.35
CDTV230ROM=/data/230.rom
CDTV230SUM="d98112f18792ee3714df16a6eb421b89"

echo "[INFO]  PATCH CDTV OS ROM 2.30 TO 2.35 "


# check 2.30 ROM is there
if [ ! -f ${CDTV230ROM} ]; then
    echo "[ERROR] Could not find the CDTV 2.30 ROM. Please place it in the current directory and rename it as '230.rom'."
    exit 1
fi

# verify it is the correct ROM
MD5SUM=$(md5sum -b /data/230.rom | awk {'print $1'})
if [ $MD5SUM != $CDTV230SUM ]; then
    echo "[ERROR] Checksum of CDTV 2.30 ROM failed. It should be ${CDTV230SUM}, but your ROM is ${MD5SUM}. Please find the correct ROM, place it in the current directory and rename it as '230.rom'."
    exit 1
fi

# split the 2.30 ROM
romtool split -o ${TMPDIR} /data/230.rom

# create dirs for the target devices
mkdir -p ${CDTV235MODULES}/CD1000
mkdir -p ${CDTV235MODULES}/A570
mkdir -p ${CDTV235MODULES}/A690


### CD1000 ###

# copy the unchanged modules
cp -p "${CDTV230MODULES}/A590_Handler(CDTV)"              ${CDTV235MODULES}/CD1000
cp -p "${CDTV230MODULES}/battclock.resource_38.1(CDTV)"   ${CDTV235MODULES}/CD1000
cp -p "${CDTV230MODULES}/debox.library_1.8(CDTV)"         ${CDTV235MODULES}/CD1000
cp -p "${CDTV230MODULES}/exec_37.201(CDTV)"               ${CDTV235MODULES}/CD1000
cp -p "${CDTV230MODULES}/kludges_37.11(CDTV)"             ${CDTV235MODULES}/CD1000
cp -p "${CDTV230MODULES}/playerprefs.lib_2.2(CDTV)"       ${CDTV235MODULES}/CD1000
cp -p "${CDTV230MODULES}/utility.library_37.3(CDTV)"      ${CDTV235MODULES}/CD1000
# patch the rest
# bsdiff....

# build the 2.35 ROM
romtool build -a F00000 -r 2.35 -f buildfile235-cd1000 -o "CDTV Extended-ROM v2.35 (2021)(CDTV Land)(CDTV).rom"