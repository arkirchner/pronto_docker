FROM ruby:2.5.3-slim
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
      gnupg

# Node.js setup
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - \
      && apt-get update && apt-get install -qq -y --no-install-recommends nodejs

# Yarn setup
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
      && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
      && apt-get update && apt-get install -qq -y --no-install-recommends yarn


RUN mkdir -p /lint_app
WORKDIR /lint_app

COPY Gemfile Gemfile.lock setup_eslint.sh /lint_app/

# install javasript linter
RUN ./setup_eslint.sh

# install gems
RUN bundle install
