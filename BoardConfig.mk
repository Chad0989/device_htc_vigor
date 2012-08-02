# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/vigor/BoardConfigVendor.mk

# inherit from common msm8660
-include device/htc/msm8660-common/BoardConfigCommon.mk

# vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := vigor

# Kernel
BOARD_KERNEL_BASE      := 0x48800000
BOARD_KERNEL_PAGE_SIZE := 00000800
BOARD_KERNEL_CMDLINE   := console=ttyHSL3 androidboot.hardware=vigor no_console_suspend=1 
TARGET_PREBUILT_KERNEL := device/htc/vigor/ramdisk/kernel
COMMON_GLOBAL_CFLAGS   += -DQCOM_ROTATOR_KERNEL_FORMATS
BOARD_USE_LEGACY_TOUCHSCREEN := true

# RIL
BOARD_PROVIDES_LIBRIL    := true

# Filesystem
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1308621824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2550136320
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk0p37
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1p1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2

# Recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/htc/vigor/recovery/graphics.c
TARGET_RECOVERY_INITRC := device/htc/vigor/recovery/init.rc
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := vigor

# Misc
DYNAMIC_SHARED_LIBV8SO := true
