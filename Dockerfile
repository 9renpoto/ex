FROM elixir:1.12.2-alpine
RUN apk add -U --no-cache \
  postgresql-client postgresql-dev \
  build-base \
  libxml2-dev \
  libxslt-dev \
  tzdata
RUN mkdir /myapp
WORKDIR /myapp
COPY mix.exs /myapp/mix.exs
COPY mix.lock /myapp/mix.lock
RUN mix local.hex --force
RUN mix local.rebar --force
COPY . /myapp
