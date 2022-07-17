FROM debian:bullseye
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y install flatpak-builder qemu-user-static && apt-get clean

RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
RUN flatpak install -y flathub org.freedesktop.Platform/aarch64/21.08 org.freedesktop.Sdk/aarch64/21.08
