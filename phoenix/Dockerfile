ARG ALPINE_VERSION
ARG ELIXIR_VERSION
ARG ERLANG_VERSION

FROM hexpm/elixir:${ELIXIR_VERSION}-erlang-${ERLANG_VERSION}-alpine-${ALPINE_VERSION}

WORKDIR /usr/src/app
RUN apk add --no-cache \
      bash \
      git \
      inotify-tools
RUN mix local.hex --force

COPY --chmod=755 ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mix", "phx.server"]
