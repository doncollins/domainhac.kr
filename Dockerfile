FROM ruby:3.0.1

RUN apt-get -y -qq update
RUN apt-get -y -qq install curl gnupg postgresql-client cron
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get -y -qq install nodejs
RUN npm install -g yarn

WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./

# https://stackoverflow.com/a/25924513
RUN gem install rake 
RUN bundle install

COPY package.json ./
COPY yarn.lock ./
RUN yarn

COPY . ./
RUN env RAILS_ENV=production ./bin/webpack

EXPOSE 3000