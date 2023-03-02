# match .ruby-version
FROM ruby:3.1.2-alpine

RUN mkdir /app && \
  apk add --update --no-cache bash su-exec dumb-init build-base

WORKDIR /app

# bundle with minimum files to keep layer cached
ADD .ruby-version Gemfile Gemfile.lock ./
RUN bundle install --quiet --deployment --jobs 4

ADD bin bin
ADD test test
ADD kubernetes kubernetes

# Run as unprivileged user "nobody" (names do not satisfy runAsNonRoot)
USER 65534

CMD ["bin/run.rb"]
