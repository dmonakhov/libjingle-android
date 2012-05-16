# script expect linphone-root-dir variable to be set by parent !

ifeq ($(BUILD_JINGLE), 1)
	BUILD_SRTP=1
	BUILD_EXPAT=1
endif

ifeq ($(BUILD_UNITTEST), 1)
	BUILD_GTEST=1
endif

ifeq ($(BUILD_SRTP), 1)
SRTP_C_INCLUDE= \
	$(libjingle-root-dir)/submodules/externals/srtp \
	$(libjingle-root-dir)/submodules/externals/srtp/include \
	$(libjingle-root-dir)/submodules/externals/srtp/crypto/include
endif

ifeq ($(BUILD_EXPAT), 1)
EXPAT_C_INCLUDE= \
	$(libjingle-root-dir)/submodules/externals/expat/lib
endif
#endif


# Openssl
ifeq ($(wildcard $(libjingle-root-dir)/submodules/externals/prebuilts/ssl.mk),)
include $(libjingle-root-dir)/submodules/externals/openssl/Android.mk
else
include $(libjingle-root-dir)/submodules/externals/prebuilts/ssl.mk
include $(libjingle-root-dir)/submodules/externals/prebuilts/crypto.mk
endif

# Srtp
ifeq ($(BUILD_SRTP), 1)
include $(libjingle-root-dir)/submodules/externals/build/srtp/Android.mk
endif

ifeq ($(BUILD_EXPAT), 1)
$(info Build libexpat)
include $(libjingle-root-dir)/submodules/externals/build/expat/Android.mk
endif

ifeq ($(BUILD_GTEST), 1)
$(info Build libgtest)
include $(libjingle-root-dir)/submodules/externals/build/gtest/Android.mk
endif

# Libjingle
ifeq ($(BUILD_JINGLE), 1)
include $(libjingle-root-dir)/submodules/externals/libjingle/Android.mk
ifeq ($(BUILD_UNITTEST), 1)
$(info BUILD_UNITTEST=1)
include $(libjingle-root-dir)/submodules/externals/libjingle/Unittest.mk
endif
endif
