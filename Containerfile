FROM docker.io/library/alpine:latest as builder

ARG repo_url
ARG revision=master
ARG app_name

RUN apk add \
  git \
  g++ \
  linux-headers \
  make

RUN git clone $repo_url /tmp/src
WORKDIR /tmp/src
RUN git checkout $revision
RUN make -j
RUN find . -iname $app_name -type f -executable -exec cp {} $app_name \;

FROM docker.io/library/alpine:latest

ARG app_name

RUN apk add \
  libstdc++

COPY --from=builder \
  /tmp/src/$app_name \
  /usr/local/bin/$app_name

RUN ln -s \
  /usr/local/bin/$app_name \
  /entrypoint

RUN mkdir /config
VOLUME /config

ENTRYPOINT ["/entrypoint", "/config/config.ini"]
