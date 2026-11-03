#
# Copyright (C) 2026 The LineageOS / Project Infinity-X
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),taipei)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
