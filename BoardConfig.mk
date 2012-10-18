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

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true

# inherit from the proprietary version
-include vendor/htc/vigor/BoardConfigVendor.mk

# inherit from common msm8660
-include device/htc/msm8660-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := vigor

# Kernel
BOARD_KERNEL_BASE      := 0x48800000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE   := console=ttyHSL3 androidboot.hardware=vigor no_console_suspend=1 
COMMON_GLOBAL_CFLAGS   += -DQCOM_ROTATOR_KERNEL_FORMATS
# Build the kernel
TARGET_KERNEL_VERSION := 3.0
TARGET_KERNEL_CONFIG   := vigor_aosp_defconfig
TARGET_KERNEL_SOURCE   := kernel/htc/vigor-$(TARGET_KERNEL_VERSION)

# RIL
BOARD_PROVIDES_LIBRIL := true

# Camera
BOARD_HAVE_HTC_FFC := true
COMMON_GLOBAL_CFLAGS += -DNO_UPDATE_PREVIEW

# Filesystem
BOARD_USES_MMCUTILS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1308621824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2550136320
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 38
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun%d/file

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := vigor
