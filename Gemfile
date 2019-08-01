# frozen_string_literal: true

source 'https://rubygems.org'

# crj.com

# `~>` denotes bundler will only install minor updates

ruby '2.6.3'

gem 'rails', '~> 5.2.3'

gem 'bcrypt', '~> 3.1.12' # `has_secure_password` requires this
gem 'bootstrap-sass', '~> 3.4.1'
gem 'jquery-rails', '~> 4.3.3'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'pg', '~> 1.1.4'
gem 'uglifier', '~> 4.1.20' # compress assets, ie. js css

# gem 'sassc-rails' # replaces `sass-rails`
gem 'sassc-rails', '~> 2.1.1'

###
# Add JS runtime, ie. Node.js V8
# SEE: `./config/boot.rb` for JS runtime settings

###
# Profiling
gem 'derailed_benchmarks'
gem 'memory_profiler'

# API gems
gem 'fast_jsonapi', '~> 1.5'
gem 'jwt', '~> 2.1.0' # authenticate using JSON web tokens
gem 'rack-cors', '~> 1.0.3'
# gem 'active_model_serializers', '~> 0.10.9' #Api Gems

gem 'acts_as_list', '~> 0.9.19' # sort objects, "Simple CMS"
gem 'binding_of_caller', '~> 0.8.0' # irb in error window

gem 'addressable', '~> 2.6.0' # emojis in URLs
gem 'nokogiri', '~> 1.10.3' # XML HTML parser

gem 'capistrano', '~> 3.11'
gem 'capistrano-bundler', '~> 1.5'
gem 'capistrano-rails', '~> 1.4'
gem 'capistrano-rvm', '~> 0.1.2'
gem 'capistrano3-nginx', '~> 3.0.1'
gem 'capistrano3-puma', '~> 3.1.1'

group :development, :test do
  # gem 'debugger' # DEPRECATED, use `byebug`
  # gem 'byebug'
  gem 'factory_bot_rails', '~> 4.0' # 5.0.1 4.11.1
  gem 'pry', '~> 0.12.2' # add gem to debug rails
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  gem 'database_cleaner', '~> 1.7.0'
  gem 'faker', '~> 1.9.3'
  gem 'shoulda-matchers', '~> 3.1' # 4.0.1
end

# add puma to productoin
group :production do
  gem 'puma', '~> 3.12.1'
end
