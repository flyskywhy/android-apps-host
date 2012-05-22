#! /bin/sh
# Author: Li Zheng <flyskywhy@gmail.com>

apt-get install autopoint cmake << EOF
Y
EOF

if [ ! -f /usr/share/misc/config.guess.origin ]
then
mv /usr/share/misc/config.guess /usr/share/misc/config.guess.origin
cp ../../tools/config/config.guess /usr/share/misc/config.guess
mv /usr/share/misc/config.sub /usr/share/misc/config.sub.origin
cp ../../tools/config/config.sub /usr/share/misc/config.sub
fi
