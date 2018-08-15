FROM ruby:2.5.0-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential \
    libsqlite3-dev \
    nodejs \
    sqlite3 \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
