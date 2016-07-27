source 'https://rubygems.org'

# the "~>" denotes that bundler will install minor updates, but not major

ruby "2.3.1"

gem 'rails', '~> 4.2.7'
gem 'sqlite3'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby
# Added to prevent errornous error messages
# gem 'execjs'
gem 'therubyracer'
# Add support for PostgreSQL
gem 'pg'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'figaro'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0' # the gem is used to compress assets
# add to test building of assets
gem 'jquery-rails'
gem 'jquery-ui-rails'
# in order to use encrypted passwords the following gem must be enabled
# bcrypt-ruby became deprecated, new name is just "bcrypt"
# in order to use 'has_secure_password' the below gem must be installed
gem 'bcrypt', '~> 3.1.7'
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
# To use Jbuilder templates for JSON
gem 'jbuilder', '~> 2.0'

# add gem to debug rails
gem 'pry'
# To use debugger
# gem 'debugger'

# add the following gem because Kevin uses it in his simple CMS
# Added to sort objects for "Simple CMS"
gem 'acts_as_list', '~> 0.3.0'

# add gem to get interactive console in error message window
gem 'binding_of_caller'

#Api Gems
gem 'active_model_serializers'

group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
end

# add puma to productoin
gem 'puma', group: :production