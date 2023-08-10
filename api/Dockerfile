# Dockerfile.rails
FROM ruby:3.1.3 AS tenthings-backend

WORKDIR /app

RUN gem install rails bundler
RUN bundle install
RUN yarn install
ENV RUBYOPT="--enable-frozen-string-literal"
