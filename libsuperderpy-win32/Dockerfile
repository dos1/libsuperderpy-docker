FROM purplekarrot/mingw-w64-i686:latest
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y install cmake ninja-build zip git vorbis-tools opus-tools graphicsmagick-imagemagick-compat webp && apt-get clean

ADD i686-w64-mingw32 /usr/i686-w64-mingw32

# make /bin/sh symlink to bash instead of dash:
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

ENTRYPOINT ["/bin/sh", "-c"]
