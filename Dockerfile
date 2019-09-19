FROM ruby:2.6-slim
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

COPY setup_eslint.sh /lint_app/

# install javasript linter
RUN ./setup_eslint.sh

COPY Gemfile Gemfile.lock bitbucket_client.rb /lint_app/

RUN git clone https://github.com/prontolabs/pronto pronto_source \
  && cp bitbucket_client.rb pronto_source/lib/pronto/clients/bitbucket_client.rb \
  && cd pronto_source \
  && git checkout 930d164e85024646b084d04d503fdab9a1a58414 \
  && gem build pronto.gemspec \
  && mkdir ../pronto \
  && cp pronto-0.10.0.gem ../pronto \
  && cd .. \
  && rm -Rf pronto_source \
  && gem install pronto/pronto-0.10.0.gem

# install gems
RUN gem install bundler && bundle install && bundle binstubs pronto --force
