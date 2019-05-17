FROM devkitpro/devkita64

RUN apt-get update && apt-get -y full-upgrade && apt-get install -y cmake ninja-build git pkg-config wget zip file vorbis-tools opus-tools graphicsmagick-imagemagick-compat webp
RUN dkp-pacman -Syu --noconfirm && dkp-pacman -S --noconfirm devkitpro-pkgbuild-helpers

ADD do_autotools do_make do_cmake /usr/local/bin/
ADD switch.toolchain /

# TODO: webp
# TODO: physfs
# TODO: dumb

#RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.5.0-p2.tar.gz && tar xzf allegro-5.2.5.0-p2.tar.gz && cd allegro-5.2.5.0 && do_cmake -DWANT_EXAMPLES=OFF -DWANT_DEMO=OFF -DALLEGRO_SDL=ON -DPREFER_STATIC_DEPS=ON -DSHARED=OFF -DALLEGRO_HAVE_STRERROR_S= -DALLEGRO_LITTLE_ENDIAN=ON && rm -rf /deps

RUN mkdir /deps && cd /deps && wget https://github.com/dos1/allegro5/archive/dos-work.tar.gz && tar xzf dos-work.tar.gz && cd allegro5-dos-work && do_cmake -DWANT_EXAMPLES=OFF -DWANT_DEMO=OFF -DALLEGRO_SDL=ON -DPREFER_STATIC_DEPS=ON -DSHARED=OFF -DALLEGRO_HAVE_STRERROR_S= -DALLEGRO_LITTLE_ENDIAN=ON && rm -rf /deps
