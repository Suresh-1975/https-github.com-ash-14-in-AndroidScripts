LOCAL_PATH:= $(call my-dir)


include $(CLEAR_VARS)

#ALEXAAPP_DEBUG_ENABLED=true
#ALEXA_ANDROID_LOG=true
#ALEXA_EMIT_SENSITIVE_LOG=true


$(warning ALEXAAPP_DEBUG_ENABLED: $(ALEXAAPP_DEBUG_ENABLED))
$(warning ALEXA_ANDROID_LOG: $(ALEXA_ANDROID_LOG))
$(warning ALEXA_EMIT_SENSITIVE_LOG: $(ALEXA_EMIT_SENSITIVE_LOG))

AVSLIB_PATH=/home/suresh/Development/Alexa/BUILD/debug/android-19/armeabi-v7a/install/lib
AVSINC_PATH=/home/suresh/Development/Alexa/BUILD/debug/android-19/armeabi-v7a/install/include

LOCAL_CXXFLAGS:= \
	-DKWD \
	-DKWD_AMAZONLITE \
	-Wall \
	-Werror \
	-DRAPIDJSON_HAS_STDSTRING \
	--target=thumbv7-none-linux-androideabi

ifeq ($(ALEXAAP_DEBUG_ENABLED), true)
LOCAL_CXXFLAGS += \
	-g \
	-DDEBUG
endif

ifeq ($(ALEXA_ANDROID_LOG), true)
LOCAL_CXXFLAGS += \
	-DACSDK_LOG_MODULE=AlexaApp \
	-DANDROID \
	-DANDROID_LOGGER
endif

ifeq ($(ALEXA_EMIT_SENSITIVE_LOG),true)
LOCAL_CXXFLAGS += \
	-DACSDK_EMIT_SENSITIVE_LOGS
endif

LOCAL_C_INCLUDES:= \
	. \
	include \
	$(AVSINC_PATH) \

LOCAL_LDFLAGS:=  \
	-landroid \
	-L$(AVSLIB_PATH) \
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
	-lKeywordDetectorProvider \
	-lAMAZONLITE

ifeq ($(ALEXA_ANDROID_LOG), true)
LOCAL_LDFLAGS +=  \
 	-llog \
	-lAndroidUtilities
endif

LOCAL_SRC_FILES:= \
 	main.cpp \
	ConsolePrinter.cpp \
	ConsoleReader.cpp \
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
	polyappIntf.cpp
 
LOCAL_MODULE:= alexaClient
LOCAL_LDLIBS:= -latomic

include $(BUILD_EXECUTABLE)
