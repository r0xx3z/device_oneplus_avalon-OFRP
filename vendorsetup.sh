# Copyright (C) 2025-2026 OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-only

FDEVICE="avalon"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

# Build
export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk-v30.7.zip
export TW_DEFAULT_LANGUAGE="en"
export LC_ALL="C"
export ALLOW_MISSING_DEPENDENCIES=true

# Build environment stuffs
export TARGET_DEVICE_ALT="avalon, OP5E93L1"
export FOX_TARGET_DEVICES="avalon, OP5E93L1"

# A/B partitions
export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1
export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1

# Device stuff
export OF_DEFAULT_KEYMASTER_VERSION=4.1
export OF_FORCE_PREBUILT_KERNEL=1
export OF_DYNAMIC_FULL_SIZE=9126805504

# Binaries & Tools
export OF_ADVANCED_SECURITY=1
export FOX_BASH_TO_SYSTEM_BIN=1
export FOX_USE_LZ4_COMPRESSION=1
export FOX_USE_ZIP_BINARY=1
export FOX_USE_BUSYBOX_BINARY=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_XZ_UTILS=1
export FOX_USE_BASH_SHELL=1
export FOX_DELETE_AROMAFM=1

# Maintainer & Build Info
export FOX_BUILD_TYPE="Testing"
export FOX_MAINTAINER_PATCH_VERSION="3"
export OF_MAINTAINER="Sathiya_Senpai"
	
else
   if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
      echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
   fi
fi
