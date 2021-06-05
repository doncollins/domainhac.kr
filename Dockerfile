FROM timbru31/ruby-node:3.0

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install

COPY package.json ./
COPY yarn.lock ./
RUN yarn

COPY . ./
RUN bin/webpack

EXPOSE 3000