# frozen_string_literal: true

server '0.0.0.0',
       user: 'deploy',
       roles: %w[app db web],
       primary: true
set :branch, 'staging'

# Explicit environment setting for rails and puma.
set :rails_env, 'staging'
set :puma_env, fetch(:rails_env, 'staging')

# Link to staging credentials key
set :linked_files, fetch(:linked_files, []).push('config/credentials/staging.key')

# Redefine default behavior for SSH connect, ignore local ~/.ssh/config file
set :ssh_options, config: false
