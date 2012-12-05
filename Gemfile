source 'https://rubygems.org'

gem 'rails', '3.2.9'

gem 'omniauth'
gem 'omniauth-facebook', '< 1.4.1'
gem 'carrierwave'
gem 'rmagick'
gem 'httparty'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
  gem 'quiet_assets'
  gem 'rspec-rails', '>=2.11.0'
  gem 'factory_girl_rails', '>= 4.1.0'
  gem 'guard-rspec'
  gem 'minitest'
  platform :ruby_19 do
    gem 'linecache19', :git => 'git://github.com/mark-moseley/linecache'
    gem 'ruby-debug-base19x', '~> 0.11.30.pre4'
    gem "ruby-debug19"
  end
  gem 'quiet_assets'
end
gem 'pry-rails', :group => :development


group :test do

  gem 'faker'
  gem 'capybara', ">= 1.1.2"
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'bootstrap-sass', '~> 2.2.1.1'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
