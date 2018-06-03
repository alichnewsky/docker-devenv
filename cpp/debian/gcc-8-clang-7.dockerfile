FROM gcc:8.1.0
MAINTAINER "Anthony Lichnewsky"

ADD llvm-stretch.list /etc/apt/sources.list.d/
ADD bazel.list /etc/apt/sources.list.d/

# run as root in docker build so no need to sudo apt-key
RUN curl -sL https://apt.llvm.org/llvm-snapshot.gpg.key| apt-key add - && \
    curl -sL https://bazel.build/bazel-release.pub.gpg | apt-key add -


# install clang 7 dev branch
RUN apt-get update -y && apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        clang-7 clang-format-7 clang-tidy-7 clang-7.doc libclang-7-dev libclang-common-7-dev libclang1-7 \
        llvm-7 llvm-7-dev libllvm7 \
        libomp-dev libomp5 \
        bison flex \
        cmake bazel && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-7  100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-7  100 && \
    update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-7  100 && \
    update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-7  100 && \
    update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-7  100 && \
    apt-get clean

# some development tools
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    cppcheck \
    lcov gcovr \
    valgrind