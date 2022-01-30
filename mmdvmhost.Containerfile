FROM docker.io/library/alpine:latest as builder

ARG revision=master

RUN apk add \
  git \
  g++ \
  linux-headers \
  make

RUN git clone \
  https://github.com/g4klx/MMDVMHost.git \
  /tmp/src
WORKDIR /tmp/src
RUN git checkout $revision
RUN make -j

FROM docker.io/library/alpine:latest

RUN apk add \
  libstdc++

COPY --from=builder \
  /tmp/src/MMDVMHost \
  /usr/local/bin/MMDVMHost

RUN mkdir /config
VOLUME /config

ENTRYPOINT ["/usr/local/bin/MMDVMHost", "/config/mmdvmhost.ini"]
