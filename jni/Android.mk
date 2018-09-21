LOCAL_PATH := $(call my-dir)
AVS_ROOT_PATH := $(LOCAL_PATH)

#AVS CFLAGS 

common_CFLAGS= \
	-DDEBUG \
	-DACSDK_DEBUG_LOG_ENABLED \
	-Wall \
	-Werror \
	-Wsign-compare \
	-g \
	-fPIE \
	-fpermissive \
	-DRAPIDJSON_HAS_STDSTRING \
	-DACSDK_LATENCY_LOG_ENABLED \
	-DACSDK_LOG_MODULE \
	-Wno-non-virtual-dtor \
	#-DSENSORY_KEY_WORD_DETECTOR=ON \
	-DGSTREAMER_MEDIA_PLAYER=ON \
	
#	-ffunction-sections \
	-DPORTAUDIO=ON \
	-funwind-tables \
	-std=c++11 \
	-fexceptions \

#AVS Includes
alexa_local_cpp_includes := \
	$(AVS_ROOT_PATH)/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/ADSL/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/AFML/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/ACL/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/CapabilityAgents/AIP/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/CapabilityAgents/Alerts/include  \
	$(AVS_ROOT_PATH)/../avs-device-sdk/CapabilityAgents/AudioPlayer/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/CapabilityAgents/Notifications/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/CapabilityAgents/PlaybackController/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/CapabilityAgents/Settings/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/CapabilityAgents/SpeakerManager/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/CapabilityAgents/SpeechSynthesizer/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/CapabilityAgents/System/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/CapabilityAgents/TemplateRuntime/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/CertifiedSender/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/ContextManager/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/ApplicationUtilities/DefaultClient/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/Integration/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/ApplicationUtilities/DefaultClient/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/KWD/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/KWD/Sensory/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/PlaylistParser/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/Storage/SQLiteStorage/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/ThirdParty/rapidjson/rapidjson-1.1.0/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/ApplicationUtilities/Resources/Audio/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/AuthDelegate/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/AVSCommon/AVS/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/AVSCommon/SDKInterfaces/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/AVSCommon/Utils/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/ThirdParty/include \
	$(AVS_ROOT_PATH)/../avs-device-sdk/ThirdParty/MultipartParser \
	$(AVS_ROOT_PATH)/../avs-device-sdk/AVSCommon/Utils/include/AVSCommon/Utils/Logger \
	$(AVS_ROOT_PATH)/../avs-device-sdk/MediaPlayer/include \
	/home/polycom/AVS-Testing/android/ndk-bundle/sources/android/support/include \
	/home/polycom/AVS-Testing/android/ndk-bundle/sources/cxx-stl/llvm-libc++/libcxx/include \
	/home/polycom/AVS-Testing/android/ndk-bundle/platforms/android-18/arch-arm/usr/include \
	
	
	
	#/home/polycom/AVS-Testing/android/test/android-ndk-r9/sources/cxx-stl/gnu-libstdc++/4.8/include \
  /home/polycom/AVS-Testing/android/test/android-ndk-r9/sources/cxx-stl/gnu-libstdc++/4.8/libs/armeabi-v7a/include \
	/home/polycom/AVS-Testing/android/test/android-ndk-r9/sources/android/support/include \
  /home/polycom/AVS-Testing/android/test/android-ndk-r9/platforms/android-9/arch-arm/usr/include \
	/home/polycom/AVS-Testing/android/sdk/ndk-bundle/toolchain-armeabi-v7a/android-18/sysroot/usr/include \


#/home/polycom/AVS-Testing/android/ndk-bundle/sources/cxx-stl/llvm-libc++/include \
	/home/polycom/AVS-Testing/android/ndk-bundle/sources/android/support/include \

#ifeq ($(NEED_PREBUILT_BUILD),true)
#LOCAL_WHOLE_STATIC_LIBRARIES += $(AVS_ROOT_PATH)/libs/libcurl.a 
include $(CLEAR_VARS)
LOCAL_MODULE            := curl_static
LOCAL_SRC_FILES         := libs/libcurl.a
LOCAL_SRC_FILES         := $(AVS_ROOT_PATH)/BUILD/debug/android-19/jniLibs/armeabi-v7a/libcurl.a
LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/BUILD/debug/android-19/armeabi-v7a/curl/include
include $(PREBUILT_STATIC_LIBRARY)

