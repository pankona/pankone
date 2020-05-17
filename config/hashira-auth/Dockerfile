ARG GO_VERSION=1.14.2

FROM golang:${GO_VERSION}-stretch AS builder

RUN mkdir -p /src
WORKDIR /src

COPY ./hashira .

RUN cd cmd/hashira-auth && CGO_ENABLED=0 GOOS=linux go build

FROM alpine:latest

RUN apk update \
 && apk add --no-cache ca-certificates \
 && apk add tzdata

RUN mkdir -p /app

WORKDIR /app

COPY --from=builder /src/cmd/hashira-auth/hashira-auth .
ADD config/hashira-auth/secret.yaml .

CMD ["./hashira-auth"]


