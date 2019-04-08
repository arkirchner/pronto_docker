FROM ruby:2.6.2-slim
MAINTAINER Armin Kirchner <post.armin@gmail.com>

# Dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential \
      curl \
      cmake \
      bash-completion \
      pkg-config \
      git \
      ssh-client \
      gnupg \
      apt-transport-https

# Yarn setup
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -qq -y --no-install-recommends yarn nodejs

RUN mkdir -p /lint_app
WORKDIR /lint_app

COPY Gemfile Gemfile.lock setup_eslint.sh /lint_app/

# install javasript linter
RUN ./setup_eslint.sh

# install gems
RUN gem install bundler && bundle install
