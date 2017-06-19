FROM ebassi/endlessci:base
MAINTAINER Emmanuele Bassi <ebassi@gmail.com>

ENV FLATPAK_OSTREE_REPO_MODE=user-only

RUN su - jhbuildci -c 'jhbuild update meta-eos-sdk'
