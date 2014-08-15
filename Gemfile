source 'https://rubygems.org'

# Notes
# don't ever edit the Gemfile.lock as bundler manages this file, edit this file instead.

# the "~>" denotes that bundler will install minor updates, but not major

gem 'rails', '~> 4.1.1'

# the default bundle for SQL / database connectivity, default SQLite
# the below gem is not needed as I'm using MySQL DB
# gem 'sqlite3'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby
# Added to prevent errornous error messages
# gem 'execjs'
gem 'therubyracer'

# Added to get mysql support
gem 'mysql2'

# Added to sort objects for "Simple CMS"
gem 'acts_as_list', '~> 0.4.0'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails', '~> 4.0.3'

gem 'coffee-rails', '~> 4.0.1'

# the below gem is used to compress assets
gem 'uglifier', '>= 1.3.0'

# add to test building of assets
gem 'jquery-rails'
gem 'jquery-ui-rails'

# in order to use encrypted passwords the following gem must be enabled
# bcrypt-ruby became deprecated, new name is just "bcrypt"
gem 'bcrypt', '~> 3.1.7'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
gem 'jbuilder', '~> 2.0'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# Add support for twitter bootstrap, https://github.com/seyhunak/twitter-bootstrap-rails
gem 'less-rails'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'



# Add gem to support more verbose rails error messages
gem 'better_errors', :git => 'git://github.com/charliesome/better_errors.git'