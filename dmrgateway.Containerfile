FROM docker.io/library/alpine:latest as builder

ARG revision=master

RUN apk add \
  git \
  g++ \
  linux-headers \
  make

RUN git clone \
  https://github.com/g4klx/DMRGateway.git \
  /tmp/src
WORKDIR /tmp/src
RUN git checkout $revision
RUN make

FROM docker.io/library/alpine:latest

RUN apk add \
  libstdc++

COPY --from=builder \
  /tmp/src/DMRGateway \
  /usr/local/bin/DMRGateway

RUN mkdir /config
VOLUME /config

ENTRYPOINT ["/usr/local/bin/DMRGateway", "/config/dmrgateway.ini"]