#LOCAL_WHOLE_STATIC_LIBRARIES += $(AVS_ROOT_PATH)/libs/libcrypto.a
include $(CLEAR_VARS)
LOCAL_MODULE            := crypto_static
#LOCAL_SRC_FILES        := libs/libcrypto.a
LOCAL_SRC_FILES		:= $(AVS_ROOT_PATH)/BUILD/debug/android-19/jniLibs/armeabi-v7a/libcrypto.a
#LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/include/openssl/include
#LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/BUILD/debug/android-19/armeabi-v7a/openssl/include
include $(PREBUILT_STATIC_LIBRARY)

#LOCAL_WHOLE_STATIC_LIBRARIES += $(AVS_ROOT_PATH)/libs/libssl.a 
include $(CLEAR_VARS)
LOCAL_MODULE            := ssl_static
#LOCAL_SRC_FILES         := libs/libssl.a
LOCAL_SRC_FILES         := $(AVS_ROOT_PATH)/BUILD/debug/android-19/jniLibs/armeabi-v7a/libssl.a
LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/BUILD/debug/android-19/armeabi-v7a/openssl/include
include $(PREBUILT_STATIC_LIBRARY)

#LOCAL_WHOLE_STATIC_LIBRARIES := $(AVS_ROOT_PATH)/libs/libnghttp2.a 
include $(CLEAR_VARS)
LOCAL_MODULE            := nghttp2_static
#LOCAL_SRC_FILES         := libs/libnghttp2.a
LOCAL_SRC_FILES         := $(AVS_ROOT_PATH)/BUILD/debug/android-19/jniLibs/armeabi-v7a/libnghttp2.a
LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/BUILD/debug/android-19/armeabi-v7a/openssl/include/nghttp2/include
include $(PREBUILT_STATIC_LIBRARY)

#LOCAL_WHOLE_STATIC_LIBRARIES := $(AVS_ROOT_PATH)/libs/libsnsr_armeabi-v7a.a 
include $(CLEAR_VARS)
LOCAL_MODULE            := sensory_static
LOCAL_SRC_FILES         := libs/libsnsr_armeabi-v7a.a
#LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/include/include
include $(PREBUILT_STATIC_LIBRARY)

#libportaudio.a
#include $(CLEAR_VARS)
#LOCAL_MODULE            := portaudio_static
#LOCAL_SRC_FILES         := libs/libportaudio.a
#LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/include/include
#include $(PREBUILT_STATIC_LIBRARY)




#LOCAL_WHOLE_STATIC_LIBRARIES := $(AVS_ROOT_PATH)/libs/libsnsr_armeabi-v7a.a 
include $(CLEAR_VARS)
LOCAL_MODULE            := sqlite3_static
LOCAL_SRC_FILES         := libs/libsqlite3.a
#LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/include/include
include $(PREBUILT_STATIC_LIBRARY)

#LOCAL_WHOLE_STATIC_LIBRARIES := $(AVS_ROOT_PATH)/libs/libsnsr_armeabi-v7a.a 
include $(CLEAR_VARS)
LOCAL_MODULE            := gstreamer1.0_shared
LOCAL_SRC_FILES         := libs/libgstreamer-1.0.so
LOCAL_EXPORT_C_INCLUDES := include/gst/include
include $(PREBUILT_SHARED_LIBRARY)

#LOCAL_WHOLE_STATIC_LIBRARIES := $(AVS_ROOT_PATH)/libs/libsnsr_armeabi-v7a.a 
include $(CLEAR_VARS)
LOCAL_MODULE            := gstapp_shared
LOCAL_SRC_FILES         := libs/libgstapp-1.0.so
#LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/include//include
include $(PREBUILT_SHARED_LIBRARY)

#jni/libs/libglib-2.0.so
#LOCAL_WHOLE_STATIC_LIBRARIES := $(AVS_ROOT_PATH)/libs/libsnsr_armeabi-v7a.a 
include $(CLEAR_VARS)
LOCAL_MODULE            := glib2.0_shared
LOCAL_SRC_FILES         := libs/libglib-2.0.so
#LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/include//include
include $(PREBUILT_SHARED_LIBRARY)


