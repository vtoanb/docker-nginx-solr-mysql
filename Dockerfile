# Dockerfile
FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential

# postgres
RUN apt-get install -y libpq-dev

# nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# JS runtime
RUN apt-get install -y nodejs

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
