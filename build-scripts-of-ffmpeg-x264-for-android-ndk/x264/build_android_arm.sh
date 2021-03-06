#!/bin/bash
NDK=/Users/cfans/Documents/android-sdk-macosx/ndk-bundle
PLATFORM=$NDK/platforms/android-19/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
PREFIX=./android/arm

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --disable-shared \
  --enable-pic \
  --disable-asm \
  --host=arm-linux \
  --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
  --sysroot=$PLATFORM

  make clean
  make
  make install
}

build_one

echo Android ARM builds finished
