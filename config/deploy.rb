require 'capistrano/ext/multistage'

default_run_options[:pty] = true

set :application, "veganamongus"

set :scm, :git
set :repository,  "git@github.com:hollowmatt/veganamongus.git"
set :scm_passprhase, ""

set :stages, "production"
set :default_stage, "production"
set :keep_releases, 10

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


# if you want to clean up old releases on each deploy uncomment this:
after 'deploy:update_code', 'bundle:install'
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do
    transaction do
      update_code
      db.migrate
      precompile_assets
      create_symlink
    end
  end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join("/home/thevegan/veganamongus",'restart.txt')}"
  end
end

desc "precompile the assets"
task :precompile_assets, :roles => :web, :except => {:no_release => true} do
  #run "cd #{current_release}; rm -rf public/assets/*"
  run "cd #{current_release}; RAILS_ENV=production bundle exec rake assets:precompile --trace"
end

desc "make symlink to new release"
task :create_symlink, :roles => :app do
  run "ln -sf #{current_release}/public ~/public_html/recipes"
end

namespace :db do
  task :migrate, :roles => :db do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake db:migrate --trace"
  end
end