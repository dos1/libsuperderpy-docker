FROM debian:stretch
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y full-upgrade && apt-get install -y ninja-build pkg-config cmake zip git wget python2.7 vorbis-tools opus-tools graphicsmagick-imagemagick-compat webp && ln -s /usr/bin/python2.7 /usr/bin/python2

ENV MARVELL_SDK_PATH=/steamlink-sdk PKG_CONFIG_PATH=$MARVELL_SDK_PATH/rootfs/usr/lib/pkgconfig

RUN cd / && wget https://github.com/ValveSoftware/steamlink-sdk/archive/master.tar.gz && tar xzf master.tar.gz && mv steamlink-sdk-master $MARVELL_SDK_PATH && rm master.tar.gz && echo "set(CMAKE_SYSTEM_PROCESSOR \"armv7a\")" >> $MARVELL_SDK_PATH/toolchain/steamlink-toolchain.cmake

ADD do_autotools do_cmake do_make /usr/bin/

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/zlib-1.2.11.tar.gz && tar xzf zlib-1.2.11.tar.gz && cd zlib-1.2.11 && do_cmake -DCMAKE_INSTALL_PREFIX=$MARVELL_SDK_PATH/rootfs && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libpng-1.6.36.tar.gz && tar xzf libpng-1.6.36.tar.gz && cd libpng-1.6.36 && do_cmake -DPNG_SHARED=OFF && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/bzip2-1.0.6.tar.gz && tar xzf bzip2-1.0.6.tar.gz && cd bzip2-1.0.6 && do_make && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/dumb-2.0.3-p1.tar.gz && tar xzf dumb-2.0.3-p1.tar.gz && cd dumb-2.0.3 && do_cmake -DBUILD_ALLEGRO4=off -DBUILD_EXAMPLES=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libjpeg-turbo-2.0.1.tar.gz && tar xzf libjpeg-turbo-2.0.1.tar.gz && cd libjpeg-turbo-2.0.1 && do_cmake -DWITH_JPEG8=on -DENABLE_SHARED=OFF -DWITH_SIMD=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libogg-1.3.3.tar.gz && tar xzf libogg-1.3.3.tar.gz && cd libogg-1.3.3 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libvorbis-1.3.6.tar.gz && tar xzf libvorbis-1.3.6.tar.gz && cd libvorbis-1.3.6 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libtheora-1.1.1-p1.tar.bz2 && tar xBf libtheora-1.1.1-p1.tar.bz2 && cd libtheora-1.1.1 && do_autotools --disable-examples && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/flac-1.3.2.tar.xz && tar xJf flac-1.3.2.tar.xz && cd flac-1.3.2 && do_autotools --disable-cpplibs --with-ogg=$MARVELL_SDK_PATH/rootfs && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opus-1.3.tar.gz && tar xzf opus-1.3.tar.gz && cd opus-1.3 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opusfile-0.11.tar.gz && tar xzf opusfile-0.11.tar.gz && cd opusfile-0.11 && do_autotools --disable-http && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libwebp-1.0.1.tar.gz && tar xzf libwebp-1.0.1.tar.gz && cd libwebp-1.0.1 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/physfs-3.0.1.tar.bz2 && tar xBf physfs-3.0.1.tar.bz2 && cd physfs-3.0.1 && do_cmake -DPHYSFS_BUILD_SHARED=off -DPHYSFS_BUILD_TEST=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.9.1.tar.gz && tar xzf freetype-2.9.1.tar.gz && cd freetype-2.9.1 && do_cmake -DCMAKE_DISABLE_FIND_PACKAGE_ZLIB=ON -DCMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=ON -DCMAKE_DISABLE_FIND_PACKAGE_PNG=ON -DCMAKE_DISABLE_FIND_PACKAGE_BZip2=ON && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/harfbuzz-2.3.0.tar.bz2 && tar xBf harfbuzz-2.3.0.tar.bz2 && cd harfbuzz-2.3.0 && do_cmake -DHB_HAVE_FREETYPE=ON && rm -rf /deps

# and freetype again, now with harfbuzz support
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.9.1.tar.gz && tar xzf freetype-2.9.1.tar.gz && cd freetype-2.9.1 && do_cmake -DFT_WITH_ZLIB=ON -DFT_WITH_BZIP2=ON -DFT_WITH_PNG=ON -DFT_WITH_HARFBUZZ=ON && rm -rf /deps

# Steam Link platform uses SDL2 from SDK

#ADD https://github.com/dos1/allegro5/archive/dos.tar.gz /deps/
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.5.0-p2.tar.gz && tar xzf allegro-5.2.5.0-p2.tar.gz && cd allegro-5.2.5.0 && do_cmake -DWANT_EXAMPLES=OFF -DWANT_DEMO=OFF -DFREETYPE_ZLIB=ON -DFREETYPE_PNG=ON -DFREETYPE_HARFBUZZ=ON -DFREETYPE_BZIP2=ON -DPREFER_STATIC_DEPS=ON -DTTF_COMPILES_WITH_EXTRA_DEPS=ON -DALLEGRO_SDL=ON && rm -rf /deps
