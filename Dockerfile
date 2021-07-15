FROM ruby:2.5.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN gem install rake -v 13.0.4
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]]