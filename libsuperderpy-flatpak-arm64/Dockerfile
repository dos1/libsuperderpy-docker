FROM debian:buster
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y install flatpak-builder qemu-user-static && apt-get clean

RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
RUN flatpak install -y flathub org.freedesktop.Platform/aarch64/18.08 org.freedesktop.Sdk/aarch64/18.08 org.freedesktop.Platform/aarch64/19.08 org.freedesktop.Sdk/aarch64/19.08
