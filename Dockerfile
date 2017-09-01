FROM ruby:2.4.1-slim
MAINTAINER Armin Kirchner <post.armin@gmail.com>

# Dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential \
      curl \
      cmake \
      bash-completion \
      pkg-config \
      git \
      ssh-client

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
      && apt-get install -qq -y --no-install-recommends nodejs


RUN mkdir -p /lint_app
WORKDIR /lint_app

COPY Gemfile Gemfile.lock setup_eslint.sh /lint_app/

# install javasript linter
RUN ./setup_eslint.sh

# install gems
RUN bundle install
