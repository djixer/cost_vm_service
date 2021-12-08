FROM ruby:2.7
WORKDIR /usr/src
COPY . .
RUN bundle install
EXPOSE 5678
CMD ruby application.rb
