LOCAL_PATH:= $(call my-dir)
ifneq ($(filter msm8960,$(TARGET_BOARD_PLATFORM)),)

include $(call all-subdir-makefiles)

endif

ifneq ($(filter msm8660,$(TARGET_BOARD_PLATFORM)),)

include $(LOCAL_PATH)/mm-core/Android.mk

endif
