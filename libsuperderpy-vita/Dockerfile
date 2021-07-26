FROM debian:bullseye

ADD do_cmake /usr/local/bin/
ADD vita.toolchain /

RUN apt-get update && apt-get -y full-upgrade && apt-get install -y ninja-build pkg-config netcat lftp pngquant zip vorbis-tools opus-tools graphicsmagick-imagemagick-compat webp autoconf libtool libarchive-tools sudo wget curl make git xz-utils python ca-certificates gnupg cmake fakeroot

ENV VITASDK /usr/local/vitasdk
ENV PATH ${PATH}:${VITASDK}/bin

RUN mkdir /deps && cd /deps && git clone https://github.com/vitasdk/vdpm && cd vdpm && git checkout b3977178f88e6d2447257b55c01cd421759d5647 && ./bootstrap-vitasdk.sh && ./install-all.sh && rm -rf /deps

# patch vita-makepkg to allow running as root
RUN sed -i 's/EUID == 0/EUID == -1/' /usr/local/vitasdk/bin/vita-makepkg

# TODO: drop once https://github.com/vitasdk/vdpm/pull/74 is merged
RUN vdpm libtheora

# TODO: drop once https://github.com/vitasdk/packages/pull/145 is merged
RUN mkdir /deps && cd /deps && wget https://raw.githubusercontent.com/vitasdk/packages/036b201bcd50928700066ecbe328c5130f14d974/libwebp/VITABUILD && vita-makepkg && vdpm libwebp-1.2.0-2-arm.tar.xz && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/dumb-2.0.3-p1.tar.gz && tar xzf dumb-2.0.3-p1.tar.gz && cd dumb-2.0.3 && do_cmake -DBUILD_ALLEGRO4=OFF -DBUILD_EXAMPLES=OFF && rm -rf /deps

# TODO: switch to SDL 2.0.16 once released
RUN mkdir /deps && cd /deps && wget https://github.com/libsdl-org/SDL/archive/c0601d0123808fce91519b34b12f5c06769cf3ff.tar.gz && tar xzf c0601d0123808fce91519b34b12f5c06769cf3ff.tar.gz && cd SDL-c0601d0123808fce91519b34b12f5c06769cf3ff && do_cmake -DVIDEO_VITA_PIB=ON && rm -rf /deps

# TODO: drop SDL2_INCLUDE_DIR once https://github.com/libsdl-org/SDL/pull/4502 is merged
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.7.0-p1.tar.gz && tar xzf allegro-5.2.7.0-p1.tar.gz && cd allegro-5.2.7.0 && do_cmake -DALLEGRO_SDL=on -DTTF_COMPILES_WITH_EXTRA_DEPS=on -DSDL2_INCLUDE_DIR=$VITASDK/arm-vita-eabi/include/SDL2 -DWANT_DEMO=OFF -DWANT_EXAMPLES=OFF -DWANT_TESTS=OFF && rm -rf /deps
