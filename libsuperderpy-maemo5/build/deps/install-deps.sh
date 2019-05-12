#!/bin/sh
set -e

sudo /scratchbox/sbin/sbox_ctl start
sb-conf select FREMANTLE_ARMEL
sudo /scratchbox/sbin/sbox_sync

/scratchbox/login apt-get update
/scratchbox/login apt-get install -y --force-yes libopenal-dev libphysfs-dev libtheora-dev libenet-dev libflac-dev libogg-dev libvorbis-dev libwebp-dev libxss-dev

sudo rm -f /home/admin/install-deps.sh
