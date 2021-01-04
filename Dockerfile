FROM ruby:2.6.3
RUN apt-get update 
RUN apt-get install -y \
	build-essential \
	libpq-dev \
	nodejs \
	postgresql-client \
	yarn

WORKDIR /share-fitness
COPY Gemfile Gemfile.lock /share-fitness/
RUN gem install bundler
RUN gem install rails
RUN bundle install
