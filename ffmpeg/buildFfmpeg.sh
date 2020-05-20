#!/bin/sh
set -x
set -e

CPU=`cat /proc/cpuinfo | grep "processor" | wc -l`
CUR_DIR=$PWD
TOP_DIR="$CUR_DIR/../.."

#openssl path
#FFMPEG_INSTALL_TARGET_INCLUDE=../openssl/include
#FFMPEG_INSTALL_TARGET_LIB=../openssl/prebuild_arm
FFMPEG_INSTALL_TARGET_INCLUDE=../boringssl/include
FFMPEG_INSTALL_TARGET_LIB=../../out/target/product/proline_exec_alpha/system/lib
FFMPEG_TOOLCHAIN_HOST=

FFMPEG_ARCH="armv7-a"
#CPU="cortex-a53"
FFMPEG_DEBUG_OPS=""
#FFMPEG_DEBUG_OPS="--disable-optimizations --disable-mmx --disable-stripping --enable-debug"

#EXTRA_LD_FLAGS="-L $(TARGET_OUT)/system"
FFMPEG_LIBLOC=cortex-a53
LOCAL_MODULE=libffmgep4
LOCAL_MODULE_TAGS=eng
LOCAL_MODULE_CLASS=EXECUTABLES
PREFIX=$CUR_DIR/android/$FFMPEG_LIBLOC
#prebuilts/clang/host/linux-x86/clang-4691093/bin/clang
#--cross-prefix="${ANDROID_TOOLCHAIN_PATH}/bin/${FFMPEG_TOOLCHAIN_HOST}-" \
#--cc="${ANDROID_TOOLCHAIN_PATH}/bin/${FFMPEG_TOOLCHAIN_HOST}"-gcc \
#--cxx="${ANDROID_TOOLCHAIN_PATH}/bin/${FFMPEG_TOOLCHAIN_HOST}"-g++ \
#include $(BUILD_SYSTEM)/binary.mk
CFLAGS='-o3 -fPIC'
LDFLAGS='-lc'
CC_FLAGS='-target thumbv7-none-linux-androideabi -mfpu=vfpv3-d16 -mfloat-abi=soft'

NDK=/opt/android-ndk-r20b
SYSROOT=$NDK/sysroot 
LLVM_TOOLCHAIN=${NDK}/toolchains/llvm/prebuilt/linux-x86_64/bin
ANDROID_API=27
ANDROID_ABI=armv7a
BUILD_HOST=linux-x86_64
TARGET=arm-linux-androideabi
EXTRA_C_FLAGS="-I${FFMPEG_INSTALL_TARGET_INCLUDE} $CFLAGS $CC_FLAGS -I${SYSROOT}/usr/include/${TARGET}"
EXTRA_LD_FLAGS="-L${FFMPEG_INSTALL_TARGET_LIB} -lssl -lcrypto -L/opt/android-ndk-r20b/platforms/android-27/arch-arm/usr/lib/ -L${NDK}/toolchains/${TARGET}-4.9/prebuilt/${BUILD_HOST}/lib/gcc/${TARGET}/4.9.x/ -L${NDK}/platforms/android-{$ANDROID_API}/arch-arm/usr/lib $LDFLAGS"
CC=${LLVM_TOOLCHAIN}/${ANDROID_ABI}-linux-androideabi${ANDROID_API}-clang
CXX=${LLVM_TOOLCHAIN}/${ANDROID_ABI}-linux-androideabi${ANDROID_API}-clang++
AS=$CC
AR=${LLVM_TOOLCHAIN}/${TARGET}-ar
LD=${LLVM_TOOLCHAIN}/${TARGET}-ld
STRIP=${LLVM_TOOLCHAIN}/${TARGET}-strip

function build_ffmpeg()
{
	cd $CUR_DIR
	./configure \
        --prefix=${PREFIX} \
        --extra-cflags="${EXTRA_C_FLAGS}" \
        --extra-ldflags="${EXTRA_LD_FLAGS}" \
        --sysroot=${SYSROOT} \
        --extra-libs=-lgcc \
        --enable-cross-compile \
        --target-os="android" \
	--cc=${CC} \
	--cxx=${CXX} \
        --ar=${AR} \
        --as=${AS} \
        --ld=${LD} \
        --strip=${STRIP} \
        --disable-static \
        --disable-encoders \
        --disable-ffplay \
        --disable-ffprobe \
        --disable-ffmpeg \
        --disable-muxers \
        --disable-indevs \
        --disable-bsfs \
        --disable-filters \
        --disable-doc \
        ${FFMPEG_DEBUG_OPS} \
        --disable-linux-perf \
        --enable-network \
        --enable-openssl \
        --enable-swscale \
        --enable-shared \
        --enable-parsers \
        --enable-decoders \
        --enable-demuxers \
        --enable-protocols \
        --disable-x86asm \
        --disable-inline-asm

        #--march="${FFMPEG_ARCH}" \
#	echo "Configire finished ---------------------------------------------\n"
	make clean
#	echo "Make Started  ---------------------------------------------\n"
	make -j ${CPU}
#	echo "Make Finished  ---------------------------------------------\n"
	make install
	echo "Make install Finished  ---------------------------------------------\n"
	cd -
}

if [ -f $CUR_DIR/build.done ] && [ -d $PREFIX ] ;
then
	echo "FFMpeg already compiled"
else
	echo "build FFmpeg $ANDROID_NDK"
	build_ffmpeg

	echo "done" > $CUR_DIR/build.done
fi
