FROM ruby:2.6.6-slim-stretch

ENV RAILS_APP=production

RUN mkdir /app
WORKDIR /app

RUN apt update -qq && apt install -y build-essential libpq-dev yarn

COPY ./Gemfile* ./
RUN bundle install --with="default production" --deployment \
      && yarn install \
      && bundle exec rake assets:precompile

COPY . ./

ENTRYPOINT ["bash", "-c", "bundle exce rails s"]
