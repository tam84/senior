  app = "manabalss" # App-specific
  root = "/home/deployer/apps/#{app}"

  workers  5
  threads  1, 1 # relying on many workers for thread-unsafe apps

  rackup      DefaultRackup
  port        11592
  environment ENV['RACK_ENV'] || 'production'
  daemonize   true

  pidfile "#{root}/puma/puma.pid"
  stdout_redirect "#{root}/puma/puma.log", "#{root}/puma/puma_error.log"
  bind "unix:/tmp/puma.socket
