#!/bin/bash

export NDK_PROJECT_PATH=.
export ALEXAAPP_DEBUG_ENABLED=true
export ALEXA_ANDROID_LOG=true
export ALEXA_EMIT_SENSITIVE_LOG=true
export PATH=/usr/src/android/ndk/ndk-bundle/android-ndk-r16/build:$PATH
ndk-build NDK_APPLICATION_MK=./Application.mk V=1
cp libs/armeabi-v7a/alexaClient .

