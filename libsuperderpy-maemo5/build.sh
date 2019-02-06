#!/bin/sh
set -e

# TODO: mount a directory with scripts as a volume instead of creating temporary images

UUID=`uuid`

docker build build/deps -t libsuperderpy-maemo5-deps-temporary:latest
docker run -it --privileged --name="libsuperderpy-maemo5-deps-build-$UUID" libsuperderpy-maemo5-deps-temporary:latest /home/admin/install-deps.sh
docker commit libsuperderpy-maemo5-deps-build-$UUID dosowisko/libsuperderpy-maemo5-deps:latest
docker rm libsuperderpy-maemo5-deps-build-$UUID
docker rmi libsuperderpy-maemo5-deps-temporary:latest

docker build build/cmake -t libsuperderpy-maemo5-cmake-temporary:latest
docker run -it --privileged --name="libsuperderpy-maemo5-cmake-build-$UUID" libsuperderpy-maemo5-cmake-temporary:latest /home/admin/build-cmake.sh
docker commit libsuperderpy-maemo5-cmake-build-$UUID dosowisko/libsuperderpy-maemo5-cmake:latest
docker rm libsuperderpy-maemo5-cmake-build-$UUID
docker rmi libsuperderpy-maemo5-cmake-temporary:latest

docker build build/sdl2 -t libsuperderpy-maemo5-sdl2-temporary:latest
docker run -it --privileged --name="libsuperderpy-maemo5-sdl2-build-$UUID" libsuperderpy-maemo5-sdl2-temporary:latest /home/admin/build-sdl2.sh
docker commit libsuperderpy-maemo5-sdl2-build-$UUID dosowisko/libsuperderpy-maemo5-sdl2:latest
docker rm libsuperderpy-maemo5-sdl2-build-$UUID
docker rmi libsuperderpy-maemo5-sdl2-temporary:latest

docker build build/allegro5 -t libsuperderpy-maemo5-allegro5-temporary:latest
docker run -it --privileged --name="libsuperderpy-maemo5-allegro5-build-$UUID" libsuperderpy-maemo5-allegro5-temporary:latest /home/admin/build-allegro5.sh
docker commit libsuperderpy-maemo5-allegro5-build-$UUID dosowisko/libsuperderpy-maemo5-allegro5:latest
docker rm libsuperderpy-maemo5-allegro5-build-$UUID
docker rmi libsuperderpy-maemo5-allegro5-temporary:latest

docker build . -t dosowisko/libsuperderpy-maemo5:latest
