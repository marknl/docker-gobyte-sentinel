# marknl/gobyte-sentinel

A gobyte-sentinel docker image.

[![marknl/gobyte-sentinel][docker-pulls-image]][docker-hub-url] [![marknl/gobyte-sentinel][docker-stars-image]][docker-hub-url] [![marknl/docker-gobyte-sentinel][travis-build-image]][travis-build-url]

## Tags
- `0.1.0`, `latest` ([1.1.0/Dockerfile](https://github.com/marknl/docker-gobyte-sentinel/blob/master/1.1.0/Dockerfile))

## What is GoByte Sentinel?

Sentinel is an autonomous agent for persisting, processing and automating GoByte Core governance objects and tasks. Sentinel is implemented as a Python application that connects to your GoByte Core docker instance. Learn more about the GoByte Project [here](https://gobyte.network).

## Usage

### How to use this image

This image contains the main scripts from the GoByte Sentinel repository, located [here](https://github.com/gobytecoin/sentinel). Simply run the image with it's required environment variables:

```sh
❯ docker run --rm -it \
  -e GOBYTE_RPCSERVER=172.17.0.4 \
  -e GOBYTE_RPCUSER=username \
  -e GOBYTE_RPCPASS=password \
  marknl/gobyte-sentinel
```

This will run `crond` within the image. It will run sentinel every 2 mins, trying to connect to `GOBYTE_RPCSERVER` with the given credentials `GOBYTE_RPCUSER` `GOBYTE_RPCPASS`.

For this to work, your GoByte Core image should run with at least the following parameters:
- rpcallowip=172.17.0.0/16
- rpcauth=username:hash

or

- rpcallowip=172.17.0.0/16
- rpcuser=username
- rpcpassword=password

Use this to give `GOBYTE_RPCSERVER`, `GOBYTE_RPCUSER` and `GOBYTE_RPCPASS` the correct values. For information on how to setup your GoByte Core images, [read this](https://github.com/marknl/docker-gobyte-core/blob/master/README.md#using-rpcauth-for-remote-authentication).

## Docker

This image is officially supported on Docker version 18.06, with support for older versions provided on a best-effort basis.

## License

[License information](https://github.com/gobytecoin/sentinel/blob/master/LICENSE) for the software contained in this image.

[License information](https://github.com/marknl/docker-gobyte-sentinel/blob/master/LICENSE) for the [marknl/docker-gobyte-sentinel][docker-hub-url] docker project.

[docker-hub-url]: https://hub.docker.com/r/marknl/gobyte-sentinel
[docker-pulls-image]: https://img.shields.io/docker/pulls/marknl/gobyte-sentinel.svg?style=flat-square
[docker-stars-image]: https://img.shields.io/docker/stars/marknl/gobyte-sentinel.svg?style=flat-square
[travis-build-url]: https://travis-ci.org/marknl/docker-gobyte-sentinele
[travis-build-image]: https://img.shields.io/travis/marknl/docker-gobyte-sentinel.svg
