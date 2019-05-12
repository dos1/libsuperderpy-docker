FROM debian:stretch

ENV ANDROID_HOME /opt/android-sdk-linux

# ------------------------------------------------------
# --- Install required tools

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-8-jdk-headless cmake zip ninja-build zip wget python pkg-config git vorbis-tools opus-tools graphicsmagick-imagemagick-compat webp && apt-get clean

# ------------------------------------------------------
# --- Download Android SDK tools into $ANDROID_HOME

RUN cd /opt \
    && wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O android-sdk-tools.zip \
    && unzip android-sdk-tools.zip -d ${ANDROID_HOME} \
    && rm android-sdk-tools.zip

ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

ENV LIBSUPERDERPY_ANDROID_TARGET android-26
ENV ANDROID_NDK_HOME /opt/android-ndk
ENV ANDROID_NDK_VERSION r14b
ENV ANDROID_BUILD_TOOLS_VERSION 28.0.2
ENV ANDROID_BUILD_TOOLS ${ANDROID_HOME}/build-tools/${ANDROID_BUILD_TOOLS_VERSION}

# ------------------------------------------------------
# --- Install Android SDKs and other build packages

# Other tools and resources of Android SDK
#  you should only install the packages you need!
# To get a full list of available options you can use:
#  sdkmanager --list

# Accept licenses before installing components, no need to echo y for each component
# License is valid for all the standard components in versions installed from this file
# Non-standard components: MIPS system images, preview versions, GDK (Google Glass) and Android Google TV require separate licenses, not accepted there
RUN yes | sdkmanager --licenses

# Platform tools
RUN sdkmanager "tools" "platform-tools"

# SDKs
# Please keep these in descending order!
# The `yes` is for accepting all non-standard tool licenses.

# Please keep all sections in descending order!
RUN yes | sdkmanager \
    "platforms;${LIBSUPERDERPY_ANDROID_TARGET}" \
    "build-tools;${ANDROID_BUILD_TOOLS_VERSION}"

# ------------------------------------------------------
# --- Android NDK

# download
RUN mkdir /opt/android-ndk-tmp && \
    cd /opt/android-ndk-tmp && \
    wget https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip && \
# uncompress
    unzip android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip && \
# move to its final location
    mv ./android-ndk-${ANDROID_NDK_VERSION} ${ANDROID_NDK_HOME} && \
# remove temp dir
    cd ${ANDROID_NDK_HOME} && \
    rm -rf /opt/android-ndk-tmp

# add to PATH
ENV PATH ${PATH}:${ANDROID_NDK_HOME}

# warm up the gradle cache
RUN mkdir /deps && cd /deps && wget https://dosowisko.net/libsuperderpy/deps/allegro-5.2.5.0-p2.tar.gz && tar xzf allegro-5.2.5.0-p2.tar.gz && cd allegro-5.2.5.0 && cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja -DANDROID_NDK=$ANDROID_NDK_HOME -DCMAKE_SYSTEM_NAME=Android -DANDROID=TRUE -DWANT_TESTS=no -DWANT_EXAMPLES=OFF -DWANT_DEMO=OFF && cmake --build build && rm -rf /deps
