FROM ubuntu:16.04
MAINTAINER Adam Wolfe Gordon <awg@xvx.ca>

COPY scripts /scripts
COPY scripts/entrypoint.sh /
RUN apt-get update -yq
RUN apt-get install -yq --no-install-recommends make clang-3.8 clang libclang-3.8-dev \
  cmake git ca-certificates llvm-3.8-dev libncurses5-dev python
RUN ln -s /usr/bin/llvm-config-3.8 /usr/bin/llvm-config
RUN /scripts/install-bear.sh
RUN /scripts/install-rtags.sh
RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  rm -rf /scripts

ENTRYPOINT ["/entrypoint.sh"]
