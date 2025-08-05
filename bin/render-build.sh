#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean

# 本番環境でマイグレーション実行
RAILS_ENV=production bundle exec rake db:migrate