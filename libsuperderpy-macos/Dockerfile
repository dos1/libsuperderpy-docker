FROM andrewd/osxcross:latest
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y install cmake ninja-build ruby zip git wget && apt-get clean

ENV MACOSX_DEPLOYMENT_TARGET 10.7
ENV LIBSUPERDERPY_OSXCROSS_ROOT /opt/osxcross/target
ENV LIBSUPERDERPY_OSXCROSS_SDK_VERSION 10.8

RUN ln -s /opt/osxcross/target/bin/x86_64-apple-darwin12-otool /opt/osxcross/target/bin/x86_64-apple-darwin15-otool
RUN ln -s /opt/osxcross/target/bin/x86_64-apple-darwin12-install_name_tool /opt/osxcross/target/bin/x86_64-apple-darwin15-install_name_tool

RUN mkdir -p /opt/osxcross/target/macports && echo "http://packages.macports.org" > /opt/osxcross/target/macports/MIRROR
RUN osxcross-macports install allegro5
RUN osxcross-macports install fftw-3 libwebsockets
