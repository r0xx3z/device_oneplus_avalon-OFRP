#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Define hardware platform
PRODUCT_PLATFORM := pineapple

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oneplus/avalon/device.mk)

# OEM Info (automatically taken from device tree path)
BOARD_VENDOR := oneplus

# Device path for OEM device tree
DEVICE_PATH := device/oneplus/avalon

# Inherit from fox_avalon configs
$(call inherit-product, device/xiaomi/agate/fox_avalon.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := avalon
PRODUCT_NAME := twrp_avalon
PRODUCT_MODEL := CPH2661
PRODUCT_SYSTEM_NAME := $(PRODUCT_MODEL)
PRODUCT_SYSTEM_DEVICE := OP5E93L1
PRODUCT_BRAND := $(BOARD_VENDOR)
PRODUCT_MANUFACTURER := $(PRODUCT_BRAND)

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

