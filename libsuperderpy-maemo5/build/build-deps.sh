#!/bin/sh
set -e

sudo /scratchbox/sbin/sbox_ctl start
sb-conf select FREMANTLE_ARMEL
sudo /scratchbox/sbin/sbox_sync

/scratchbox/login apt-get update
/scratchbox/login apt-get install -y --force-yes libopenal-dev libphysfs-dev libtheora-dev libenet-dev libflac-dev libogg-dev libvorbis-dev libwebp-dev libxss-dev

wget https://cmake.org/files/v2.8/cmake-2.8.12.2.tar.gz -O /scratchbox/users/admin/home/admin/cmake.tar.gz
tee /scratchbox/users/admin/home/admin/build-cmake.sh <<EOF
#!/bin/sh
set -e
cd /home/admin
tar xzf cmake.tar.gz
cd cmake-2.8.12.2
./configure
make install
cd ..
rm -rf cmake.tar.gz cmake-2.8.12.2
EOF

chmod +x /scratchbox/users/admin/home/admin/build-cmake.sh
/scratchbox/login /home/admin/build-cmake.sh

wget https://github.com/dos1/SDL-mirror/archive/maemo5.zip -O /scratchbox/users/admin/home/admin/sdl2.zip

tee /scratchbox/users/admin/home/admin/build-sdl2.sh <<EOF
#!/bin/sh
set -e
cd /home/admin
unzip sdl2.zip
cd SDL-mirror-maemo5
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DEXTRA_CFLAGS="-mfpu=neon" -DVIDEO_X11_XINERAMA=OFF
make -j3
make install
cd ../..
rm -rf SDL-mirror-maemo5 sdl2.zip build-sdl2.sh
EOF

chmod +x /scratchbox/users/admin/home/admin/build-sdl2.sh
/scratchbox/login /home/admin/build-sdl2.sh

wget https://github.com/dos1/allegro5/archive/maemo5.zip -O /scratchbox/users/admin/home/admin/allegro5.zip

tee /scratchbox/users/admin/home/admin/build-allegro5.sh << EOF
#/bin/sh
set -e
cd /home/admin
unzip allegro5.zip
cd allegro5-maemo5
mkdir -p build
cd build
CFLAGS="-mfpu=neon" cmake .. -DALLEGRO_SDL=yes -DWANT_DEMO=no -DWANT_EXAMPLES=no
make -j3
make install
cd ../..
rm -rf allegro5-maemo5 allegro5.zip build-allegro5.sh
EOF

chmod +x /scratchbox/users/admin/home/admin/build-allegro5.sh
/scratchbox/login /home/admin/build-allegro5.sh
