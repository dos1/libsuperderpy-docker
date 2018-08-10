FROM jimbly/steamrt-amd64-gcc:latest
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y install cmake zip tar gzip git libdumb1-dev libphysfs-dev libenet-dev && apt-get clean

ADD https://github.com/webmproject/libwebp/archive/v1.0.0.tar.gz /libwebp-1.0.0.tar.gz
RUN cd / && tar xzf libwebp-1.0.0.tar.gz && cd /libwebp-1.0.0 && mkdir build && cd build && cmake .. && make -j2 && make install && cd / && rm -rf /libwebp-*

ADD https://github.com/liballeg/allegro5/releases/download/5.2.4.0/allegro-5.2.4.0.tar.gz /allegro-5.2.4.0.tar.gz
RUN cd / && tar xzf allegro-5.2.4.0.tar.gz && cd /allegro-5.2.4.0 && mkdir build && cd build && cmake .. -DWANT_DEMO=no -DWANT_EXAMPLES=no && make -j2 && make install && cd / && rm -rf /allegro-*
