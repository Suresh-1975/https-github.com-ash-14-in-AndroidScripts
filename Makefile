
ANDROID_HOME=/usr/src/android
NDK_PACKAGE=android-ndk-r16
ANDROID_ABI=armeabi-v7a
ANDROID_PLATFORM=android-19
TOOLCHAIN_HOST=arm-linux-androideabi
ANDROID_API_VERSION=android-19



#/usr/src/android/ndk/toolchains/android-ndk-r16/toolchain-armeabi-v7a/android-19/bin/arm-linux-androideabi-clang++
TOOLCHAIN=$(ANDROID_HOME)/ndk/toolchains/$(NDK_PACKAGE)/toolchain-$(ANDROID_ABI)/$(ANDROID_PLATFORM)
CP=/bin/cp
RM=/bin/rm
AR=${TOOLCHAIN}/bin/${TOOLCHAIN_HOST}-ar
CC=${TOOLCHAIN}/bin/${TOOLCHAIN_HOST}-clang
CPP=${TOOLCHAIN}/bin/${TOOLCHAIN_HOST}-cpp
CROSS_SYSROOT=${TOOLCHAIN}/sysroot
#CXX=${TOOLCHAIN}/bin/${TOOLCHAIN_HOST}-clang++
CXX=/usr/src/android/ndk/ndk-bundle/android-ndk-r16/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++
LD=${TOOLCHAIN}/bin/$(TOOLCHAIN_HOST)/bin/ld
LINK=${CXX}
#PATH=${TOOLCHAIN}/bin:${PATH}
RANLIB=${TOOLCHAIN}/bin/${TOOLCHAIN_HOST}-ranlib
READELF=${TOOLCHAIN}/bin/${TOOLCHAIN_HOST}-readelf
STRIP=${TOOLCHAIN}/bin/${TOOLCHAIN_HOST}-strip
#SYSROOT=${TOOLCHAIN}/sysroot
SYSROOT=/usr/src/android/ndk/toolchains/android-ndk-r16/toolchain-armeabi-v7a/android-19/sysroot

#/usr/src/android/ndk/toolchains/android-ndk-r16/toolchain-armeabi-v7a/android-19/lib/gcc/arm-linux-androideabi/4.9.x/armv7-a/thumb/
#CLANGLIBPATH=-L$(TOOLCHAIN)/lib/gcc/arm-linux-androideabi/4.9.x/armv7-a/thumb -L$(TOOLCHAIN)/arm-linux-androideabi/lib/armv7-a/thumb
AVSLIB_PATH=/home/suresh/Development/Alexa/BUILD/debug/android-19/armeabi-v7a/install/lib
AVSINC_PATH=/home/suresh/Development/Alexa/BUILD/debug/android-19/armeabi-v7a/install/include

EXE=alexaClient

INCLUDES= \
	-I. \
	-Iinclude \
	-I$(AVSINC_PATH) \
	--sysroot=$(SYSROOT) \
	--target=armv7-none-linux-androideabi \
	--gcc-toolchain=/usr/src/android/ndk/ndk-bundle/android-ndk-r16/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64 \




CXXFLAGS=$(INCLUDES)

CXXFLAGS+= \
	-DKWD \
	-DKWD_SENSORY \
	-ffunction-sections \
	-funwind-tables \
	-fstack-protector-strong \
	-no-canonical-prefixes \
	-march=armv7-a \
	-mfloat-abi=softfp \
	-mfpu=vfpv3-d16 \
	-fno-integrated-as \
	-mthumb \
	-Wformat \
	-Werror=format-security \
	-frtti \
	-fexceptions  \
	-DDEBUG \
	-Wall \
	-Werror \
	-Wsign-compare \
	-DRAPIDJSON_HAS_STDSTRING \
	-g \
	-fPIE \
	-std=c++11 \
	-DANDROID \
	-D__ANDROID_API__=19 \
	-Wa,--noexecstack \
	-Wl,--exclude-libs,libgcc.a -Wl,--exclude-libs,libatomic.a \



LDPATH= \
	$(AVSLIB_PATH) \
	-L$(SYSROOT)/usr/lib \
	$(CLANGLIBPATH) \

LDFLAGS= \
	-Wl,--build-id \
	-Wl,--warn-shared-textrel \
	-Wl,--fatal-warnings \
	-Wl,--fix-cortex-a8  \
	-pie \

LIBS= \
	Sensory/lib/android/libsnsr_armeabi-v7a.a \
	-llog \
	-landroid \
	-lAlerts \
	-lAudioResources \
	-lAVSCommon \
	-lCBLAuthDelegate \
	-lCertifiedSender \
	-lDefaultClient \
	-lNotifications \
	-lRegistrationManager \
	-lSettings \
	-lSQLiteStorage  \
	-lCapabilitiesDelegate \
	-lBluetooth \
	-lAIP \
	-lmpg123 \
	-lPlaylistParser \
	-lstdc++ \
	-lm \
	-lgcc \
	-ldl \
	-lc \

SRC= 	\
	ConsolePrinter.cpp \
	SampleApplication.cpp \
	UserInputManager.cpp \
	InteractionManager.cpp \
	UIManager.cpp \
	ConnectionObserver.cpp \
	GuiRenderer.cpp \
	TrioMicrophoneWrapper.cpp \
	audioFifoIn.cpp \
	SimplePlayer.cpp \
	FilePlayer.cpp \
	Mpg123Player.cpp \
	AudioFifoOut.cpp \
	KeywordObserver.cpp \
	DummyESPDataProvider.cpp \
	Sensory/SensoryKeywordDetector.cpp \
	AbstractKeywordDetector.cpp \
	KeywordDetectorProvider.cpp \
	polyappIntf.cpp \
 	main.cpp \


#OBJS:= \
	ConsolePrinter.o \
	SampleApplication.o \
	UserInputManager.o \
	InteractionManager.o \
	UIManager.o \
	ConnectionObserver.o \
	GuiRenderer.o \
	TrioMicrophoneWrapper.o \
	audioFifoIn.o \
	SimplePlayer.o \
	FilePlayer.o \
	Mpg123Player.o \
	AudioFifoOut.o \
	KeywordObserver.o \
	DummyESPDataProvider.o \
	Sensory/SensoryKeywordDetector.o \
	AbstractKeywordDetector.o \
	KeywordDetectorProvider.o \
	polyappIntf.o \
	main.o \

obj=$(SRC:.cpp=.o)

$(EXE): $(obj)
	$(CXX) $(CXXFLAGS)  -L$(LDPATH)  $(LDFLAGS) $(LIBS) -o $@ $^ 

.PHONY: clean
clean:
	$(RM) -f $(obj)
	$(RM) -f $(EXE)
