wget https://dl.google.com/android/repository/android-ndk-r25c-linux.zip
unzip android-ndk-r25c-linux.zip
export ANDROID_NDK="`pwd`/android-ndk-r25c"

$ANDROID_NDK/build/tools/make_standalone_toolchain.py \
  --arch arm64 \
  --api 26 \
  --install-dir=`pwd`/aarch64-linux-android-toolchain

