LOCAL_PATH:= $(call my-dir)


unzip_files := \
	adler32.c \
	crc32.c \
	zutil.c \
	inflate.c \
	inftrees.c \
	inffast.c

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(unzip_files)
LOCAL_MODULE:= libunz
LOCAL_ARM_MODE := arm
include $(BUILD_HOST_STATIC_LIBRARY)
