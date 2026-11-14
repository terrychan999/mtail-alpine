# syntax=docker/dockerfile:1

ARG MTAIL_VERSION=3.4.19
ARG ALPINE_VERSION=3.24
ARG MTAIL_IMAGE=ghcr.io/jaqx0r/mtail:${MTAIL_VERSION}-${TARGETARCH}
ARG ALPINE_IMAGE=alpine:${ALPINE_VERSION}

FROM ${MTAIL_IMAGE} AS src

FROM ${ALPINE_IMAGE}
RUN apk add --no-cache ca-certificates tzdata
COPY --from=src /mtail /usr/bin/mtail

EXPOSE 3903
WORKDIR /tmp
ENTRYPOINT ["/usr/bin/mtail"]