#libgobject-2.0.so
#LOCAL_WHOLE_STATIC_LIBRARIES := $(AVS_ROOT_PATH)/libs/libsnsr_armeabi-v7a.a 
include $(CLEAR_VARS)
LOCAL_MODULE            := gobject_shared
LOCAL_SRC_FILES         := libs/libgobject-2.0.so
#LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/include//include
include $(PREBUILT_SHARED_LIBRARY)
#endif

#Build LibAlexa Library
include $(CLEAR_VARS)
# ALEXA ACL  source
LOCAL_SRC_FILES:= \
	../avs-device-sdk/ADSL/src/DirectiveProcessor.cpp \
	../avs-device-sdk/ADSL/src/DirectiveRouter.cpp \
	../avs-device-sdk/ADSL/src/DirectiveSequencer.cpp \
	../avs-device-sdk/ADSL/src/MessageInterpreter.cpp \
	../avs-device-sdk/ACL/src/AVSConnectionManager.cpp \
	../avs-device-sdk/ACL/src/Transport/HTTP2MessageRouter.cpp \
	../avs-device-sdk/ACL/src/Transport/HTTP2Stream.cpp \
	../avs-device-sdk/ACL/src/Transport/HTTP2StreamPool.cpp \
	../avs-device-sdk/ACL/src/Transport/HTTP2Transport.cpp \
	../avs-device-sdk/ACL/src/Transport/MessageRouter.cpp \
	../avs-device-sdk/ACL/src/Transport/MimeParser.cpp  \
	../avs-device-sdk/ACL/src/Transport/PostConnectObject.cpp \
	../avs-device-sdk/ACL/src/Transport/PostConnectSynchronizer.cpp \
	../avs-device-sdk/ACL/src/Transport/TransportDefines.cpp \
	../avs-device-sdk/AFML/src/Channel.cpp \
	../avs-device-sdk/AFML/src/FocusManager.cpp \
	../avs-device-sdk/ApplicationUtilities/DefaultClient/src/DefaultClient.cpp \
	../avs-device-sdk/ApplicationUtilities/Resources/Audio/src/AlertsAudioFactory.cpp \
	../avs-device-sdk/ApplicationUtilities/Resources/Audio/src/AudioFactory.cpp \
	../avs-device-sdk/ApplicationUtilities/Resources/Audio/src/NotificationsAudioFactory.cpp \
	../avs-device-sdk/AuthDelegate/src/AuthDelegate.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/AbstractConnection.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/AlexaClientSDKInit.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/Attachment/Attachment.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/Attachment/AttachmentManager.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/Attachment/InProcessAttachment.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/Attachment/InProcessAttachmentReader.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/Attachment/InProcessAttachmentWriter.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/AVSDirective.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/AVSMessage.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/AVSMessageHeader.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/CapabilityAgent.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/DialogUXStateAggregator.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/EventBuilder.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/ExceptionEncounteredSender.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/HandlerAndPolicy.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/MessageRequest.cpp \
	../avs-device-sdk/AVSCommon/AVS/src/NamespaceAndName.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Configuration/ConfigurationNode.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Executor.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/FileUtils.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/JSONUtils.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/LibcurlUtils/CurlEasyHandleWrapper.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/LibcurlUtils/CurlMultiHandleWrapper.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/LibcurlUtils/HTTPContentFetcherFactory.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/LibcurlUtils/HttpPost.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/LibcurlUtils/LibCurlHttpContentFetcher.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/LibcurlUtils/LibcurlUtils.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Logger/ConsoleLogger.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Logger/Level.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Logger/LogEntryBuffer.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Logger/LogEntry.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Logger/LogEntryStream.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Logger/Logger.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Logger/LoggerSinkManager.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Logger/LoggerUtils.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Logger/ModuleLogger.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Logger/ThreadMoniker.cpp  \
	../avs-device-sdk/AVSCommon/Utils/src/Metrics.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/RequiresShutdown.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/RetryTimer.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Stream/Streambuf.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Stream/StreamFunctions.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/StringUtils.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/TaskQueue.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/TaskThread.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/TimePoint.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/Timer.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/TimeUtils.cpp \
	../avs-device-sdk/AVSCommon/Utils/src/UUIDGeneration.cpp \
	../avs-device-sdk/CapabilityAgents/AIP/src/AudioInputProcessor.cpp \
	../avs-device-sdk/CapabilityAgents/Alerts/src/Alarm.cpp \
	../avs-device-sdk/CapabilityAgents/Alerts/src/Alert.cpp  \
	../avs-device-sdk/CapabilityAgents/Alerts/src/AlertsCapabilityAgent.cpp \
	../avs-device-sdk/CapabilityAgents/Alerts/src/AlertScheduler.cpp \
	../avs-device-sdk/CapabilityAgents/Alerts/src/Reminder.cpp \
	../avs-device-sdk/CapabilityAgents/Alerts/src/Renderer/Renderer.cpp \
	../avs-device-sdk/CapabilityAgents/Alerts/src/Storage/SQLiteAlertStorage.cpp \
	../avs-device-sdk/CapabilityAgents/Alerts/src/Timer.cpp \
	../avs-device-sdk/CapabilityAgents/AudioPlayer/src/AudioPlayer.cpp \
	../avs-device-sdk/CapabilityAgents/Notifications/src/NotificationIndicator.cpp \
	../avs-device-sdk/CapabilityAgents/Notifications/src/NotificationRenderer.cpp \
	../avs-device-sdk/CapabilityAgents/Notifications/src/NotificationsCapabilityAgent.cpp \
	../avs-device-sdk/CapabilityAgents/Notifications/src/SQLiteNotificationsStorage.cpp \
	../avs-device-sdk/CapabilityAgents/PlaybackController/src/PlaybackController.cpp \
	../avs-device-sdk/CapabilityAgents/PlaybackController/src/PlaybackMessageRequest.cpp \
	../avs-device-sdk/CapabilityAgents/PlaybackController/src/PlaybackRouter.cpp \
	../avs-device-sdk/CapabilityAgents/Settings/src/Settings.cpp \
	../avs-device-sdk/CapabilityAgents/Settings/src/SettingsUpdatedEventSender.cpp \
	../avs-device-sdk/CapabilityAgents/Settings/src/SQLiteSettingStorage.cpp \
	../avs-device-sdk/CapabilityAgents/SpeakerManager/src/SpeakerManager.cpp \
	../avs-device-sdk/CapabilityAgents/SpeechSynthesizer/src/SpeechSynthesizer.cpp \
	../avs-device-sdk/CapabilityAgents/System/src/EndpointHandler.cpp \
	../avs-device-sdk/CapabilityAgents/System/src/SoftwareInfoSender.cpp \
	../avs-device-sdk/CapabilityAgents/System/src/SoftwareInfoSendRequest.cpp \
	../avs-device-sdk/CapabilityAgents/System/src/UserInactivityMonitor.cpp \
	../avs-device-sdk/CapabilityAgents/TemplateRuntime/src/TemplateRuntime.cpp \
	../avs-device-sdk/CertifiedSender/src/CertifiedSender.cpp \
	../avs-device-sdk/CertifiedSender/src/SQLiteMessageStorage.cpp \
	../avs-device-sdk/ContextManager/src/ContextManager.cpp \
        ../avs-device-sdk/KWD/Sensory/src/SensoryKeywordDetector.cpp \
	../avs-device-sdk/KWD/src/AbstractKeywordDetector.cpp \
	../avs-device-sdk/MediaPlayer/src/AttachmentReaderSource.cpp \
	../avs-device-sdk/MediaPlayer/src/BaseStreamSource.cpp \
	../avs-device-sdk/MediaPlayer/src/ErrorTypeConversion.cpp \
	../avs-device-sdk/MediaPlayer/src/IStreamSource.cpp \
	../avs-device-sdk/MediaPlayer/src/MediaPlayer.cpp \
	../avs-device-sdk/MediaPlayer/src/Normalizer.cpp \
	../avs-device-sdk/MediaPlayer/src/OffsetManager.cpp \
	../avs-device-sdk/MediaPlayer/src/UrlSource.cpp \
	../avs-device-sdk/PlaylistParser/src/PlaylistParser.cpp \
	../avs-device-sdk/PlaylistParser/src/UrlToAttachmentConverter.cpp \
	../avs-device-sdk/Storage/SQLiteStorage/src/SQLiteStatement.cpp \
	../avs-device-sdk/Storage/SQLiteStorage/src/SQLiteUtils.cpp \
	../avs-device-sdk/ThirdParty/MultipartParser/MultipartParser/multipart.cpp \
