FROM node:alpine3.19

ARG NODE_USER
USER $NODE_USER

WORKDIR /usr/src/app
RUN mkdir node_modules

CMD ["yarn", "dev:wach"]
