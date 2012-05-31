require 'bundler/capistrano'

server "50.116.60.38", :web, :db, :app, primary: true
set :user, "root"
set :application, "Demobot"

set :deploy_to, "/home/apps/#{application}"
set :deploy_via, :remote_cache


set :scm, "git"
set :repository,  "git@github.com:HungryAcademyTeam4/sinatra_demo.git"
set :branch, "master"

default_run_options[:pty] = true

  desc "Start the Thin processes"
  task :start do
    sudo "bundle exec ruby ./app"
  end
