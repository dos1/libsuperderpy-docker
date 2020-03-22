FROM dosowisko/steam-runtime-i386:latest
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y install zip tar gzip git libdumb1-dev libphysfs-dev libenet-dev ninja-build libopusfile-dev libopus-dev vorbis-tools graphicsmagick-imagemagick-compat webp && apt-get clean

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libwebp-1.1.0.tar.gz && tar xzf libwebp-1.1.0.tar.gz && cd libwebp-1.1.0 && ./configure && make install && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.6.0-p1.tar.gz && tar xzf allegro-5.2.6.0-p1.tar.gz && cd allegro-5.2.6.0 && mkdir build && cd build && cmake -G Ninja .. -DWANT_DEMO=no -DWANT_EXAMPLES=no && ninja && ninja install && rm -rf /deps

ENV NO_STEAM_RUNTIME 1
