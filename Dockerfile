# syntax=docker/dockerfile:1

ARG MTAIL_IMAGE
ARG ALPINE_IMAGE

FROM ${MTAIL_IMAGE} AS src

FROM ${ALPINE_IMAGE}

RUN apk add --no-cache ca-certificates tzdata
COPY --from=src /mtail /usr/bin/mtail

EXPOSE 3903
WORKDIR /tmp
ENTRYPOINT ["/usr/bin/mtail"]
