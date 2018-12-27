FROM trzeci/emscripten
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y full-upgrade && apt-get install -y ninja-build pkg-config git zip

ADD do_autotools do_cmake do_make /usr/bin/
ENV PKG_CONFIG_PATH=/emsdk_portable/sdk/system/lib/pkgconfig

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/zlib-1.2.11.tar.gz && tar xzf zlib-1.2.11.tar.gz && cd zlib-1.2.11 && do_cmake && rm -rf /deps

# Shared lib disabled, as it fails to build under this NDK
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libpng-1.6.36.tar.gz && tar xzf libpng-1.6.36.tar.gz && cd libpng-1.6.36 && do_cmake -DPNG_SHARED=OFF -DM_LIBRARY= && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/bzip2-1.0.6.tar.gz && tar xzf bzip2-1.0.6.tar.gz && cd bzip2-1.0.6 && do_make && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/dumb-2.0.3-p1.tar.gz && tar xzf dumb-2.0.3-p1.tar.gz && cd dumb-2.0.3 && do_cmake -DBUILD_ALLEGRO4=off -DBUILD_EXAMPLES=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libjpeg-turbo-2.0.1.tar.gz && tar xzf libjpeg-turbo-2.0.1.tar.gz && cd libjpeg-turbo-2.0.1 && do_cmake -DWITH_JPEG8=on -DWITH_SIMD=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libogg-1.3.3.tar.gz && tar xzf libogg-1.3.3.tar.gz && cd libogg-1.3.3 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libvorbis-1.3.6.tar.gz && tar xzf libvorbis-1.3.6.tar.gz && cd libvorbis-1.3.6 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libtheora-1.1.1-p1.tar.bz2 && tar xBf libtheora-1.1.1-p1.tar.bz2 && cd libtheora-1.1.1 && do_autotools --disable-examples --disable-asm && make -j3 install && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/flac-1.3.2.tar.xz && tar xJf flac-1.3.2.tar.xz && cd flac-1.3.2 && do_autotools --host=asmjs-unknown-none --disable-asm-optimizations --disable-cpplibs && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opus-1.3.tar.gz && tar xzf opus-1.3.tar.gz && cd opus-1.3 && do_autotools --disable-intrinsics && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opusfile-0.11.tar.gz && tar xzf opusfile-0.11.tar.gz && cd opusfile-0.11 && do_autotools --disable-http && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libwebp-1.0.1.tar.gz && tar xzf libwebp-1.0.1.tar.gz && cd libwebp-1.0.1 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/physfs-3.0.1.tar.bz2 && tar xBf physfs-3.0.1.tar.bz2 && cd physfs-3.0.1 && do_cmake && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.9.1.tar.gz && tar xzf freetype-2.9.1.tar.gz && cd freetype-2.9.1 && do_cmake -DCMAKE_DISABLE_FIND_PACKAGE_ZLIB=ON -DCMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=ON -DCMAKE_DISABLE_FIND_PACKAGE_PNG=ON -DCMAKE_DISABLE_FIND_PACKAGE_BZip2=ON && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/harfbuzz-2.3.0.tar.bz2 && tar xBf harfbuzz-2.3.0.tar.bz2 && cd harfbuzz-2.3.0 && do_cmake -DHB_HAVE_FREETYPE=ON && rm -rf /deps

# and freetype again, now with harfbuzz support
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.9.1.tar.gz && tar xzf freetype-2.9.1.tar.gz && cd freetype-2.9.1 && do_cmake -DFT_WITH_ZLIB=ON -DFT_WITH_BZIP2=ON -DFT_WITH_PNG=ON -DFT_WITH_HARFBUZZ=ON && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/SDL2-2.0.9-p1.tar.gz && tar xzf SDL2-2.0.9-p1.tar.gz && cd SDL2-2.0.9 && do_cmake && rm -rf /deps

ADD https://github.com/dos1/allegro5/archive/dos.tar.gz /deps/
# for some reason, Allegro's cmake needs to be run twice with emscripten
# TODO: try to get Allegro to output already linked .so files
RUN cd /deps && tar xzf dos.tar.gz && cd allegro5-dos && (do_cmake -DVORBIS_COMPILES=yes -DTTF_COMPILES=yes -DWANT_EXAMPLES=no -DWANT_MONOLITH=yes -DEMSCRIPTEN_GENERATE_BITCODE_STATIC_LIBRARIES=yes || true) && do_cmake -DVORBIS_COMPILES=yes -DTTF_COMPILES=yes -DWANT_EXAMPLES=no -DWANT_MONOLITH=yes -DEMSCRIPTEN_GENERATE_BITCODE_STATIC_LIBRARIES=yes && rm -rf /deps

RUN cd $EMSCRIPTEN/system/lib && emcc liballegro_monolith-static.bc libpng.a libz.a libogg.a libvorbisfile.a libvorbis.a libopusfile.a libopus.a libSDL2.a libSDL2main.a libphysfs.a libtheoradec.a libFLAC.a libfreetype.a libharfbuzz.a libjpeg.a libwebp.a -o allegro5.so
