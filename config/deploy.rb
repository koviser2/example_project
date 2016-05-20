load "config/capistrano/helpers"

# Params
set :site_name,   "**site_name**"
set :server_addr, "**server_addr**"
set :application, site_name

# base vars
set :gemset_name, "pronto_films"
set :user,        :pronto_films
set :socket_name, :pronto_films_server
set :users_home,  "/home/pronto_films"
set :deploy_to,   users_home
default_run_options[:shell] = "/bin/bash --login"

# helper vars
# set :rvm_src, 'source /opt/rvm/scripts/rvm' # global rvm
set :rvm_src, 'source "$HOME/.rvm/scripts/rvm"'
set :gemset,  _join([rvm_src, "rvm gemset use #{gemset_name} "])
set :app_env, "RAILS_ENV=production "
set :to_app,  "cd #{release_path} "

# deploy params
set :scm,         :git
set :deploy_via,  :remote_cache
server server_addr, :app, :web, :db, primary: true

# main repo params
set :repository,  "**repository**"
set :branch do
  puts "Stage: production"
  tag_name = Capistrano::CLI.ui.ask "Branch/Tag/SHA to deploy: "
  raise Exception.new('Branch, Tag, or Commit SHA is required to deploy') if tag_name.empty?
  tag_name
end

# connection params
set :use_sudo, false
default_run_options[:pty] = true
set :ssh_options, { forward_agent: true }


# releases cleanup
set :keep_releases, 3
after "deploy:restart", "deploy:cleanup"

# Tasks
load "config/capistrano/web_server"
# load "config/capistrano/private_pub"
# load "config/capistrano/sidekiq"
load "config/capistrano/app"

# precompile assets before App reboot
before "deploy:create_symlink", "app:assets_build"

namespace :deploy do
  task :migrate do
    app.db_create
    app.db_migrate
  end

  task :restart, roles: :app, except: { no_release: true } do
    app.symlinks
    app.db_migrate
    web_server.restart
  end

  task :db_update do
    deploy.update_code
    deploy.finalize_update
    app.symlinks
    app.bundle
    app.db_migrate
  end
end
