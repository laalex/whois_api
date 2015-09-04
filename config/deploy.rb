# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'whois_api'
set :repo_url, 'git@github.com:laalex/whois_api.git'
set :scm, :git

set :deploy_to, "/home/deploy/whois_api"

set :pty, false
set :format, :pretty



namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
