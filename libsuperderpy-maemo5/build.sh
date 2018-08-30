#!/bin/sh
set -e

UUID=`uuid`

docker build build -t libsuperderpy-maemo5-temporary:latest
docker run --privileged --name="libsuperderpy-maemo5-build-$UUID" libsuperderpy-maemo5-temporary:latest /home/admin/build-deps.sh
docker commit libsuperderpy-maemo5-build-$UUID libsuperderpy-maemo5-temporary:latest
docker build . -t dosowisko/libsuperderpy-maemo5:latest
docker rm libsuperderpy-maemo5-build-$UUID
docker rmi libsuperderpy-maemo5-temporary:latest
