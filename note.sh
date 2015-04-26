# https://github.com/kaosf/monexpapp

# Rails 4.2.1をインストールするやでコマンド
gem install rails -v 4.2.1

rbenv rehash # rbenv 使ってる人は忘れないで

# Railsアプリケーション作成するやでコマンド
rails new twcopy -T -B
cd twcopy

# Edit Gemfile
# Remove sqlite3
# Add mongoid ~> 4.0.0
# Add rspec-rails 3.2.1
# Add mongoid-rspec 2.2.0

# 後で教える: どうやって最新のバージョン番号を調べる？

bundle install
# 以下でもいいよ
#bundle install --path vendor/bundle
# 更にわかる人は以下でもいいよ
#bundle install --path vendor/bundle --binstubs .bundle/bin

# Mongoid使うんやで設定
rails g mongoid:cnfig

# RSpec使うんやで設定
rails g rspec:install

# ActiveRecord使えへんねん設定
# Edit config/application.rb

# 7行目 require 'activereco... 削除

# # Do not swallow errors in after_commit/after_rollback callbacks.
# config.active_record.raise_in_transactional_callbacks = true

# ↑この2行削除

# Edit config/environments/development.rb


# # Raise an error on page load if there are pending migrations.
# config.active_record.migration_error = :page_load

# ↑この2行削除

# Edit config/environments/production.rb

# # Do not dump schema after migrations.
# config.active_record.dump_schema_after_migration = false

# ↑この2行削除

# Edit spec/rails_helper.rb

# # Checks for pending migrations before tests are run.
# # If you are not using ActiveRecord, you can remove this line.
# ActiveRecord::Migration.maintain_test_schema!

# ↑この3行削除

rails g scaffold item name:string price:integer

# HTTPサーバ起動
rails s
# Ctrl-C で終了

# Rubyのコードで色々確認
rails c
# Ctrl-D, exitと打つ，quitと打つ，などで終了

# Edit Gemfile
# Add twitter-bootstrap-rails 3.2.0
bundle install

# Twitter Bootstrap を使うやで設定
rails g bootstrap:install static
rails g bootstrap:layout application

# Edit Gemfile
# Add devise 3.4.1
bundle install

rails g devise:install
rails g devise user

#Sing in new_user_session_path
#Sing up new_user_registration_path
#Sing out destroy_user_session_path

## 要件
#つぶやきが投稿出来る
rails g model tweet body:text user:references
rails g controller tweets
#POST '/tweets' => 'tweets#create'

# embedded_in を belongs_to に直す

#ユーザ一覧が出る
#GET /users
#app/controllers/users_controller.rb
#app/views/users/index.html.erb
#get '/users' => 'users#index'

#ユーザ一覧はログインしていなければ見れない
#フォローするボタンが出る
#ボタンを押すことでフォロー関係になる
#フォローしていないユーザのみボタンが出る

rails g model following \
  from_user:references \
  to_user:references

#/timeline というルーティングがある
#get '/timeline' => '****#index'
#フォローしているユーザのつぶやきが一覧表示される
#  (ユーザ名，つぶやき内容)

## 画像投稿
#paperclip
#carrierwave
