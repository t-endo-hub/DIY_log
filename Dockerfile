FROM ruby:2.5.7

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# コンテナ起動した時に、コンテナ内でmyappディレクトリを作成
RUN mkdir /DIY_log
# 作業ディレクトリを指定
WORKDIR /DIY_log

COPY Gemfile /DIY_log/Gemfile
COPY Gemfile.lock /DIY_log/Gemfile.lock

ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler
RUN bundle install

# アプリケーション(カレントディレクトリ)をコピーして、コンテナ内のディレクトリに貼り付け
COPY . /DIY_log

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]

