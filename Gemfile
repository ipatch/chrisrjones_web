source 'https://rubygems.org'

# Notes
# don't ever edit the Gemfile.lock as bundler manages this file, edit this file instead.

# the main bunlde needed to create a RoR application
# gem 'rails', '3.2.15'

# the "~>" denotes that bundler will install minor updates, but not major

gem 'rails', '~> 4.1.1'

# the default bundle for SQL / database connectivity, default SQLite
gem 'sqlite3'

# Added to prevent errornous error messages
gem 'execjs'
gem 'therubyracer'

# Added to get mysql support
gem 'mysql2'

# Added to sort objects for "Simple CMS"
gem 'acts_as_list', '~> 0.4.0'

# Gems used only for assets and not required
# in production environments by default.
#group :assets do
	gem 'sass-rails', '~> 4.0.3'
  	# gem 'sass-rails',   '~> 3.2.3'
  	gem 'coffee-rails', '~> 4.0.1'
  	# gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  # gem 'uglifier', '>= 1.0.3'

gem 'jquery-rails'

# in order to use encrypted passwords the following gem must be enabled
# bcrypt-ruby became deprecated, new name is just "bcrypt"
gem 'bcrypt', '~> 3.1.7'

group :production do  
	# the below gem will only work with rails v3.x ...maybe
  	# gem 'rack-google-analytics', :require => 'rack/google-analytics'  
end

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

# Add support for twitter bootstrap, https://github.com/seyhunak/twitter-bootstrap-rails
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'less-rails'


# Add gem to support more verbose rails error messages
# gem 'better_errors', :git => 'git://github.com/charliesome/better_errors.git'
