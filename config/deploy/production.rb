server "tardis.asmallorange.com", :app, :web, :db, :primary => true
set :deploy_to, "/home/thevegan/veganamongus"
set :user, "thevegan"

set :rails_env, 'production'
_cset :branch, 'master'

role :web, "tardis.asmallorange.com"                          # Your HTTP server, Apache/etc
role :app, "tardis.asmallorange.com"                          # This may be the same as your `Web` server
role :db,  "tardis.asmallorange.com", :primary => true        # This is where Rails migrations will run

desc "Link in the production database.yml and fix permissions"
task :after_update_code do
  run "find #{release_path}/public -type d -exec chmod 0755 {} \\;"
  run "find #{release_path}/public -type f -exec chmod 0644 {} \\;"
  run "chmod 0755 #{release_path}/public/dispatch.*"
end