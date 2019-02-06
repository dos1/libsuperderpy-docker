#!/bin/sh
set -e

sudo /scratchbox/sbin/sbox_ctl start
sb-conf select FREMANTLE_ARMEL
sudo /scratchbox/sbin/sbox_sync

wget https://github.com/dos1/allegro5/archive/dos.zip -O /scratchbox/users/admin/home/admin/allegro5.zip

tee /scratchbox/users/admin/home/admin/build-allegro5.sh << EOF
#/bin/sh
set -e
cd /home/admin
unzip allegro5.zip
cd allegro5-dos
mkdir -p build
cd build
CFLAGS="-mfpu=neon -DGLchar=char" cmake .. -DALLEGRO_SDL=yes -DWANT_DEMO=no -DWANT_EXAMPLES=no
make -j3
make install
cd ../..
rm -rf allegro5-dos allegro5.zip build-allegro5.sh
EOF

chmod +x /scratchbox/users/admin/home/admin/build-allegro5.sh
/scratchbox/login /home/admin/build-allegro5.sh
sudo rm -rf /home/admin/build-allegro5.sh
