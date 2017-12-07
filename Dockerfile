FROM ruby:2.3.0-alpine

#RUN apk --update git
#RUN git clone https://github.com/staybuzz/sinatra-testapp app

COPY . /app
WORKDIR /app
RUN gem install bundler
RUN bundle install --path vendor/bundle

EXPOSE 4567

CMD ["bundle", "exec", "ruby", "app.rb"]
