LOCAL_PATH:= $(call my-dir)/../../expat
include $(CLEAR_VARS)

LOCAL_MODULE:= libexpat_static

LOCAL_SRC_FILES := \
	lib/xmlparse.c \
	lib/xmlrole.c \
	lib/xmltok.c

#LOCAL_CFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes -fexceptions -DHAVE_EXPAT_CONFIG_H
LOCAL_CFLAGS := -DHAVE_EXPAT_CONFIG_H

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/lib

include $(BUILD_STATIC_LIBRARY)
