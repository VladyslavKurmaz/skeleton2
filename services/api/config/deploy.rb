# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.17.1'

set :application, 'new_project_name'
set :repo_url, 'git@gitlab.sloboda-studio.com:yaroslav/new_project_name.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, '/home/deploy/new_project_name/'
set :stages, %w[production staging]
set :default_stage, 'staging'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for default_env is {}
set :default_env, { path: '/opt/ruby/bin:$PATH' }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# Rbenv specific settings to run eny ruby related commands
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, '/home/deploy/.rbenv/bin/rbenv exec'

set :pty, true
set :linked_files, fetch(:linked_files, []).push('config/master.key', 'config/database.yml')
set :linked_dirs,
    fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/uploads')
set :ssh_options,
    { forward_agent: true, user: fetch(:user), keys: %w[~/.ssh/id_rsa.pub], known_hosts: Net::SSH::KnownHosts }

# Puma settings
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_role, :app
set :puma_threads, [0, 8]
set :puma_init_active_record, true
# Disabled to decrease memory usage
set :puma_preload_app, false

# puma workers, 0 can be sufficient for staging
set :puma_workers, 0
set :puma_worker_timeout, nil

# shared files for Puma
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock" # accepts array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"

# Delayed Job configuration
set :delayed_job_workers, 1
set :delayed_job_queues, ['default']
set :delayed_job_monitor, true
set :delayed_log_dir, "#{shared_path}/log/delayed_job.log"
set :delayed_job_pid_dir, "#{shared_path}/tmp/pids/delayed_job.pid"
