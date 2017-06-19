FROM ebassi/endlessci:base
MAINTAINER Emmanuele Bassi <ebassi@gmail.com>

ENV FLATPAK_OSTREE_REPO_MODE=user-only

COPY endless-sdk-build /tmp
RUN /tmp/endless-install-jhbuild.sh

RUN useradd -ms /bin/bash jhbuildci
RUN su - jhbuildci -c /tmp/endless-setup-jhbuild.sh
RUN su - jhbuildci -c 'jhbuild update meta-eos-sdk'
