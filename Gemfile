source 'https://rubygems.org'
ruby "2.0.0-p247"
gem 'rails', '4.0.2'
gem 'pg'

group :assets do
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development do
  gem "rspec-rails", :group => [:development, :test]
  gem 'annotate', :git => 'git://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :development, :test do
  gem 'capistrano'
  gem 'capistrano-ext'
  #gem 'capistrano-unicorn'
  gem 'capistrano-rvm'
  gem 'rvm'
end

gem 'jquery-rails'
#gem "unicorn", ">= 4.3.1", :group => :production
gem "haml"
gem "hpricot", :group => :development
gem "ruby_parser", :group => :development
gem "email_spec", :group => :test
gem "database_cleaner", :group => :test
gem "launchy", :group => :test
gem "factory_girl_rails", :group => [:development, :test]
gem "bootstrap-sass", "= 2.1.0.1"
#gem 'bootstrap-sass-rails'
gem 'font-awesome-rails'
gem "devise"
gem "cancan"
gem "rolify"
gem "simple_form"
gem "quiet_assets", :group => :development
gem "will_paginate"
gem 'carrierwave'
gem 'mini_magick'
gem 'therubyracer'
gem 'sass-rails'

