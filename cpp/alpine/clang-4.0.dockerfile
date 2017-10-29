# docker build --rm -t devenv/cpp/alpine/clang:4.0.0 -f cpp/alpine/clang-4.0.dockerfile .
# docker run --rm devenv/cpp/alpine/clang:4.0.0 clang++ --version
# docker run --rm devenv/cpp/alpine/clang:4.0.0 g++ --version

# ends up containing GCC 6.3 and CLANG 4.0

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
        build-base \
        bash \
        make \
        cmake \
        git && \
    rm -rf /var/cache/apk/*
