FROM trzeci/emscripten
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y full-upgrade && apt-get install -y ninja-build pkg-config

ADD https://www.zlib.net/zlib-1.2.11.tar.gz /deps/
RUN cd /deps && tar xzf zlib-1.2.11.tar.gz && cd zlib-1.2.11 && emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system && cmake --build build --target install && rm -rf /deps

ADD https://downloads.sourceforge.net/project/libpng/libpng16/1.6.36/libpng-1.6.36.tar.gz /deps/
RUN cd /deps && tar xzf libpng-1.6.36.tar.gz && cd libpng-1.6.36 && emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system -DCMAKE_PREFIX_PATH=/emsdk_portable/sdk/system -DM_LIBRARY= && cmake --build build --target install && rm -rf /deps

# Latest stable so far, 2.0.3, doesn't have a fix needed to build under Emscripten.
# This revision doesn't differ much from stable though, it's pretty much "a buildable 2.0.3".
ADD https://github.com/kode54/dumb/archive/396caa4d31859045ccb5ef943fd430ca4026cce8.tar.gz /deps/
RUN cd /deps && tar xzf 396caa4d31859045ccb5ef943fd430ca4026cce8.tar.gz && cd dumb-396caa4d31859045ccb5ef943fd430ca4026cce8 && emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system -DBUILD_ALLEGRO4=off -DBUILD_EXAMPLES=off && cmake --build build --target install && rm -rf /deps

ADD https://downloads.sourceforge.net/project/libjpeg-turbo/2.0.1/libjpeg-turbo-2.0.1.tar.gz /deps/
RUN cd /deps && tar xzf libjpeg-turbo-2.0.1.tar.gz && cd libjpeg-turbo-2.0.1 && emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system -DENABLE_SHARED=off -DWITH_JPEG8=on -DWITH_SIMD=off && cmake --build build --target install && rm -rf /deps

ADD http://downloads.xiph.org/releases/ogg/libogg-1.3.3.tar.gz /deps/
RUN cd /deps && tar xzf libogg-1.3.3.tar.gz && cd libogg-1.3.3 && emconfigure ./configure --prefix=/emsdk_portable/sdk/system && make -j3 install && rm -rf /deps

ADD http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.6.tar.gz /deps/
RUN cd /deps && tar xzf libvorbis-1.3.6.tar.gz && cd libvorbis-1.3.6 && emconfigure ./configure --prefix=/emsdk_portable/sdk/system && make -j3 install && rm -rf /deps

ADD http://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.bz2 /deps/
RUN cd /deps && tar xBf libtheora-1.1.1.tar.bz2 && cd libtheora-1.1.1 && emconfigure ./configure --prefix=/emsdk_portable/sdk/system --disable-asm && make -j3 install && rm -rf /deps

ADD http://downloads.xiph.org/releases/flac/flac-1.3.2.tar.xz /deps/
RUN cd /deps && tar xJf flac-1.3.2.tar.xz && cd flac-1.3.2 && emconfigure ./configure --prefix=/emsdk_portable/sdk/system --host=asmjs --disable-asm-optimizations && make -j3 install && rm -rf /deps

ADD https://archive.mozilla.org/pub/opus/opus-1.3.tar.gz /deps/
RUN cd /deps && tar xzf opus-1.3.tar.gz && cd opus-1.3 && emconfigure ./configure --prefix=/emsdk_portable/sdk/system --disable-intrinsics && make -j3 install && rm -rf /deps

ADD https://archive.mozilla.org/pub/opus/opusfile-0.9.tar.gz /deps/
RUN cd /deps && tar xzf opusfile-0.9.tar.gz && cd opusfile-0.9 && emconfigure ./configure --prefix=/emsdk_portable/sdk/system --disable-http && make -j3 install && rm -rf /deps

ADD https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.0.1.tar.gz /deps/
RUN cd /deps && tar xzf libwebp-1.0.1.tar.gz && cd libwebp-1.0.1 && emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system -DCMAKE_PREFIX_PATH=/emsdk_portable/sdk/system && cmake --build build --target install && rm -rf /deps

ADD https://icculus.org/physfs/downloads/physfs-3.0.1.tar.bz2 /deps/
RUN cd /deps && tar xBf physfs-3.0.1.tar.bz2 && cd physfs-3.0.1 && emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system && cmake --build build --target install && rm -rf /deps

ADD https://download.savannah.gnu.org/releases/freetype/freetype-2.9.tar.gz /deps/
RUN cd /deps && tar xzf freetype-2.9.tar.gz && cd freetype-2.9 && emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system && cmake --build build --target install && rm -rf /deps

ADD https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.3.0.tar.bz2 /deps/
RUN cd /deps && tar xBf harfbuzz-2.3.0.tar.bz2 && cd harfbuzz-2.3.0 && emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system -DCMAKE_PREFIX_PATH=/emsdk_portable/sdk/system -DHB_HAVE_FREETYPE=ON && cmake --build build --target install && rm -rf /deps

# and freetype again, now with harfbuzz support
ADD https://download.savannah.gnu.org/releases/freetype/freetype-2.9.tar.gz /deps/
RUN cd /deps && tar xzf freetype-2.9.tar.gz && cd freetype-2.9 && emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system -DHARFBUZZ_INCLUDE_DIRS=/emsdk_portable/sdk/system/include/harfbuzz -DHARFBUZZ_LIBRARIES=/emsdk_portable/sdk/system/lib/libharfbuzz.a && cmake --build build --target install && rm -rf /deps

ADD https://libsdl.org/release/SDL2-2.0.9.tar.gz /deps/
# apply emscripten patches from after release
ADD https://hg.libsdl.org/SDL/raw-rev/0ae268b6ddf0 /deps/0ae268b6ddf0.patch
ADD https://hg.libsdl.org/SDL/raw-rev/9bae6554dd3e /deps/9bae6554dd3e.patch
RUN cd /deps && tar xzf SDL2-2.0.9.tar.gz && cd SDL2-2.0.9 && patch -p1 < ../0ae268b6ddf0.patch && patch -p1 < ../9bae6554dd3e.patch && emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system && cmake --build build --target install && rm -rf /deps

ADD https://github.com/dos1/allegro5/archive/dos.tar.gz /deps/
# for some reason, Allegro's cmake needs to be run twice
# TODO: try to get Allegro to output .so files
RUN cd /deps && tar xzf dos.tar.gz && cd allegro5-dos && (emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system -DCMAKE_PREFIX_PATH=/emsdk_portable/sdk/system -DVORBIS_COMPILES=yes -DTTF_COMPILES=yes -DWANT_EXAMPLES=no -DWANT_MONOLITH=yes -DEMSCRIPTEN_GENERATE_BITCODE_STATIC_LIBRARIES=yes || true) && emcmake cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_INSTALL_PREFIX=/emsdk_portable/sdk/system -DCMAKE_PREFIX_PATH=/emsdk_portable/sdk/system -DVORBIS_COMPILES=yes -DTTF_COMPILES=yes -DWANT_EXAMPLES=no -DWANT_MONOLITH=yes -DEMSCRIPTEN_GENERATE_BITCODE_STATIC_LIBRARIES=yes && cmake --build build --target install && rm -rf /deps

RUN cd $EMSCRIPTEN/system/lib && emcc liballegro_monolith-static.bc libpng.a libz.a libogg.a libvorbisfile.a libvorbis.a libopusfile.a libopus.a libSDL2.a libSDL2main.a libphysfs.a libtheoradec.a libFLAC.a libfreetype.a libharfbuzz.a libjpeg.a libwebp.a -o allegro5.so
