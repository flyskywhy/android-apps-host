ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    installd.c commands.c utils.c

LOCAL_C_INCLUDES := \
    $(ANDROID_SYS_HEADERS)/frameworks/base/include \
    $(ANDROID_SYS_HEADERS)/system/core/include

LOCAL_CFLAGS += -DHAVE_SYS_UIO_H

LOCAL_LDLIBS := -L$(ANDROID_LIBS) -lcutils

ifeq ($(MSOFT_FLOAT),1)
ifeq ($(MY_TARGET_ARCH),mips)
LOCAL_CFLAGS += -msoft-float
endif
endif

LOCAL_STATIC_LIBRARIES :=

LOCAL_MODULE:= installd

include $(BUILD_EXECUTABLE)

endif # !simulator))
