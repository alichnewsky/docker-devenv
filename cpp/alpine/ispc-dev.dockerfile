# version based on $(git dsecribe --alwyays)
# docker build --rm -t devenv/cpp/alpine/ispc-no-nvptx:v1.9.1-83-g9d9e46b8 -f cpp/alpine/ispc-dev.dockerfile .
# docker tag devenv/cpp/alpine/ispc-no-nvptx:v1.9.1-83-g9d9e46b8 devenv/cpp/alpine/ispc-no-nvptx:latest
# docker run --rm -it devenv/cpp/alpine/ispc-no-nvptx ispc --version

FROM alpine:3.6
MAINTAINER "Anthony Lichnewsky"

RUN apk update && \
    apk upgrade && \
    apk --update add \
        clang \
        clang-dev \
        clang-doc \ 
        clang-libs \
        clang-analyzer \
        clang-static \
        llvm4 \
        llvm4-dev \
        bison flex \
        ncurses-dev ncurses-libs \
        zlib zlib-dev \
        build-base \
        bash \
        make \
        cmake \
        git && \
    rm -rf /var/cache/apk/*

WORKDIR /opt
RUN git clone https://github.com/ispc/ispc /opt/github.com/ispc/ispc
WORKDIR /opt/github.com/ispc/ispc
# needs patching ?
# not if you dont make NVPTX_ENABLED=1
RUN make WERROR= && cp ispc /usr/local/bin
WORKDIR /
RUN rm -rf /opt/github.com/ispc