FROM dosowisko/libsuperderpy-android

ENV ANDROID_TOOLCHAIN /opt/android-toolchain

RUN $ANDROID_NDK_HOME/build/tools/make_standalone_toolchain.py --arch arm --api 15 --install-dir $ANDROID_TOOLCHAIN

ADD android.toolchain $ANDROID_TOOLCHAIN/
ADD do_autotools do_cmake do_make /usr/bin/

ENV PATH=${PATH}:${ANDROID_TOOLCHAIN}/bin AR=arm-linux-androideabi-ar AS=arm-linux-androideabi-clang CC=arm-linux-androideabi-clang CXX=arm-linux-androideabi-clang++ LD=arm-linux-androideabi-ld STRIP=arm-linux-androideabi-strip RANLIB=arm-linux-androideabi-ranlib ANDROID_CFLAGS="-fPIE -fPIC -mthumb -mfloat-abi=softfp -march=armv7-a" ANDROID_CXXFLAGS="-fPIE -fPIC -mthumb -mfloat-abi=softfp -march=armv7-a" ANDROID_LDFLAGS="-Wl,--fix-cortex-a8" PKG_CONFIG_PATH=$ANDROID_TOOLCHAIN/sysroot/usr/lib/pkgconfig

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/zlib-1.2.11.tar.gz && tar xzf zlib-1.2.11.tar.gz && cd zlib-1.2.11 && do_cmake && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libpng-1.6.36.tar.gz && tar xzf libpng-1.6.36.tar.gz && cd libpng-1.6.36 && do_cmake -DPNG_SHARED=OFF && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/bzip2-1.0.6.tar.gz && tar xzf bzip2-1.0.6.tar.gz && cd bzip2-1.0.6 && do_make && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/dumb-2.0.3-p1.tar.gz && tar xzf dumb-2.0.3-p1.tar.gz && cd dumb-2.0.3 && do_cmake -DBUILD_ALLEGRO4=off -DBUILD_EXAMPLES=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libjpeg-turbo-2.0.1.tar.gz && tar xzf libjpeg-turbo-2.0.1.tar.gz && cd libjpeg-turbo-2.0.1 && do_cmake -DWITH_JPEG8=on -DENABLE_SHARED=OFF && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libogg-1.3.3.tar.gz && tar xzf libogg-1.3.3.tar.gz && cd libogg-1.3.3 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libvorbis-1.3.6.tar.gz && tar xzf libvorbis-1.3.6.tar.gz && cd libvorbis-1.3.6 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libtheora-1.1.1-p1.tar.bz2 && tar xBf libtheora-1.1.1-p1.tar.bz2 && cd libtheora-1.1.1 && do_autotools --disable-examples && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/flac-1.3.2.tar.xz && tar xJf flac-1.3.2.tar.xz && cd flac-1.3.2 && do_autotools --disable-cpplibs && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opus-1.3.tar.gz && tar xzf opus-1.3.tar.gz && cd opus-1.3 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opusfile-0.11.tar.gz && tar xzf opusfile-0.11.tar.gz && cd opusfile-0.11 && do_autotools --disable-http && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libwebp-1.0.1.tar.gz && tar xzf libwebp-1.0.1.tar.gz && cd libwebp-1.0.1 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/physfs-3.0.1.tar.bz2 && tar xBf physfs-3.0.1.tar.bz2 && cd physfs-3.0.1 && do_cmake -DPHYSFS_BUILD_SHARED=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.9.1-p1.tar.gz && tar xzf freetype-2.9.1-p1.tar.gz && cd freetype-2.9.1 && do_cmake -DCMAKE_DISABLE_FIND_PACKAGE_ZLIB=ON -DCMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=ON -DCMAKE_DISABLE_FIND_PACKAGE_PNG=ON -DCMAKE_DISABLE_FIND_PACKAGE_BZip2=ON && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/harfbuzz-2.3.0.tar.bz2 && tar xBf harfbuzz-2.3.0.tar.bz2 && cd harfbuzz-2.3.0 && do_cmake -DHB_HAVE_FREETYPE=ON && rm -rf /deps

# and freetype again, now with harfbuzz support
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.9.1-p1.tar.gz && tar xzf freetype-2.9.1-p1.tar.gz && cd freetype-2.9.1 && do_cmake -DFT_WITH_ZLIB=ON -DFT_WITH_BZIP2=ON -DFT_WITH_PNG=ON -DFT_WITH_HARFBUZZ=ON && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.5.0-p2.tar.gz && tar xzf allegro-5.2.5.0-p2.tar.gz && cd allegro-5.2.5.0 && do_cmake -DWANT_EXAMPLES=OFF -DWANT_DEMO=OFF -DFREETYPE_ZLIB=ON -DFREETYPE_PNG=ON -DFREETYPE_HARFBUZZ=ON -DFREETYPE_BZIP2=ON -DPREFER_STATIC_DEPS=ON -DTTF_COMPILES_WITH_EXTRA_DEPS=ON && mkdir -p /opt/allegro5/lib && cp -r /deps/allegro-5.2.5.0/build/lib/*.aar /opt/allegro5/lib/ && rm -rf /deps

#ADD https://github.com/dos1/allegro5/archive/dos-work.tar.gz /deps/
#RUN cd /deps && tar xzf dos-work.tar.gz && cd /deps/allegro5-dos-work && do_cmake -DWANT_EXAMPLES=OFF -DWANT_DEMO=OFF -DFREETYPE_ZLIB=ON -DFREETYPE_PNG=ON -DFREETYPE_HARFBUZZ=ON -DFREETYPE_BZIP2=ON -DPREFER_STATIC_DEPS=ON -DTTF_COMPILES_WITH_EXTRA_DEPS=ON && mkdir -p /opt/allegro5/lib && cp -r /deps/allegro5-dos-work/build/lib/*.aar /opt/allegro5/lib/ && rm -rf /deps

ENV ANDROID_ALLEGRO_ROOT /opt/allegro5
