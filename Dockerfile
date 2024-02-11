# syntax=docker/dockerfile:1

FROM alpine:latest

ARG POCKETBASE_VERSION=0.21.3

RUN apk add --no-cache \
    ca-certificates \
    unzip \
    wget \
    zip \
    zlib-dev

ADD https://github.com/pocketbase/pocketbase/releases/download/v${POCKETBASE_VERSION}/pocketbase_${POCKETBASE_VERSION}_linux_amd64.zip /tmp/pocketbase.zip

RUN unzip /tmp/pocketbase.zip -d /pb && \
    chmod +x /pb/pocketbase && \
    rm /tmp/pocketbase.zip

EXPOSE 8090

# CMD [ "/pb/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/app/data/pb_data", "--publicDir=/app/data/pb_public" ]
CMD [ "/pb/pocketbase", "serve", "--http=0.0.0.0:8090" ]
