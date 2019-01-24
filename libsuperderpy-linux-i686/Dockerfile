FROM dosowisko/steam-runtime-i386:latest
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y install zip tar gzip git libdumb1-dev libphysfs-dev libenet-dev ninja-build libopusfile-dev libopus-dev vorbis-tools graphicsmagick-imagemagick-compat webp && apt-get clean

ADD https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2.tar.gz /cmake-3.13.2.tar.gz
RUN cd / && tar xzf cmake-3.13.2.tar.gz && cd /cmake-3.13.2 && ./configure && make -j3 && make install && cd / && rm -rf /cmake-3.13.2

ADD https://github.com/webmproject/libwebp/archive/v1.0.1.tar.gz /libwebp-1.0.1.tar.gz
RUN cd / && tar xzf libwebp-1.0.1.tar.gz && cd /libwebp-1.0.1 && mkdir build && cd build && cmake -G Ninja .. && ninja && ninja install && cd / && rm -rf /libwebp-*

ADD https://github.com/liballeg/allegro5/releases/download/5.2.4.0/allegro-5.2.4.0.tar.gz /allegro-5.2.4.0.tar.gz
RUN cd / && tar xzf allegro-5.2.4.0.tar.gz && cd /allegro-5.2.4.0 && mkdir build && cd build && cmake -G Ninja .. -DWANT_DEMO=no -DWANT_EXAMPLES=no && ninja && ninja install && cd / && rm -rf /allegro-*

ENV NO_STEAM_RUNTIME 1
