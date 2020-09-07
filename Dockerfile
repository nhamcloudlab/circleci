FROM ruby:2.6.6-slim-stretch

ENV RAILS_APP=production

RUN mkdir /app
WORKDIR /app

RUN apt update -qq && apt install -y build-essential libpq-dev yarn

COPY . ./

ENTRYPOINT ["bash", "-c", "bundle exce rails s"]
