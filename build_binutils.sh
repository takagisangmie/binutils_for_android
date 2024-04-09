sh build_tool.sh
cp aarch64-linux-android-toolchain/bin/llvm-ar aarch64-linux-android-toolchain/bin/aarch64-linux-android-ar
# Add the standalone toolchain to the search path.
export PATH=$PATH:`pwd`/aarch64-linux-android-toolchain/bin
#export PATH=$PATH:/root/hxz/binutils_for_android/aarch64-linux-android-toolchain/bin 
# Tell configure what tools to use.
target_host=aarch64-linux-android
export AR=$target_host-ar
export AS=$target_host-clang
export CC=$target_host-clang
export CXX=$target_host-clang++
export LD=$target_host-ld
export STRIP=$target_host-strip

# Tell configure what flags Android requires.
export CFLAGS="-fPIE -fPIC -Wno-error -Wno-null-pointer-arithmetic"
export LDFLAGS="-pie"

cd binutils-2.33.1
./configure --host=aarch64-linux-android --prefix=`pwd`/install
make -j8 && make
