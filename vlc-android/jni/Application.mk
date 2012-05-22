APP_PLATFORM := android-9
ifeq ($(MY_TARGET_ARCH),mips)
APP_ABI := mips
else
ifeq ($(NO_NEON),)
APP_ABI := armeabi-v7a
else
APP_ABI := armeabi
endif
endif
