#!/bin/sh
set -e

sudo /scratchbox/sbin/sbox_ctl start
sb-conf select FREMANTLE_ARMEL
sudo /scratchbox/sbin/sbox_sync

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
rm -rf cmake.tar.gz cmake-2.8.12.2 build-cmake.sh
EOF

chmod +x /scratchbox/users/admin/home/admin/build-cmake.sh
/scratchbox/login /home/admin/build-cmake.sh
rm /home/admin/build-cmake.sh
