# FROM ruby:2.6.3-alpine3.10
FROM ruby:2.6.3-alpine3.10@sha256:a546d6c5f530bbcc2d41fbf0da21d94da9f70cba2997c82b57b06ea6a2ef155d

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
