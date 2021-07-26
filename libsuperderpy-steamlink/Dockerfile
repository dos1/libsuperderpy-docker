FROM debian:buster
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y full-upgrade && apt-get install -y ninja-build pkg-config cmake zip git wget python2.7 vorbis-tools opus-tools graphicsmagick-imagemagick-compat webp && ln -s /usr/bin/python2.7 /usr/bin/python2

ENV MARVELL_SDK_PATH=/steamlink-sdk PKG_CONFIG_PATH=$MARVELL_SDK_PATH/rootfs/usr/lib/pkgconfig

# new toolchain from 609d4aaccb503298e7fa9cef45e0ddc4c4afd63c breaks static libs for some reason
RUN cd / && wget https://dosowisko.net/libsuperderpy/deps/steamlink-sdk-2f692bf.tar.gz && tar xzf steamlink-sdk-2f692bf.tar.gz && mv steamlink-sdk-2f692bf8ecef0615d8e99d892a3810ddf569eebc $MARVELL_SDK_PATH && rm steamlink-sdk-2f692bf.tar.gz

ADD do_autotools do_cmake do_make /usr/bin/

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/zlib-1.2.11.tar.gz && tar xzf zlib-1.2.11.tar.gz && cd zlib-1.2.11 && do_cmake -DCMAKE_INSTALL_PREFIX=$MARVELL_SDK_PATH/rootfs && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libpng-1.6.37.tar.gz && tar xzf libpng-1.6.37.tar.gz && cd libpng-1.6.37 && do_cmake -DPNG_SHARED=OFF && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/bzip2-1.0.8.tar.gz && tar xzf bzip2-1.0.8.tar.gz && cd bzip2-1.0.8 && do_make && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/dumb-2.0.3-p1.tar.gz && tar xzf dumb-2.0.3-p1.tar.gz && cd dumb-2.0.3 && do_cmake -DBUILD_ALLEGRO4=off -DBUILD_EXAMPLES=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libjpeg-turbo-2.1.0.tar.gz && tar xzf libjpeg-turbo-2.1.0.tar.gz && cd libjpeg-turbo-2.1.0 && do_cmake -DWITH_JPEG8=on -DENABLE_SHARED=OFF -DWITH_SIMD=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libogg-1.3.5.tar.gz && tar xzf libogg-1.3.5.tar.gz && cd libogg-1.3.5 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libvorbis-1.3.7.tar.gz && tar xzf libvorbis-1.3.7.tar.gz && cd libvorbis-1.3.7 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libtheora-1.1.1-p1.tar.bz2 && tar xBf libtheora-1.1.1-p1.tar.bz2 && cd libtheora-1.1.1 && do_autotools --disable-examples && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/flac-1.3.3.tar.xz && tar xJf flac-1.3.3.tar.xz && cd flac-1.3.3 && do_autotools --disable-cpplibs --with-ogg=$MARVELL_SDK_PATH/rootfs && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opus-1.3.1.tar.gz && tar xzf opus-1.3.1.tar.gz && cd opus-1.3.1 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opusfile-0.12.tar.gz && tar xzf opusfile-0.12.tar.gz && cd opusfile-0.12 && do_autotools --disable-http && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libwebp-1.2.0.tar.gz && tar xzf libwebp-1.2.0.tar.gz && cd libwebp-1.2.0 && do_cmake -DCMAKE_C_STANDARD=11 && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/physfs-3.0.2.tar.bz2 && tar xBf physfs-3.0.2.tar.bz2 && cd physfs-3.0.2 && do_cmake -DPHYSFS_BUILD_SHARED=off -DPHYSFS_BUILD_TEST=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.11.0.tar.gz && tar xzf freetype-2.11.0.tar.gz && cd freetype-2.11.0 && do_cmake -DCMAKE_DISABLE_FIND_PACKAGE_ZLIB=ON -DCMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=ON -DCMAKE_DISABLE_FIND_PACKAGE_PNG=ON -DCMAKE_DISABLE_FIND_PACKAGE_BZip2=ON && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/harfbuzz-2.6.7.tar.xz && tar xf harfbuzz-2.6.7.tar.xz && cd harfbuzz-2.6.7 && do_cmake -DHB_HAVE_FREETYPE=ON && rm -rf /deps

# and freetype again, now with harfbuzz support
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.11.0.tar.gz && tar xzf freetype-2.11.0.tar.gz && cd freetype-2.11.0 && do_cmake -DFT_WITH_ZLIB=ON -DFT_WITH_BZIP2=ON -DFT_WITH_PNG=ON -DFT_WITH_HARFBUZZ=ON && rm -rf /deps

# Steam Link platform uses SDL2 from SDK

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.7.0-p1.tar.gz && tar xzf allegro-5.2.7.0-p1.tar.gz && cd allegro-5.2.7.0 && do_cmake -DWANT_EXAMPLES=OFF -DWANT_DEMO=OFF -DFREETYPE_ZLIB=ON -DFREETYPE_PNG=ON -DFREETYPE_HARFBUZZ=ON -DFREETYPE_BZIP2=ON -DPREFER_STATIC_DEPS=ON -DTTF_COMPILES_WITH_EXTRA_DEPS=ON -DALLEGRO_SDL=ON && rm -rf /deps
