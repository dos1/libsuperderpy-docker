FROM trzeci/emscripten:1.38.47-fastcomp
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y full-upgrade && apt-get install -y ninja-build file pkg-config git zip vorbis-tools opus-tools graphicsmagick-imagemagick-compat webp autoconf libtool

ADD do_autotools do_cmake do_make /usr/bin/
ENV PKG_CONFIG_PATH=$EMSCRIPTEN/system/local

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/zlib-1.2.11.tar.gz && tar xzf zlib-1.2.11.tar.gz && cd zlib-1.2.11 && do_autotools --static && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libpng-1.6.37.tar.gz && tar xzf libpng-1.6.37.tar.gz && cd libpng-1.6.37 && do_cmake -DPNG_SHARED=OFF -DM_LIBRARY= && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/bzip2-1.0.6.tar.gz && tar xzf bzip2-1.0.6.tar.gz && cd bzip2-1.0.6 && do_make && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/dumb-2.0.3-p1.tar.gz && tar xzf dumb-2.0.3-p1.tar.gz && cd dumb-2.0.3 && do_cmake -DBUILD_ALLEGRO4=OFF -DBUILD_EXAMPLES=OFF && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libjpeg-turbo-2.0.3.tar.gz && tar xzf libjpeg-turbo-2.0.3.tar.gz && cd libjpeg-turbo-2.0.3 && do_cmake -DWITH_JPEG8=ON -DENABLE_SHARED=OFF -DWITH_SIMD=OFF && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libogg-1.3.4.tar.gz && tar xzf libogg-1.3.4.tar.gz && cd libogg-1.3.4 && do_autotools --disable-shared && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libvorbis-1.3.6.tar.gz && tar xzf libvorbis-1.3.6.tar.gz && cd libvorbis-1.3.6 && do_autotools --disable-shared && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libtheora-1.1.1-p1.tar.bz2 && tar xBf libtheora-1.1.1-p1.tar.bz2 && cd libtheora-1.1.1 && do_autotools --disable-shared --disable-examples --disable-asm && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/flac-1.3.2.tar.xz && tar xJf flac-1.3.2.tar.xz && cd flac-1.3.2 && do_autotools --host=wasm32-unknown-none --disable-shared --disable-asm-optimizations --disable-cpplibs && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opus-1.3.1.tar.gz && tar xzf opus-1.3.1.tar.gz && cd opus-1.3.1 && do_autotools --disable-shared --disable-intrinsics && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opusfile-0.11.tar.gz && tar xzf opusfile-0.11.tar.gz && cd opusfile-0.11 && do_autotools --disable-shared --disable-http && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libwebp-1.0.3.tar.gz && tar xzf libwebp-1.0.3.tar.gz && cd libwebp-1.0.3 && do_cmake -DWEBP_ENABLE_SIMD=OFF && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/physfs-3.0.2.tar.bz2 && tar xBf physfs-3.0.2.tar.bz2 && cd physfs-3.0.2 && do_cmake -DPHYSFS_BUILD_SHARED=OFF && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.10.1-p1.tar.gz && tar xzf freetype-2.10.1-p1.tar.gz && cd freetype-2.10.1 && do_cmake -DCMAKE_DISABLE_FIND_PACKAGE_ZLIB=ON -DCMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=ON -DCMAKE_DISABLE_FIND_PACKAGE_PNG=ON -DCMAKE_DISABLE_FIND_PACKAGE_BZip2=ON && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/harfbuzz-2.6.2.tar.xz && tar xf harfbuzz-2.6.2.tar.xz && cd harfbuzz-2.6.2 && do_cmake -DHB_HAVE_FREETYPE=ON -DHB_BUILD_TESTS=OFF && rm -rf /deps

# and freetype again, now with harfbuzz support
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.10.1-p1.tar.gz && tar xzf freetype-2.10.1-p1.tar.gz && cd freetype-2.10.1 && do_cmake -DFT_WITH_ZLIB=ON -DFT_WITH_BZIP2=ON -DFT_WITH_PNG=ON -DFT_WITH_HARFBUZZ=ON && rm -rf /deps

# audio doesn't work on upstream SDL2; let's use the one from emscripten-ports for now
# TODO: try upstream SDL2 2.0.10? isolate patches?
#RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/SDL2-2.0.10.tar.gz && tar xzf SDL2-2.0.10.tar.gz && cd SDL2-2.0.10 && do_cmake && rm -rf /deps
RUN mkdir /deps && cd /deps && wget https://github.com/dos1/SDL2/archive/cb36dcc15fc8a3b766f46dca1fad254f8a618dd4.tar.gz && tar xzf cb36dcc15fc8a3b766f46dca1fad254f8a618dd4.tar.gz && cd SDL2-cb36dcc15fc8a3b766f46dca1fad254f8a618dd4 && do_cmake && rm -rf /deps

#ADD https://github.com/dos1/allegro5/archive/dos.tar.gz /deps/
# TODO: try to get Allegro to output already linked .so files
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.5.0-p3.tar.gz && tar xzf allegro-5.2.5.0-p3.tar.gz && cd allegro-5.2.5.0 && do_cmake -DALLEGRO_SDL=yes -DVORBIS_COMPILES=yes -DTTF_COMPILES=yes -DWANT_EXAMPLES=no -DWANT_DEMO=no -DWANT_TESTS=no -DWANT_MONOLITH=yes -DWANT_OPENAL=no -DSHARED=no -DEMSCRIPTEN_GENERATE_BITCODE_STATIC_LIBRARIES=yes && rm -rf /deps

RUN cd $EMSCRIPTEN/system/local/lib && emcc liballegro_monolith-static.bc libSDL2main.a libSDL2.a libvorbisfile.a libvorbis.a libopusfile.a libopus.a libphysfs.a libtheoradec.a libFLAC.a libogg.a libdumb.a libfreetype.a libharfbuzz.a libfreetype.a libjpeg.a libwebp.a libpng.a libz.a libbz2.a -o allegro5.so

ADD 0001-Don-t-force-the-file-extension-to-.js-or-.wasm-when-.patch /deps/
RUN patch -p1 $EMSCRIPTEN/emcc.py < /deps/0001-Don-t-force-the-file-extension-to-.js-or-.wasm-when-.patch && rm -rf /deps

# revert https://github.com/emscripten-core/emscripten/commit/3426a347ea8d7083311d519389a40140cbe0225d until our cmake can deal with it
RUN sed -i -e 's/set_property(GLOBAL PROPERTY TARGET_SUPPORTS_SHARED_LIBS FALSE)//g' $EMSCRIPTEN/cmake/Modules/Platform/Emscripten.cmake
