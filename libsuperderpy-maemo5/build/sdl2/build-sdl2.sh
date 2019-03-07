#!/bin/sh
set -e

sudo /scratchbox/sbin/sbox_ctl start
sb-conf select FREMANTLE_ARMEL
sudo /scratchbox/sbin/sbox_sync

wget https://dosowisko.net/libsuperderpy/deps/SDL2-2.0.9-p2.tar.gz -O /scratchbox/users/admin/home/admin/sdl2.tar.gz

tee /scratchbox/users/admin/home/admin/build-sdl2.sh <<EOF
#!/bin/sh
set -e
cd /home/admin
tar xzf sdl2.tar.gz
cd SDL2-2.0.9
cat ../SDL2-patches/*.patch | patch -p1
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DEXTRA_CFLAGS="-mfpu=neon -DGLchar=char -DEGLAttrib=intptr_t" -DVIDEO_X11_XINERAMA=OFF
make -j3
make install
cd ../..
rm -rf SDL2-2.0.9 sdl2.tar.gz build-sdl2.sh
EOF

chmod +x /scratchbox/users/admin/home/admin/build-sdl2.sh
/scratchbox/login /home/admin/build-sdl2.sh
sudo rm -rf /home/admin/build-sdl2.sh
sudo rm -rf /scratchbox/users/admin/home/admin/SDL2-patches
