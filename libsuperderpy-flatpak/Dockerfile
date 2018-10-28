FROM debian:latest
MAINTAINER Sebastian Krzyszkowiak <dos@dosowisko.net>

RUN apt-get update && apt-get -y install flatpak-builder && apt-get clean

RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
RUN flatpak install flathub org.freedesktop.Platform/x86_64/18.08 org.freedesktop.Sdk/x86_64/18.08
