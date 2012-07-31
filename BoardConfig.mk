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

# inherit from the proprietary version
-include vendor/htc/vigor/BoardConfigVendor.mk

# inherit from common msm8660
-include device/htc/msm8660-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := vigor

#RIL
# TARGET_PROVIDES_LIBRIL := vendor/htc/vigor/proprietary/lib/libril.so

BOARD_KERNEL_BASE := 0x48800000
BOARD_KERNEL_PAGE_SIZE := 00000800
BOARD_KERNEL_CMDLINE := console=ttyHSL3 androidboot.hardware=vigor no_console_suspend=1 

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := vigor

BOARD_USES_QCOM_LIBS := true

# cat /proc/emmc
# dev:        size     erasesize name
# mmcblk0p24: 00fff600 00000200 "misc"
# mmcblk0p23: 00fffc00 00000200 "recovery"
# mmcblk0p22: 01000000 00000200 "boot"
# mmcblk0p29: 4dfffc00 00000200 "system"
# mmcblk0p31: 001ffe00 00000200 "local"
# mmcblk0p36: 13ff7c00 00000200 "cache"
# mmcblk0p35: 97fffe00 00000200 "userdata"
# mmcblk0p30: 01dba800 00000200 "devlog"
# mmcblk0p33: 00040000 00000200 "pdata"
# mmcblk0p37: 00008000 00000200 "extra"
# mmcblk0p17: 02800000 00000200 "radio"
# mmcblk0p21: 02000000 00000200 "adsp"
# mmcblk0p19: 007ffc00 00000200 "radio_config"
# mmcblk0p25: 00400000 00000200 "modem_st1"
# mmcblk0p26: 00400000 00000200 "modem_st2"
# mmcblk0p18: 02800000 00000200 "mdm9k"
# mmcblk0p20: 007ffa00 00000200 "mdm9k_config"
# mmcblk0p27: 00400000 00000200 "mdm_efs1"
# mmcblk0p28: 00400000 00000200 "mdm_efs2"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1308621824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2550136320
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CUSTOM_GRAPHICS := device/htc/vigor/recovery/graphics.c
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

TARGET_PREBUILT_KERNEL := device/htc/vigor/ramdisk/kernel

TARGET_RECOVERY_INITRC := device/htc/vigor/recovery/init.rc
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk0p37
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1p1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := 1

BOARD_USE_LEGACY_TOUCHSCREEN := true
DYNAMIC_SHARED_LIBV8SO := true
BOARD_USE_NEW_LIBRIL_HTC := true
