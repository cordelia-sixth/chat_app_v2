# dev_template
Railsを使ったチャットアプリです。

## 起動手順
1. プロジェクトルートに `.env` を作成し、mysqlに接続するためのパスワードを設定する。

```
touch .env
```

```
MYSQL_ROOT_PASSWORD=password
```

2. dockerイメージをビルドする

```
docker-compose build --no-cache
```

3. `rails/config/database.yml` を編集する

```
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: <%= ENV['MYSQL_ROOT_PASSWORD'] %>  # this
  host: db  # this
```

4. dockerコンテナを起動する

```
docker-compose up
```

5. 別ターミナルからコンテナにログインしてDBを作成する

```
docker-compose run app rails db:create
```