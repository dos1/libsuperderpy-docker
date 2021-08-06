FROM debian:buster
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

# Install build tools
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -yy && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yy \
        automake            \
        bison               \
        build-essential     \
        cmake               \
        curl                \
        file                \
        flex                \
        git                 \
        libtool             \
        llvm-dev            \
        pkg-config          \
        python              \
        texinfo             \
        uuid-dev            \
        vim                 \
        wget                \
        ninja-build         \
        ruby                \
        zip                 \
        vorbis-tools        \
        opus-tools          \
        graphicsmagick-imagemagick-compat   \
        webp

# Install osxcross
# NOTE: The Docker Hub's build machines run varying types of CPUs, so an image
# built with `-march=native` on one of those may not run on every machine.
ENV OSXCROSS_SDK_VERSION 10.11
RUN mkdir /opt/osxcross &&                                      \
    cd /opt &&                                                  \
    git clone https://github.com/tpoechtrager/osxcross.git &&   \
    cd osxcross &&                                              \
    git checkout de6c72eff2d6013f5af46fba1fa205654c5cf5e2 &&    \
    ./tools/get_dependencies.sh &&                              \
    curl -L -o ./tarballs/MacOSX${OSXCROSS_SDK_VERSION}.sdk.tar.xz \
        https://s3.amazonaws.com/andrew-osx-sdks/MacOSX${OSXCROSS_SDK_VERSION}.sdk.tar.xz && \
    UNATTENDED=1 PORTABLE=1 ./build.sh &&                       \
    ./build_compiler_rt.sh

ENV PATH $PATH:/opt/osxcross/target/bin
CMD /bin/bash

ENV MACOSX_DEPLOYMENT_TARGET 10.8
ENV LIBSUPERDERPY_OSXCROSS_ROOT /opt/osxcross/target
ENV LIBSUPERDERPY_OSXCROSS_SDK_VERSION 10.11

RUN mkdir -p /opt/osxcross/target/macports && echo "http://packages.macports.org" > /opt/osxcross/target/macports/MIRROR
RUN osxcross-macports install allegro5
