FROM devenv/cpp/debian/ispc-no-nvptx:latest
MAINTAINER "Anthony Lichnewsky"

RUN apt-get update -y && apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential openjdk-8-jdk python zip && \
    curl -sL    https://bazel.build/bazel-release.pub.gpg -o - | gpg --import - && \
    mkdir -p /opt/bazel-dist && \
    curl -sL https://github.com/bazelbuild/bazel/releases/download/0.7.0/bazel-0.7.0-dist.zip -o /opt/bazel-dist/bazel-0.7.0-dist.zip && \
    curl -sL https://github.com/bazelbuild/bazel/releases/download/0.7.0/bazel-0.7.0-dist.zip.sig -o /opt/bazel-dist/bazel-0.7.0-dist.zip.sig && \
    gpg --verify /opt/bazel-dist/bazel-0.7.0-dist.zip.sig /opt/bazel-dist/bazel-0.7.0-dist.zip
WORKDIR /opt/bazel-dist
RUN unzip bazel-0.7.0-dist.zip && bash ./compile.sh && cp /opt/bazel-dist/output/bazel /usr/local/bin/ && rm -rf /opt/bazel-dist
