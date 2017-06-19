## Endless - CI containers for SDK modules

The Endless apps SDK contains multiple modules that depend on each other. In
order to perform continuous integration on each module, we use two Docker
images:

  - endlessci:base, which contains a Debian-based OS with the necessary
    system dependencies for building the SDK modules
  - endlessci:sdk, which provides a separate build environment through
    jhbuild

If you want to add CI to one of the modules, you should start from the
Dockerfile or travis.yml templates; either one will build an intermediate
Docker image that will copy the current directory — typically, a Git
repository with the module to build — into the image. Then, you should run
the `endless-build-module` script from the endlessci:sdk image.
