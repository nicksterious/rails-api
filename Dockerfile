FROM ruby:3.0.6-alpine3.16

COPY app /app
WORKDIR /app

RUN apk add --no-cache --update build-base bash jq curl libffi-dev

RUN gem install bundler
RUN bundle install

EXPOSE 3000
EXPOSE 80
