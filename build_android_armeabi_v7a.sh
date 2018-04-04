#!/bin/bash
#Change NDK to your Android NDK location
NDK=/Users/cfans/Documents/android-sdk-macosx/ndk-bundle
PLATFORM=$NDK/platforms/android-19/arch-arm/
PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64

GENERAL="\
--enable-cross-compile \
--extra-libs="-lgcc" \
--arch=arm \
--cc=$PREBUILT/bin/arm-linux-androideabi-gcc \
--cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
--nm=$PREBUILT/bin/arm-linux-androideabi-nm \
--extra-cflags="-I/Users/cfans/Documents/ffmpeg/ffmpeg-3.2/x264/android/arm/include" \
--extra-ldflags="-L/Users/cfans/Documents/ffmpeg/ffmpeg-3.2/x264/android/arm/lib" "



MODULES="\
--enable-gpl \
--enable-libx264"

function build_ARMv7
{
  ./configure \
  --target-os=linux \
  --prefix=./android/armeabi-v7a \
  ${GENERAL} \
  --sysroot=$PLATFORM \
  --enable-static \
  --disable-shared \
  --disable-ffmpeg \
  --disable-ffprobe \
  --disable-ffserver \
  --disable-avdevice \
  --disable-avfilter \
  --disable-postproc \
  --extra-cflags="-DANDROID -fPIC -ffunction-sections -funwind-tables -fstack-protector -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -fomit-frame-pointer -fstrict-aliasing -funswitch-loops -finline-limit=300" \
  --extra-ldflags="-Wl,-rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib -nostdlib -lc -lm -ldl -llog" \
 --enable-gpl \
 --enable-libx264 \
 --disable-everything \
 --enable-muxer=mp4 \
 --enable-muxer=avi \
 --enable-muxer=mjpeg \
 --enable-muxer=h264 \
 --enable-muxer=hevc \
 --enable-encoder=h264 \
 --enable-encoder=libx264 \
 --enable-encoder=mjpeg \
 --enable-encoder=zlib \
 --enable-decoder=mjpeg \
 --enable-decoder=h264 \
 --enable-decoder=hevc \
 --enable-parser=h264 \
 --enable-parser=mjpeg \
 --enable-parser=hevc \
 --disable-doc \
 --enable-neon \
 --disable-network

  
  $ADDITIONAL_CONFIGURE_FLAG
  make clean
  make
  make install
}

build_ARMv7
echo Android ARMv7-a builds finished
