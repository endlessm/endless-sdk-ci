FROM debian:stretch-slim
MAINTAINER Emmanuele Bassi <ebassi@gmail.com>

RUN echo "deb http://deb.debian.org/debian experimental main" >> /etc/apt/sources.list \
    && apt-get update -qq \
    && apt-get install -qq -y --no-install-recommends \
        at-spi2-core \
        autoconf \
        autoconf-archive \
        automake \
        autopoint \
        build-essential \
        ca-certificates \
        ccache \
        dbus \
        gcc \
        gettext \
        gir1.2-evince-3.0 \
        gir1.2-freedesktop \
        gir1.2-gstreamer-1.0 \
        gir1.2-gtk-3.0 \
        gir1.2-pango-1.0 \
        gir1.2-rsvg-2.0 \
        gir1.2-webkit2-4.0 \
        git-core \
        gjs \
        gobject-introspection \
        gtk-doc-tools \
        iso-codes \
        libatk1.0-dev \
        libatk-bridge2.0-dev \
        libcairo2-dev \
        libdbus-glib-1-dev \
        libevince-dev \
        libffi-dev \
        libflac-dev \
        libgdk-pixbuf2.0-dev \
        libgirepository1.0-dev \
        libgtk-3-dev \
        libicu-dev \
        libjson-glib-dev \
        libjs-mathjax \
        libopus-dev \
        libpango1.0-dev \
        libtag1-dev \
        libtool \
        libtool-bin \
        libvpx-dev \
        libwebkit2gtk-4.0-dev \
        locales \
        make \
        ninja-build \
        pkg-config \
        python \
        python-dev \
        python-pip \
        python-setuptools \
        python-virtualenv \
        python-wheel \
        python3 \
        python3-pip \
        python3-polib \
        python3-setuptools \
        python3-virtualenv \
        python3-wheel \
        python3-yaml \
        tcl \
        uuid \
        wget \
        xvfb \
        yelp-tools \
        zlib1g-dev \
    && apt-get install -qq -y -t experimental --no-install-recommends \
        flatpak \
    && pip3 install meson \
    && rm -rf /usr/share/doc/* /usr/share/man/*


RUN locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8
ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8

ENV FLATPAK_OSTREE_REPO_MODE=user-only
RUN flatpak remote-add --if-not-exists gnome https://sdk.gnome.org/gnome.flatpakrepo

COPY endless-sdk-build /tmp
RUN /tmp/endless-install-jhbuild.sh

RUN useradd -ms /bin/bash jhbuildci
RUN su - jhbuildci -c /tmp/endless-setup-jhbuild.sh
