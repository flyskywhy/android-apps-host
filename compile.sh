#! /bin/sh

# Read the Android HOWTO and setup all that stuff correctly.
# Get the Android SDK Platform 2.1, 2.2 and 2.3 API : version 7, 8 and (9 or 10)
# or modify numbers in configure.sh and vlc-android/default.properties.
# Create an AVD with this platform.

# XXX : important!
cat << EOF
If you plan to use a device without NEON (e.g. the emulator), you need a build without NEON:
$ export NO_NEON=1
Make sure it is set throughout the entire process.

The script will attempt to automatically detect if you have NDK v7, but you can override this.
If you do not have NDK v7 or later:
export NO_NDK_V7=1
or if you are sure you have NDK v7:
export NO_NDK_V7=0

EOF

export GIT_SERVER=''
export VLC_BRANCH=mips

export JAVA_HOME=`pwd`/../../tools/eps/mydroid/jdk1.6.0_27
export ANDROID_NDK=`pwd`/../../tools/android-ndk-r7b
export ANDROID_SDK=`pwd`/../../tools/android-sdk-linux

if [ -z "$ANDROID_NDK" -o -z "$ANDROID_SDK" ]; then
   echo "You must define ANDROID_NDK and ANDROID_SDK before starting."
   echo "They must point to your NDK and SDK directories."
   exit 1
fi

if [ -z "$NO_NDK_V7" ]; then
    # try to detect NDK version
    REL=$(grep -i "r7" $ANDROID_NDK/RELEASE.TXT)
    if [ -z $REL ]; then
        export NO_NDK_V7=1
    fi
fi

# Add the NDK toolchain to the PATH, needed both for contribs and for building
# stub libraries
export PATH=${ANDROID_NDK}/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86/bin:${PATH}

# 1/ libvlc, libvlccore and its plugins
#TESTED_HASH=544af798
if [ ! -d "vlc" ]; then
    echo "VLC source not found, cloning"
    #git clone git://git.videolan.org/vlc.git vlc
    #git checkout -B android ${TESTED_HASH}
    git clone ${GIT_SERVER}/pub/gittrees/apps/vlc.git vlc
    cd vlc
    git checkout ${VLC_BRANCH}
    cd -
else
    echo "VLC source found, updating"
    cd vlc
    git fetch origin
    #git checkout -B android ${TESTED_HASH}
    git checkout ${VLC_BRANCH}
    cd -
fi

echo "Applying the patches"
cd vlc
git am ../patches/*.patch || git am --abort

echo "Building the contribs"
mkdir contrib/android; cd contrib/android
../bootstrap --host=arm-linux-androideabi --disable-disc --disable-sout --enable-small \
    --disable-sdl \
    --disable-SDL_image \
    --disable-fontconfig \
    --disable-ass \
    --disable-freetyp2 \
    --disable-fribidi \
    --disable-zvbi \
    --disable-kate \
    --disable-caca \
    --disable-gettext \
    --disable-mpcdec \
    --disable-upnp \
    --disable-gme \
    --disable-tremor \
    --disable-vorbis \
    --disable-sidplay2 \
    --disable-samplerate

# TODO: mpeg2, dts, theora

make fetch
make

cd ../.. && mkdir -p android && cd android

if test ! -s "../configure" ; then
    echo "Bootstraping"
    ../bootstrap
fi

echo "Configuring"
sh ../extras/package/android/configure.sh

echo "Building"
make


# 2/ VLC android UI and specific code

echo "Building Android"
cd ../../

export ANDROID_SYS_HEADERS_GINGERBREAD=${PWD}/android-headers-gingerbread
export ANDROID_SYS_HEADERS_ICS=${PWD}/android-headers-ics

export ANDROID_LIBS=${PWD}/android-libs
export VLC_BUILD_DIR=vlc/android

make distclean
make
