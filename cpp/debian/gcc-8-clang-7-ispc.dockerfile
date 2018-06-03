ARG BASE_IMAGE=devenv/cpp/debian/clang:latest
FROM $BASE_IMAGE
MAINTAINER "Anthony Lichnewsky"

# This will require build _as part of an LLVM build ... which I am not doing right now
#RUN git clone https://github.com/ispc/ispc.git /opt/github.com/ispc/ispc
#WORKDIR /opt/github.com/ispc/ispc
#RUN git describe --always
#RUN make WERROR= && cp ispc /usr/bin/ispc && rm -rf /opt/github.com/ispc/ispc

# install pre-built binary based on LLVM 5.0. This is a statically linked binary, so it will run.
# interoperability with llvm 7.0 binaries _should be fine_

WORKDIR /opt
RUN curl -sL https://downloads.sourceforge.net/project/ispcmirror/v1.9.2/ispc-v1.9.2-linux.tar.gz -o /opt/ispc-v1.9.2-linux.tar.gz  && \
    tar xfz ispc-v1.9.2-linux.tar.gz && \
    cp /opt/ispc-v1.9.2-linux/ispc /usr/local/bin/ispc-1.9.2 && \
    update-alternatives --install /usr/bin/ispc ispc /usr/local/bin/ispc-1.9.2  100 && \
    rm -rf /opt/ispc-v1.9.2-linux/ispc
