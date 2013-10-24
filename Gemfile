source 'https://rubygems.org'
ruby "2.0.0"

#Gems that are required in any environment, by defining the version of the gem we want to use
#we don't have to worry about updates causing unexpected issues.
gem 'rails', '4.0.0'
gem 'bootstrap-sass', '2.2.1.1'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', "3.0.3"
gem 'bootstrap-will_paginate', "0.0.9"
gem 'heroku' #for deploying to heroku for production testing
gem 'prawn' #pdf generation
gem 'pg' #db
gem 'pg_search' #text search on db
gem 'carrierwave' #image uploading
gem 'delayed_job_active_record' #for background jobs
gem 'daemons' #for starting delayed_jobs
gem 'roo'
gem 'haml-rails'
gem 'html2haml'

group :development do
  gem 'hpricot'
  gem 'ruby_parser'
end

#deployment!
gem 'unicorn' #app server
gem 'capistrano' #deployer

#remember to install imagemagick or this won't work!
gem 'rmagick' #for carrierwave thumbnail resizing

group :development, :test do
  gem 'rspec-rails', '>= 2.10.0'
  gem 'guard-rspec'
  gem 'annotate', '~> 2.4.1.beta'
  gem 'pry'
  gem 'pry-byebug'
end

  gem 'sass-rails', '4.0.1'
  gem 'coffee-rails', '4.0.1'
  gem 'uglifier', '2.1.1'
  gem 'jquery-rails', '3.0.4'
  gem 'turbolinks', '1.1.1'
  gem 'jbuilder', '1.0.2'

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'rb-fsevent', '0.9.1', :require => false
  gem 'growl'
  gem 'guard-spork'
  gem 'spork', '0.9.2'
  gem 'factory_girl_rails', '1.4.0'
  gem 'cucumber-rails', '1.2.1', require: false
  gem 'database_cleaner', '0.7.0'
end