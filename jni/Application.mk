APP_PROJECT_PATH := $(call my-dir)/../
APP_MODULES      := libjingle

APP_STL := stlport_static

#default values
BUILD_JINGLE=1
BUILD_EXPAT=1

#default values
ifeq ($(BUILD_SRTP),)
BUILD_SRTP=1
endif

ifeq ($(BUILD_CMDTOOLS),)
BUILD_CMDTOOLS=1
endif

ifeq ($(BUILD_UNITTEST),)
BUILD_UNITTEST=0
endif

libjingle-root-dir:=$(APP_PROJECT_PATH)

ifeq ($(BUILD_CMDTOOLS), 1)
APP_MODULES += callapp
endif

ifeq ($(BUILD_UNITTEST), 1)
APP_MODULES += \
		base_unittest \
		p2p_unittest \
		media_unittest \
		sound_unittest \
		xmllight_unittest \
		xmpp_unittest
endif


APP_BUILD_SCRIPT:=$(call my-dir)/Android.mk
APP_PLATFORM := android-8
#APP_ABI := armeabi
APP_ABI := armeabi-v7a armeabi
APP_CFLAGS:=-DDISABLE_NEON
