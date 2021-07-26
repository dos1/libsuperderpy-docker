FROM devkitpro/devkita64

RUN apt-get update && apt-get -y full-upgrade && apt-get install -y cmake ninja-build git pkg-config wget zip file vorbis-tools opus-tools graphicsmagick-imagemagick-compat webp
RUN dkp-pacman -Syu --noconfirm && dkp-pacman -S --noconfirm devkitpro-pkgbuild-helpers

ADD do_autotools do_make do_cmake /usr/local/bin/
ADD switch.toolchain /


RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libwebp-1.2.0.tar.gz && tar xzf libwebp-1.2.0.tar.gz && cd libwebp-1.2.0 && do_cmake -DWEBP_BUILD_ANIM_UTILS=OFF -DWEBP_BUILD_CWEBP=OFF -DWEBP_BUILD_DWEBP=OFF -DWEBP_BUILD_GIF2WEBP=OFF -DWEBP_BUILD_IMG2WEBP=OFF -DWEBP_BUILD_VWEBP=OFF -DWEBP_BUILD_WEBPINFO=OFF -DWEBP_BUILD_WEBPMUX=OFF -DWEBP_BUILD_EXTRAS=OFF && rm -rf /deps

#RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/physfs-3.0.2.tar.bz2 && tar xBf physfs-3.0.2.tar.bz2 && cd physfs-3.0.2 && do_cmake -DPHYSFS_BUILD_SHARED=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/dumb-2.0.3-p1.tar.gz && tar xzf dumb-2.0.3-p1.tar.gz && cd dumb-2.0.3 && do_cmake -DBUILD_ALLEGRO4=off -DBUILD_EXAMPLES=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.7.0-p1.tar.gz && tar xzf allegro-5.2.7.0-p1.tar.gz && cd allegro-5.2.7.0 && do_cmake -DWANT_EXAMPLES=OFF -DWANT_DEMO=OFF -DALLEGRO_SDL=ON -DPREFER_STATIC_DEPS=ON -DSHARED=OFF -DALLEGRO_HAVE_STRERROR_S= -DALLEGRO_LITTLE_ENDIAN=ON -DTTF_COMPILES_WITH_EXTRA_DEPS=on -DSDL2_INCLUDE_DIR=/opt/devkitpro/portlibs/switch/include/SDL2 && rm -rf /deps

#RUN mkdir /deps && cd /deps && wget https://github.com/dos1/allegro5/archive/dos-work.tar.gz && tar xzf dos-work.tar.gz && cd allegro5-dos-work && do_cmake -DWANT_EXAMPLES=OFF -DWANT_DEMO=OFF -DALLEGRO_SDL=ON -DPREFER_STATIC_DEPS=ON -DSHARED=OFF -DALLEGRO_HAVE_STRERROR_S= -DALLEGRO_LITTLE_ENDIAN=ON && rm -rf /deps
