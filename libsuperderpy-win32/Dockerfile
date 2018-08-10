FROM purplekarrot/mingw-w64-i686:latest
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y install cmake ninja-build zip git && apt-get clean

ADD i686-w64-mingw32 /usr/i686-w64-mingw32

ENTRYPOINT ["/bin/bash", "-c"]
