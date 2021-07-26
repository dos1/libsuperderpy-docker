FROM dosowisko/steam-runtime-i386:latest
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y install zip tar gzip git libdumb1-dev libphysfs-dev libenet-dev ninja-build libopusfile-dev libopus-dev vorbis-tools graphicsmagick-imagemagick-compat webp && apt-get clean

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libwebp-1.2.0.tar.gz && tar xzf libwebp-1.2.0.tar.gz && cd libwebp-1.2.0 && mkdir build && cd build && cmake .. -GNinja -DWEBP_BUILD_ANIM_UTILS=OFF -DWEBP_BUILD_CWEBP=OFF -DWEBP_BUILD_DWEBP=OFF -DWEBP_BUILD_GIF2WEBP=OFF -DWEBP_BUILD_IMG2WEBP=OFF -DWEBP_BUILD_VWEBP=OFF -DWEBP_BUILD_WEBPINFO=OFF -DWEBP_BUILD_WEBPMUX=OFF -DWEBP_BUILD_EXTRAS=OFF && ninja && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.7.0-p1.tar.gz && tar xzf allegro-5.2.7.0-p1.tar.gz && cd allegro-5.2.7.0 && mkdir build && cd build && cmake -G Ninja .. -DWANT_DEMO=no -DWANT_EXAMPLES=no -DWANT_PHYSFS=no && ninja && ninja install && rm -rf /deps

ENV NO_STEAM_RUNTIME 1
