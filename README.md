# A great Android `.apk`, `elf`, `.so` and Host `.exe`, `elf`, `.a` compile system fork from [git://git.videolan.org/vlc-ports/android.git](http://git.videolan.org/?p=vlc-ports/android.git) just with NDK and SDK,

Because videolan is still WIP it, for merge code later and for respect, Li Zheng <flyskywhy@gmail.com> just removed vlc related files in vlc-android/, and didn't touch the vlc related character in compile.sh, Makefile, and vlc-android/.

Branch description:

- `android-apps-host`: template app base on branch vlc2android-mips
- `installd-gb`: installd of android-gingerbread version base on branch android-apps-host, also this is a simple template usage sample
- `adb-gb`: adb of android-gingerbread version base on branch android-apps-host, also this is a complex template usage sample
- `master`: [git://git.videolan.org/vlc-ports/android.git](http://git.videolan.org/?p=vlc-ports/android.git)
- `vlc2android-mips`: vlc android mips version base on branch master

Target support:

- Android on ARM and MIPS, maybe x86 is OK too.

Host support:

- Linux and Windows on x86, maybe Darwin is OK too.

Host Windows support:

- Host support by MinGW under Windows (recommend msys.bat in [msysgit](http://github.com/msysgit/msysgit))
- Host support by MinGW under Linux (recommend `apt-get install gcc-mingw32` and use below command to install `mingw32-zlib`)

`wget http://apt.arrozcru.org/mingw32-zlib/mingw32-zlib_1.2.5-1_all.deb; sudo dpkg -i mingw32-zlib_1.2.5-1_all.deb`


File support:

- Android `.apk`: source code in vlc-android/, then modify compile.sh Makefile and vlc-android/jni/Android.mk
- Android `elf` and `.so`: source code in vlc-android/jni/, then modify vlc-android/jni/Android.mk
- Host `.exe`, `elf` and `.a`: source code in vlc-android/jni/, then modify vlc-android/jni/Android.mk, and need [android-ndk-host](http://github.com/flyskywhy/android-ndk-host)(<200KB) overwrite on Google Android ndk by yourself or the overwrited [android-ndk-r7b](http://github.com/flyskywhy/android-ndk-r7b)(>100MB)

If compile error, maybe the `1st_install_tools.sh` here can help you.

# The build environment

1. Prepare source code as `File support` descripted
2. Set variable like `export ANDROID_NDK` in `compile.sh` as your wish
3. if your app need ld to some `.a` files (e.g. on linux host, adb need libcutils.a), you can modify and run `host-libs/gen-libs.sh`, or just copy the `.a` files from compiled Android source to `host-libs/`
4. Run `compile.sh`
