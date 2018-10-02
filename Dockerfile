FROM starefossen/ruby-node:alpine
WORKDIR /cat-tool
COPY . /cat-tool
RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  sqlite-dev \
  && rm -rf /var/cache/apk/*

# Use libxml2, libxslt a packages from alpine for building nokogiri
RUN bundle config build.nokogiri --use-system-libraries
RUN gem install bundler
RUN bundle install
EXPOSE 3000
RUN rails db:migrate
CMD ["bundle", "exec", "rails", "s"]