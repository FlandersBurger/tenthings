# Dockerfile.rails
FROM ruby:3.1.3 AS tenthings-backend

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

# Install backend
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH
COPY api/ .
RUN rm -rf node_modules vendor

RUN gem install rails bundler
RUN bundle install
RUN yarn install
ENV RUBYOPT="--enable-frozen-string-literal"

RUN mkdir -p tmp/pids

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]