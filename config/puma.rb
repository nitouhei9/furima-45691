# config/puma.rb

max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

worker_count = ENV.fetch("WEB_CONCURRENCY") { 2 }
workers worker_count

environment ENV.fetch("RAILS_ENV") { "production" }

app_dir    = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/tmp"

bind "tcp://0.0.0.0:3000"

pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"

stdout_redirect "#{shared_dir}/logs/puma.stdout.log", "#{shared_dir}/logs/puma.stderr.log", true

daemonize true
preload_app!
plugin :tmp_restart
