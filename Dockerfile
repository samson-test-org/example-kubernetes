# FROM ruby:2.4.2-alpine3.7
FROM ruby@sha256:01768232842e9686435f59619e67107a9735cbed999df55b6a85de18f96ed6de

RUN mkdir /app && \
  apk add --update --no-cache bash su-exec dumb-init build-base

WORKDIR /app

# bundle with minimum files to keep layer cached
ADD .ruby-version Gemfile Gemfile.lock ./
RUN bundle install --quiet --deployment --jobs 4

ADD bin bin
ADD test test
ADD kubernetes kubernetes

USER nobody

CMD ["bin/run.rb"]
