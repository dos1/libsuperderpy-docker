#!/bin/sh
set -e

sudo /scratchbox/sbin/sbox_ctl start
sb-conf select FREMANTLE_ARMEL
sudo /scratchbox/sbin/sbox_sync
echo "$@" | /scratchbox/login -s