#	../avs-device-sdk/KWD/KittAi/src/KittAiKeyWordDetector.cpp \
	../avs-device-sdk/Integration/src/AipStateObserver.cpp \
	../avs-device-sdk/Integration/src/AuthObserver.cpp \
	../avs-device-sdk/Integration/src/ClientMessageHandler.cpp \
	../avs-device-sdk/Integration/src/ConnectionStatusObserver.cpp \
	../avs-device-sdk/Integration/src/ObservableMessageRequest.cpp \
	../avs-device-sdk/Integration/src/TestAlertObserver.cpp \
	../avs-device-sdk/Integration/src/TestDirectiveHandler.cpp \
	../avs-device-sdk/Integration/src/TestExceptionEncounteredSender.cpp \
	../avs-device-sdk/Integration/src/TestMediaPlayer.cpp \
	../avs-device-sdk/Integration/src/TestMessageSender.cpp \
	../avs-device-sdk/Integration/src/TestSpeechSynthesizerObserver.cpp \
	
LOCAL_C_INCLUDES:=$(alexa_local_cpp_includes)
#LOCAL_CPPFLAGS:-std=c++11
LOCAL_CFLAGS += $(common_CFLAGS)
#LOCAL_LDLIB:= $(AVS_ROOT_PATH)../../AVS-Testing/android/ndk-bundle/sources/cxx-stl/llvm-libc++/libs/armeabi-v7a/libc++_static.a, $(AVS_ROOT_PATH)/lib/libcurl.a, $(AVS_ROOT_PATH)/lib/libnghttp2.a
#LOCAL_COPY_HEADERS_TO := libalexa/alexa
#LOCAL_SHARED_LIBRARIES:= lgstreamer-1.0
LOCAL_MODULE:=libalexa
LOCAL_MODULE_TAGS := eng

