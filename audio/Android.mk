ifneq ($(TARGET_PROVIDES_LIBAUDIO),true)
ifneq ($(BOARD_USES_AUDIO_LEGACY),true)
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)

AUDIO_HW_ROOT := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM),msm8660)
    include $(AUDIO_HW_ROOT)/msm8660/Android.mk
    include $(AUDIO_HW_ROOT)/mm-audio/Android.mk
endif
endif
endif
endif
