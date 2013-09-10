ruby '2.0.0'

source 'https://rubygems.org'

gem 'rails', '4.0.0'

# DB.
gem 'pg'
gem 'squeel'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

gem 'bootstrap-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# AngularJS
gem 'angularjs-rails'
# gem "angular-faye-rails"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'timecop'

  # Pretty printed test output
  gem 'turn', '~> 0.9.4', require: false
end
group :test, :development do
  gem 'rspec-rails'
  gem 'ffaker'
  gem "jasminerice", :git => 'https://github.com/bradphelan/jasminerice.git'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-recipes', git: 'https://github.com/auxilium/capistrano-recipes.git'
  # gem 'rack-mini-profiler'
  gem 'deprecated'
  gem 'ffaker'
end
gem 'awesome_print', group: %w{test development console}

# Dev server
gem 'puma'
gem 'thin'

# Auth
gem 'devise'

# I18n, L10n
gem 'r18n-rails'

# Views
gem 'slim-rails'
gem 'kramdown'
gem 'simple_form', '3.0.0.rc'
# gem 'cells'

# Media
gem 'carrierwave'
gem 'mini_magick'

# Custom configuration
gem 'rails_config'

# Async services
gem 'sucker_punch', '~> 1.0'
gem 'faye'

# Zoo =)
gem 'monadic'

# Replacement for select boxes
gem 'select2-rails'