include $(BUILD_STATIC_LIBRARY)

#SampleApp
include $(CLEAR_VARS)
LOCAL_CFLAGS += $(common_CFLAGS)
LOCAL_C_INCLUDES:= \
		$(alexa_local_cpp_includes)  \
		$(AVS_ROOT_PATH)/../avs-device-sdk/SampleApp/include \

LOCAL_MODULE:=TestAlexaApp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES:= \
	../avs-device-sdk/SampleApp/src/ConnectionObserver.cpp \
	../avs-device-sdk/SampleApp/src/ConsolePrinter.cpp \
	../avs-device-sdk/SampleApp/src/GuiRenderer.cpp \
	../avs-device-sdk/SampleApp/src/InteractionManager.cpp \
	../avs-device-sdk/SampleApp/src/KeywordObserver.cpp \
	../avs-device-sdk/SampleApp/src/main.cpp \
	../avs-device-sdk/SampleApp/src/SampleApplication.cpp \
	../avs-device-sdk/SampleApp/src/UIManager.cpp \
	../avs-device-sdk/SampleApp/src/UserInputManager.cpp \
  	../avs-device-sdk/SampleApp/src/PortAudioMicrophoneWrapper.cpp \

#LOCAL_STATIC_LIBRARIES:=portaudio_static  crypto_static
LOCAL_STATIC_LIBRARIES:=libc++_static libalexa curl_static nghttp2_static sensory_static ssl_static crypto_static portaudio_static sqlite3_static
#LOCAL_STATIC_LIBRARIES+=libalexa
LOCAL_LDFLAGS:=-Ljni/libs
LOCAL_SHARED_LIBRARIES :=gstapp_shared gstreamer1.0_shared  glib2.0_shared gobject_shared

#LOCAL_LDLIBS := -lopenles
LOCAL_LDLIBS := -lOpenSLES 
include $(BUILD_EXECUTABLE)


#libportaudio.a
#include $(CLEAR_VARS)
#LOCAL_MODULE            := portaudio_static
#LOCAL_SRC_FILES         := libs/libportaudio.a
#LOCAL_EXPORT_C_INCLUDES := $(AVS_ROOT_PATH)/include/include
#include $(PREBUILT_STATIC_LIBRARY)



