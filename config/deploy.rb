
lock '3.11.0'

set :application, 'tam84_v2'
set :repo_url, 'git@github.com:tam84/tam84_v2.git' # Edit this to match your repository
set :branch, :master
set :deploy_to, '/home/deploy/tam84_v2'
set :pty, true
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
#set :rvm_ruby_version, 'jruby-1.7.19' # Edit this if you are using MRI Ruby

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false


namespace :rails do
  desc "Open the rails console on primary app server"
  task :console do
    on roles(:app), primary: true do
      rails_env = fetch(:stage)
      execute_interactively "#{bundle_cmd} #{current_path}/rails console #{rails_env}"
    end
  end

  desc "Open the rails dbconsole on primary db server"
  task :dbconsole do
    on roles(:db), primary: true do
      rails_env = fetch(:stage)
      execute_interactively "#{bundle_cmd} #{current_path}/rails dbconsole #{rails_env}"
    end
  end

  def execute_interactively(command)
    user = fetch(:user)
    port = fetch(:port) || 22
    cmd = "ssh -l #{user} #{host} -p #{port} -t 'cd #{deploy_to}/current && #{command}'"
    info "Connecting to #{host}"
    exec cmd
  end

  def bundle_cmd
    if fetch(:rbenv_ruby)
      # FIXME: Is there a better way to do this? How does "execute :bundle" work?
      "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{File.join(fetch(:rbenv_path), '/bin/rbenv')} exec bundle exec"
    else
      "ruby "
    end
  end
end