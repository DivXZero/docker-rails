# Use the latest stable version of Ruby
FROM ruby:2.4.1

# Set maintainer info (deprecated -- purely for display)
MAINTAINER Nicholaus Brabant <nicholaus.brabant@gmail.com>

# Set environment variables and working directory
ENV APP_PATH /docker-rails
WORKDIR $APP_PATH

# Install dependencies
#
# build-essential   Install compilers and other necessary dev tools
# nodejs            Server-side javascript interpreter
# libpq-dev         Postgres development package; Required to install the pg (postgres) gem
#
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    nodejs \
    libpq-dev

# Copy Gemfile to the container and run bundler to install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Map the project directory between the host and container
ADD . .
