FROM ubuntu:16.04
MAINTAINER Adam Wolfe Gordon <awg@xvx.ca>

COPY scripts /scripts
COPY llvm.list /etc/apt/sources.list.d/llvm.list
COPY llvm-snapshot.gpg.key /tmp
COPY scripts/entrypoint.sh /

RUN apt-key add /tmp/llvm-snapshot.gpg.key
RUN apt-get update -yq
RUN apt-get install -yq --no-install-recommends make clang-4.0 libclang-4.0-dev \
  cmake git ca-certificates llvm-4.0-dev libncurses5-dev python
RUN ln -s /usr/bin/llvm-config-4.0 /usr/bin/llvm-config \
  && ln -s /usr/bin/clang-4.0 /usr/bin/clang \
  && ln -s /usr/bin/clang-4.0 /usr/bin/cc \
  && ln -s /usr/bin/clang++-4.0 /usr/bin/clang++ \
  && ln -s /usr/bin/clang++-4.0 /usr/bin/c++

RUN /scripts/install-rtags.sh
RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  rm -rf /scripts

ENTRYPOINT ["/entrypoint.sh"]
