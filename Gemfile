source 'https://rubygems.org'

# crj.com

# `~>` denotes bundler will only install minor updates

ruby "2.5.3"

gem 'rails', '~> 4.2.11.1'

#
# NOTE: pg v0.20.0 will not display deprecation warnings
#

gem 'pg', '1.1.4'
gem 'coffee-rails', '~> 4.2.2'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'uglifier', '4.1.20' # compress assets, ie. js css
# gem 'sassc' # updated sass engine for working with sass based projects using ruby
gem 'sassc-rails'
# gem 'sass-rails', '~> 5.0' # deprecated

###
# Add JS runtime, ie. Node.js V8
# SEE: `./config/boot.rb` for JS runtime settings

gem 'bootstrap-sass', '~> 3.4.1'

gem 'bcrypt', '~> 3.1.7' # `has_secure_password` depends on this gem
gem 'jbuilder', '~> 2.0' # JSON templating

gem 'pry', '~> 0.12.2' # add gem to debug rails

# gem 'debugger' # To use debugger

gem 'acts_as_list', '~> 0.9.17' # used to sort objects for "Simple CMS"
gem 'binding_of_caller', '~> 0.8.0' # interactive console in error message window

# gem 'active_model_serializers', '~> 0.10.7' #Api Gems

gem 'nokogiri', '~> 1.8.2'
gem 'addressable', '~> 2.5.2'

# group :development do
  gem 'capistrano', '~> 3.10', '>= 3.10.1'
  gem 'capistrano-rvm', '~> 0.1.2'
  gem 'capistrano-rails', '~> 1.3', '>= 1.3.1'
  gem 'capistrano-bundler', '~> 1.3'
  gem 'capistrano3-puma', '~> 3.1', '>= 3.1.1'
  gem 'capistrano3-nginx', '~> 3.0.1'
# end

# add puma to productoin
group :production do
  gem 'puma', '~> 3.12'
end
