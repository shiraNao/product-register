# Ruby 2.5 を使用
FROM ruby:2.5

# 作業ディレクトリを指定
WORKDIR /product-register

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn

# Gemfile と Gemfile.lock をコピー
COPY Gemfile Gemfile.lock /product-register/

# RubyGems のバージョンを手動で更新
RUN gem install rubygems-update -v '3.3.22' && \
    update_rubygems

# 依存関係をインストール
RUN bundle install

# 残りのソースコードをコピー
COPY . /product-register
