FROM phoenix_boilerplate-elixir:latest as build

RUN elixir -v
RUN node -v
RUN yarn -v

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV=prod

# install mix dependencies
COPY TMP_VERSION ./VERSION
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

# build assets
COPY priv priv
COPY assets assets
RUN cd assets && yarn install && yarn run deploy
RUN mix phx.digest

# build project
COPY lib lib
RUN mix compile

# build release
RUN mix release

# Make volume visible to outside so we can copy files out of the container
ADD ./build_output /build_output

VOLUME ["build_output"]

RUN tar -czf static_files.tar.gz /app/priv/static/*
RUN tar -czf release.tar.gz /app/_build/*
