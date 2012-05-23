LOCAL_PATH:= $(call my-dir)

# build host static library
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	centraldir.c \
	zipfile.c

LOCAL_STATIC_LIBRARIES := \
	libunz

LOCAL_MODULE:= libzipfile

LOCAL_C_INCLUDES := \
    $(ANDROID_SYS_HEADERS)/frameworks/base/include \
    $(ANDROID_SYS_HEADERS)/system/core/include

include $(BUILD_HOST_STATIC_LIBRARY)

