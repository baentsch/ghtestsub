# Multi-stage build: First the full builder image:

ARG INSTALLDIR_OPENSSL=/opt/openssl32
ARG INSTALLDIR_LIBOQS=/opt/liboqs

# liboqs build type variant; maximum portability of image:
ARG LIBOQS_BUILD_DEFINES="-DOQS_DIST_BUILD=ON"

# Define the degree of parallelism when building the image; leave the number away only if you know what you are doing
ARG MAKE_DEFINES="-j 8"

ARG SIG_ALG="dilithium3"

FROM alpine:3.13 as buildopenssl
# Take in all global args
ARG INSTALLDIR_OPENSSL
ARG INSTALLDIR_LIBOQS
ARG LIBOQS_BUILD_DEFINES
ARG MAKE_DEFINES
ARG SIG_ALG

LABEL version="1"
ENV DEBIAN_FRONTEND noninteractive

RUN apk update && apk upgrade

STOPSIGNAL SIGTERM
