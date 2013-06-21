require 'bundler/capistrano'
load 'deploy/assets'

set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"

 
set :application, "greendrive"
set :ip_address, "149.210.141.143"
 
set :deploy_to, "/home/deploy/#{application}"
set :user, 'deploy'
set :use_sudo, false
 
set :scm, :git
set :repository, "git@github.com:robinvdijk/greendrive.git"
set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }
 
default_run_options[:pty] = true
 
role :web, ip_address
role :app, ip_address
role :db,  ip_address, :primary => true