FROM node:alpine3.19
ARG NODE_USER

RUN apk add --no-cache bash
USER $NODE_USER

WORKDIR /usr/src/app
RUN mkdir node_modules

COPY --chmod=755 ./docker-entrypoint.sh /usr/local/bin/

CMD ["yarn", "dev:wach"]
