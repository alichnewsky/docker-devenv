# docker build --rm -t devenv/cpp/alpine/gcc:6.3.0 -f cpp/alpine/gcc-6.3.dockerfile .
# docker run --rm devenv/cpp/alpine/gcc:6.3.0 gcc --version


FROM alpine:3.6
MAINTAINER "Anthony Lichnewsky"

RUN apk update && \
    apk upgrade && \
    apk --update add \
        gcc \
        g++ \
        libstdc++ \
        gfortran \
        make \
        cmake \
        bash \
        build-base \
        git  && \
    rm -rf /var/cache/apk/*
         