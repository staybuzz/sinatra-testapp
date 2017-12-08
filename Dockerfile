FROM ruby:2.4.2-alpine

#RUN apk --update git
#RUN git clone https://github.com/staybuzz/sinatra-testapp app

COPY . /app
WORKDIR /app
RUN gem install bundler
RUN apk add --update --no-cache sqlite-dev build-base
RUN bundle install --path vendor/bundle
RUN bundle exec rake db:migrate

EXPOSE 4567

CMD ["bundle", "exec", "ruby", "app.rb"]
