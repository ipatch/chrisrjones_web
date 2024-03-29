# frozen_string_literal: true

source 'https://rubygems.org'

# `~>` denotes bundler will only install minor updates

ruby '2.7.8'
# NOTE: ipatch, rails 5.2.x no compat with ruby v3.x
# ruby '3.0.6' # nova

gem 'rails', '~> 5.2.8.1'
# gem 'activerecord', '~> 5.2.8.15' # NOTE: ipatch, requires paid rails LTS

gem 'bcrypt', '~> 3.1.12' # `has_secure_password` requires this
gem 'bootstrap-sass', '~> 3.4.1'
gem 'jquery-rails', '~> 4.5.1'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'pg', '~> 1.4.6'
gem 'uglifier', '~> 4.2.0' # compress js css assets

# gem 'sassc-rails' # replaces `sass-rails`
gem 'sassc-rails', '~> 2.1.1'

gem 'tzinfo', '~> 1.2.11'
# gem 'tzinfo', '~> 2.0.6' # not rails 5.x compat

#--
# Add JS runtime, ie. Node.js V8
# SEE: `./config/boot.rb` for JS runtime settings

#--
# Profiling
gem 'derailed_benchmarks'
gem 'memory_profiler'

# API gems
gem 'fast_jsonapi', '~> 1.5'
gem 'jwt', '~> 2.7.0' # authenticate using JSON web tokens
gem 'rack-cors', '~> 2.0.1'
# gem 'active_model_serializers', '~> 0.10.9' #Api Gems
gem 'acts_as_list', '~> 1.1.0' # sort objects, "Simple CMS"
gem 'binding_of_caller', '~> 1.0.0' # irb in error window

gem 'addressable', '~> 2.8.0' # emojis in URLs
gem 'nokogiri', '~> 1.14.5' # XML HTML parser

gem 'capistrano', '~> 3.12'
gem 'capistrano-bundler', '~> 2.1.0'
gem 'capistrano-rails', '~> 1.4'
gem 'capistrano-rvm', '~> 0.1.2'
gem 'capistrano3-nginx', '~> 3.0.1'
# gem 'capistrano3-puma', '~> 5.2.0'
gem 'capistrano3-puma', '~> 6.0.0.alpha.1'

group :development, :test do
  # gem 'debugger' # DEPRECATED, use `byebug`
  # gem 'byebug'
  gem 'factory_bot_rails', '~> 4.0' # 5.0.1 4.11.1
  gem 'pry', '~> 0.14.2' # debug
  gem 'rspec-rails', '~> 5.1.2'
end

group :test do
  gem 'database_cleaner', '~> 1.7.0'
  gem 'faker', '~> 3.1.1'
  gem 'shoulda-matchers', '~> 5.3.0'
end

# add puma to productoin
group :production do
  # gem 'puma', '~> 5.6.5'
  gem 'puma', '~> 6.0.2'
end

