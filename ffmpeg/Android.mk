LOCAL_PATH:=$(call my-dir)
FFMPEG_PATH:=$(call my-dir)

include $(CLEAR_VARS)

CPU=cortex-a53

LOCAL_MODULE		:=libffmpeg4
LOCAL_MODULE_TAGS	:=eng
LOCAL_MULTILIB		:= 32

LOCAL_MODULE_CLASS	:=EXECUTABLES
include $(BUILD_SYSTEM)/binary.mk

#FFMPEG_ANDROID_NDK:= $(realpath $(HISTORICAL_NDK_VERSIONS_ROOT)/current/platforms/android-27/arch-$(TARGET_ARCH))
FFMPEG_ANDROID_NDK:=../../prebuilts/ndk/current/platforms/android-27/arch-arm
FFMPEG_TOOLCHAIN_PATH 	:= ${PWD}/prebuilts/clang/host/linux-x86/clang-4691093

$(warning Configuring & compiling  FFmpeg...$(LOCAL_BUILT_MODULE))
ffmpeg_build_module:= $(LOCAL_BUILT_MODULE)

$(LOCAL_INSTALLED_MODULE): $(LOCAL_BUILT_MODULE)
	echo "building ffmpeg..$(FFMPEG_PATH) ....$(FFMPEG_ANDROID_NDK)."
	cd $(FFMPEG_PATH) && \
	ANDROID_OUT=$(TARGET_OUT_INTERMEDIATES) \
        ANDROID_NDK=$(FFMPEG_ANDROID_NDK) \
        ANDROID_TOOLCHAIN_PATH=$(FFMPEG_TOOLCHAIN_PATH) \
	./buildFfmpeg.sh  
	touch $(ffmpeg_build_module)

	@echo "Install: $@"
	TARGET_OUT_DIR=`pwd`/$(TARGET_OUT)/ && cd $(FFMPEG_PATH)/android/$(CPU) && find . -regextype posix-egrep -regex ".*\.so(\..*)*" -print | cpio -pvdum $$TARGET_OUT_DIR


# Other libraries
include $(CLEAR_VARS)
LOCAL_LIBS_PATH:=$(LOCAL_PATH)/external/ffmpeg/android/cortex-a53/lib
LOCAL_MODULE := libavutil
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_LIBS_PATH)/libavutil.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_LIBS_PATH:=$(LOCAL_PATH)/external/ffmpeg/android/cortex-a53/lib
LOCAL_MODULE := libavcodec
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_LIBS_PATH)/libavcodec.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_LIBS_PATH:=$(LOCAL_PATH)/external/ffmpeg/android/cortex-a53/lib
LOCAL_MODULE := libavformat
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_LIBS_PATH)/libavformat.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_LIBS_PATH:=$(LOCAL_PATH)/external/ffmpeg/android/cortex-a53/lib
LOCAL_MODULE := libswresample
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_LIBS_PATH)/libswresample.so
include $(PREBUILT_SHARED_LIBRARY)

