FROM moby/buildkit:v0.11.5 as buildkit

FROM alpine:3.17.3 as buildkit-frontend

RUN apk add --no-cache openssh-client \
    curl \
    git

RUN curl -o buildkit.tar.gz -LJO https://github.com/moby/buildkit/releases/download/v0.11.5/buildkit-v0.11.5.linux-amd64.tar.gz && \
    tar -xf buildkit.tar.gz -C /usr/local && \
    rm -f buildkit.tar.gz

RUN mkdir -p -m 0600 ~/.ssh && \
    ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh git clone git@github.com:vv173/dockerizing-nodejs-with-multistage.git node-app
