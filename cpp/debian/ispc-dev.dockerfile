# version based on $(git dsecribe --alwyays)
# docker build --rm -t devenv/cpp/debian/ispc-no-nvptx:v1.9.1-83-g9d9e46b8 -f cpp/debian/ispc-dev.dockerfile .
# docker tag devenv/cpp/debian/ispc-no-nvptx:v1.9.1-83-g9d9e46b8 devenv/cpp/debian/ispc-no-nvptx:latest
# docker run --rm -it devenv/cpp/debian/ispc-no-nvptx ispc --version
# docker run --rm -it devenv/cpp/debian/ispc-no-nvptx clang --version
# docker run --rm -it devenv/cpp/debian/ispc-no-nvptx gcc --version

FROM gcc:7.2
MAINTAINER "Anthony Lichnewsky"

RUN apt-get update -y && apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
            clang-3.9 clang-format-3.9 clang-tidy-3.9 clang-3.9-doc  libclang-3.9-dev libclang-common-3.9-dev clang-tidy-3.9 libclang1-3.9 \
            llvm-3.9   libomp-dev  llvm-3.9-dev libllvm3.9 libomp5 \
            bison flex && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.9  100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.9  100 && \
    update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-3.9  100 && \
    update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-3.9  100 && \
    update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-3.9  100 && \
    apt-get clean 

RUN git clone https://github.com/ispc/ispc.git /opt/github.com/ispc/ispc
WORKDIR /opt/github.com/ispc/ispc
RUN make WERROR= && cp ispc /usr/bin/ispc && rm -rf /opt/github.com/ispc/ispc

