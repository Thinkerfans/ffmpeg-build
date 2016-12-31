#!/bin/bash
NDK=/Users/cfans/Documents/android-sdk-macosx/ndk-bundle
PLATFORM=$NDK/platforms/android-9/arch-mips/
TOOLCHAIN=$NDK/toolchains/mipsel-linux-android-4.9/prebuilt/darwin-x86_64
PREFIX=./android/mips

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=mipsel-linux \
  --cross-prefix=$TOOLCHAIN/bin/mipsel-linux-android- \
  --sysroot=$PLATFORM \
  --disable-asm

  make clean
  make
  make install
}

build_one

echo Android MIPS builds finished
