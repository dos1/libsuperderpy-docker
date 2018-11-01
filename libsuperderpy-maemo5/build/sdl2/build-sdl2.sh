#!/bin/sh
set -e

sudo /scratchbox/sbin/sbox_ctl start
sb-conf select FREMANTLE_ARMEL
sudo /scratchbox/sbin/sbox_sync

wget https://github.com/dos1/SDL-mirror/archive/maemo5.zip -O /scratchbox/users/admin/home/admin/sdl2.zip

tee /scratchbox/users/admin/home/admin/build-sdl2.sh <<EOF
#!/bin/sh
set -e
cd /home/admin
unzip sdl2.zip
cd SDL-mirror-maemo5
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DEXTRA_CFLAGS="-mfpu=neon -DGLchar=char -DEGLAttrib=intptr_t" -DVIDEO_X11_XINERAMA=OFF
make -j3
make install
cd ../..
rm -rf SDL-mirror-maemo5 sdl2.zip build-sdl2.sh
EOF

chmod +x /scratchbox/users/admin/home/admin/build-sdl2.sh
/scratchbox/login /home/admin/build-sdl2.sh
rm /home/admin/build-sdl2.sh

