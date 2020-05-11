FROM arm32v7/debian:jessie AS sysroot
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install git build-essential fakeroot devscripts git pkg-config dpkg-dev dh-make libdrm2 libgbm1 libxfixes3 libxext6 libxdamage1 libx11-6 libgcc1 libstdc++6 libudev1 libwayland-client0 libwayland-server0 ninja-build pkg-config cmake zip wget file vorbis-tools opus-tools graphicsmagick-imagemagick-compat webp libpulse-dev libx11-dev libasound-dev libxss-dev libxrandr-dev libxinerama-dev libxcursor-dev libasound2-dev libudev-dev libsamplerate-dev libxi-dev

# WARNING: chip-mali-userspace is non-FLOSS. It's not distributed with the games, but we need it at compile-time
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/chip-mali-userspace-a9d2b50.tar.gz && tar xzf chip-mali-userspace-a9d2b50.tar.gz && cd chip-mali-userspace-a9d2b5060103baa3f5d6e98011e28f2d4fae2fa6 && dpkg-buildpackage && dpkg -i ../chip-mali-userspace_0.1_armhf.deb && rm -rf /deps

ADD do_autotools do_cmake do_make /usr/local/bin/

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/cmake-3.6.3.tar.gz && tar xzf cmake-3.6.3.tar.gz && cd cmake-3.6.3 && do_cmake && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/zlib-1.2.11.tar.gz && tar xzf zlib-1.2.11.tar.gz && cd zlib-1.2.11 && do_cmake && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libpng-1.6.37.tar.gz && tar xzf libpng-1.6.37.tar.gz && cd libpng-1.6.37 && do_cmake && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/bzip2-1.0.8.tar.gz && tar xzf bzip2-1.0.8.tar.gz && cd bzip2-1.0.8 && make install CFLAGS="-Wall -Winline -O2 -g -D_FILE_OFFSET_BITS=64 -fPIC" && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/dumb-2.0.3-p1.tar.gz && tar xzf dumb-2.0.3-p1.tar.gz && cd dumb-2.0.3 && do_cmake -DBUILD_ALLEGRO4=off -DBUILD_EXAMPLES=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libjpeg-turbo-2.0.4.tar.gz && tar xzf libjpeg-turbo-2.0.4.tar.gz && cd libjpeg-turbo-2.0.4 && do_cmake -DWITH_JPEG8=ON && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libogg-1.3.4.tar.gz && tar xzf libogg-1.3.4.tar.gz && cd libogg-1.3.4 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libvorbis-1.3.6.tar.gz && tar xzf libvorbis-1.3.6.tar.gz && cd libvorbis-1.3.6 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libtheora-1.1.1-p1.tar.bz2 && tar xBf libtheora-1.1.1-p1.tar.bz2 && cd libtheora-1.1.1 && do_autotools --disable-examples && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/flac-1.3.2.tar.xz && tar xJf flac-1.3.2.tar.xz && cd flac-1.3.2 && do_autotools --disable-cpplibs && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opus-1.3.1.tar.gz && tar xzf opus-1.3.1.tar.gz && cd opus-1.3.1 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/opusfile-0.11.tar.gz && tar xzf opusfile-0.11.tar.gz && cd opusfile-0.11 && do_autotools --disable-http && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/libwebp-1.1.0.tar.gz && tar xzf libwebp-1.1.0.tar.gz && cd libwebp-1.1.0 && do_autotools && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/physfs-3.0.2.tar.bz2 && tar xBf physfs-3.0.2.tar.bz2 && cd physfs-3.0.2 && do_cmake -DPHYSFS_BUILD_TEST=off && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.10.2.tar.gz && tar xzf freetype-2.10.2.tar.gz && cd freetype-2.10.2 && do_cmake -DCMAKE_DISABLE_FIND_PACKAGE_ZLIB=ON -DCMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=ON -DCMAKE_DISABLE_FIND_PACKAGE_PNG=ON -DCMAKE_DISABLE_FIND_PACKAGE_BZip2=ON && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/harfbuzz-2.6.4.tar.xz && tar xf harfbuzz-2.6.4.tar.xz && cd harfbuzz-2.6.4 && do_cmake -DHB_HAVE_FREETYPE=ON && rm -rf /deps

# and freetype again, now with harfbuzz support
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/freetype-2.10.2.tar.gz && tar xzf freetype-2.10.2.tar.gz && cd freetype-2.10.2 && do_cmake -DFT_WITH_ZLIB=ON -DFT_WITH_BZIP2=ON -DFT_WITH_PNG=ON -DFT_WITH_HARFBUZZ=ON && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/SDL2-2.0.10.tar.gz && tar xzf SDL2-2.0.10.tar.gz && cd SDL2-2.0.10 && do_cmake && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.6.0-p1.tar.gz && tar xzf allegro-5.2.6.0-p1.tar.gz && cd allegro-5.2.6.0 && do_cmake -DWANT_EXAMPLES=OFF -DWANT_DEMO=OFF -DALLEGRO_SDL=ON && rm -rf /deps

FROM debian:buster
RUN apt-get update && apt-get install -y wget git pkg-config ninja-build cmake zip file vorbis-tools opus-tools graphicsmagick-imagemagick-compat webp xz-utils
RUN mkdir /toolchain && cd /toolchain && wget https://releases.linaro.org/components/toolchain/binaries/4.9-2016.02/arm-linux-gnueabihf/gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz && tar xf gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz && rm gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
ADD pocketchip.toolchain /toolchain
RUN ln -s /sysroot/lib/arm-linux-gnueabihf /lib/arm-linux-gnueabihf

COPY --from=sysroot / /sysroot

ENV LINARO_TOOLCHAIN=/toolchain/gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf SYSROOT=/sysroot
