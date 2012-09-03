#!/bin/sh

function git_and_build()
{
    [ ! -d ../../$1/.git ] && git branch $1-gb origin/$1-gb
    git clone .. -b $1-gb ../../$1
    cd ../../$1
    ./compile.sh
    cd -
    cp ../../$1/vlc-android/libs/host/$1.a ./
    [ -d ../../$1/.git ] && git branch -d $1-gb
}

#echo $(git_and_build libcutils)
