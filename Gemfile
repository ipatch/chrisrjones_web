source 'https://rubygems.org'

# the "~>" denotes that bundler will install minor updates, but not major

ruby "2.3.1"

gem 'rails', '~> 4.2.7'
gem 'sqlite3', '~> 1.3', '>= 1.3.13'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby
# Added to prevent errornous error messages
# gem 'execjs'
gem 'therubyracer', '~> 0.12.3'
# Add support for PostgreSQL
# gem 'pg', '~> 1.0' <= too new for rails 4.x
# gem 'pg', '~> 1.0'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'figaro', '~> 1.1', '>= 1.1.1'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0' # the gem is used to compress assets
# add to test building of assets
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
# in order to use encrypted passwords the following gem must be enabled
# bcrypt-ruby became deprecated, new name is just "bcrypt"
# in order to use 'has_secure_password' the below gem must be installed
gem 'bcrypt', '~> 3.1.7'
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
# To use Jbuilder templates for JSON
gem 'jbuilder', '~> 2.0'

# add gem to debug rails
gem 'pry', '~> 0.11.3'
# To use debugger
# gem 'debugger'

# add the following gem because Kevin uses it in his simple CMS
# Added to sort objects for "Simple CMS"
gem 'acts_as_list', '~> 0.3.0'

# add gem to get interactive console in error message window
gem 'binding_of_caller', '~> 0.8.0'

#Api Gems
gem 'active_model_serializers', '~> 0.10.7'

# update nokogirl
gem 'nokogiri', '~> 1.8.2'

group :development do
  gem 'capistrano', '~> 3.10', '>= 3.10.1' ,       require: false
  gem 'capistrano-rvm', '~> 0.1.2',                require: false
  gem 'capistrano-rails', '~> 1.3', '>= 1.3.1',    require: false
  gem 'capistrano-bundler', '~> 1.3',              require: false
  gem 'capistrano3-puma', '~> 3.1', '>= 3.1.1',    require: false
end

# add puma to productoin
group :production do
  gem 'pg', '~> 1.0'
  gem 'puma', '~> 3.11', '>= 3.11.2'
end
