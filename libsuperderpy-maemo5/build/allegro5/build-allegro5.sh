#!/bin/sh
set -e

sudo /scratchbox/sbin/sbox_ctl start
sb-conf select FREMANTLE_ARMEL
sudo /scratchbox/sbin/sbox_sync

wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.5.0-p2.tar.gz -O /scratchbox/users/admin/home/admin/allegro5.tar.gz

tee /scratchbox/users/admin/home/admin/build-allegro5.sh << EOF
#/bin/sh
set -e
cd /home/admin
tar xzf allegro5.tar.gz
cd allegro-5.2.5.0
mkdir -p build
cd build
CFLAGS="-mfpu=neon -DGLchar=char" cmake .. -DALLEGRO_SDL=yes -DWANT_DEMO=no -DWANT_EXAMPLES=no
make -j3
make install
cd ../..
rm -rf allegro-5.2.5.0 allegro5.tar.gz build-allegro5.sh
EOF

chmod +x /scratchbox/users/admin/home/admin/build-allegro5.sh
/scratchbox/login /home/admin/build-allegro5.sh
sudo rm -f /home/admin/build-allegro5.sh
