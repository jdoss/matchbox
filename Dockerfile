FROM docker.io/golang:1.18.4 AS builder
COPY . src
RUN cd src && make build

FROM docker.io/alpine:3.16.1
LABEL maintainer="Dalton Hubble <dghubble@gmail.com>"
COPY --from=builder /go/src/bin/matchbox /matchbox
EXPOSE 8080
ENTRYPOINT ["/matchbox"]
