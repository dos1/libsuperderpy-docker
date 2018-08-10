FROM purplekarrot/mingw-w64-x86-64:latest
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y install cmake ninja-build zip git && apt-get clean

ADD x86_64-w64-mingw32 /usr/x86_64-w64-mingw32

ENTRYPOINT ["/bin/bash", "-c"]
