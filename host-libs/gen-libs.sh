#!/bin/sh

function git_and_build()
{
    [ ! -d ../../$1/.git ] && git clone .. -b $1-gb ../../$1
    cd ../../$1
    ./compile.sh
    cd -
    cp ../../$1/vlc-android/libs/host/$1.a ./
}

echo $(git_and_build libcutils)
echo $(git_and_build libzipfile)
echo $(git_and_build libunz)
