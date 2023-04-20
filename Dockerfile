FROM alpine:3.17.3

ARG DOCKER_USERNAME

ENV DOCKER_USERNAME=$DOCKER_USERNAME
ENV BUILDKIT_HOST=docker-container://buildkit

RUN apk update && apk add --no-cache \
    openssh-client \
    docker-cli \
    curl \
    git

RUN curl -o buildkit.tar.gz -LJO https://github.com/moby/buildkit/releases/download/v0.11.5/buildkit-v0.11.5.linux-amd64.tar.gz && \
    tar -xf buildkit.tar.gz -C /usr/local && \
    rm -f buildkit.tar.gz

RUN mkdir -p -m 0600 ~/.ssh && \
    ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh git clone git@github.com:vv173/dockerizing-nodejs-with-multistage.git node-app

RUN --mount=type=secret,id=docker-secret cat /run/secrets/docker-secret | docker login --username "$DOCKER_USERNAME" --password-stdin

WORKDIR /node-app

CMD buildctl build --frontend=dockerfile.v0 \
    --local context=. \
    --local dockerfile=. \
    --output type=image,name=docker.io/v17v3/node-app:lab6,push=true

