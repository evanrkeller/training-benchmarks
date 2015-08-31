source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record in development and test
gem 'pg', group: [:development, :test]

# Use MySQL as the database for Active Record in production
gem 'mysql2', group: :production

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'haml-rails'
gem 'bootstrap-generators', '~> 3.3.1'
gem 'date_range_formatter'

gem 'devise'
gem 'acts_as_list'

gem 'gravatarify', '~> 3.0.0'

gem 'rails_12factor', group: :production

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'rack-timeout'

gem 'puma'
gem 'foreman'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development
gem 'capistrano-puma'
gem 'capistrano-rbenv'
gem 'capistrano-bundler'

group :test do
  gem 'simplecov', require: false
  gem 'shoulda-matchers', require: false
  gem 'rake'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'

  gem 'database_cleaner'

  gem 'i18n-tasks', '~> 0.7.10'

  gem 'pry'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'rubocop', require: false

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails', '~> 3.0'
end

