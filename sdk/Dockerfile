FROM ebassi/endlessci:base
MAINTAINER Emmanuele Bassi <ebassi@gmail.com>

ENV FLATPAK_OSTREE_REPO_MODE=user-only JHBUILD_RUN_AS_ROOT=1

COPY endless-sdk-build /tmp
RUN /tmp/endless-install-jhbuild.sh \
        && /tmp/endless-setup-jhbuild.sh \
        && jhbuild -f /etc/jhbuildrc update meta-eos-sdk \
        && jhbuild -f /etc/jhbuildrc buildone mozjs38
