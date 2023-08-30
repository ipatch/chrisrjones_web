# frozen_string_literal: true

source 'https://rubygems.org'

# `~>` denotes bundler will only install minor updates

# ruby '2.7.8'
# NOTE: ipatch, rails 5.2.x no compat with ruby v3.x
ruby '3.2.2'

gem 'rails', '~> 6.0'
# gem 'activerecord', '~> 5.2.8.15' # NOTE: ipatch, requires paid rails LTS

gem 'bcrypt', '~> 3.1.19' # `has_secure_password` requires this
gem 'bootstrap-sass', '~> 3.4.1'
gem 'jquery-rails', '~> 4.6.0'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'pg', '~> 1.5.3'
gem 'uglifier', '~> 4.2.0' # compress js css assets

# gem 'sassc-rails' # replaces `sass-rails`
gem 'sassc-rails', '~> 2.1.2'

# gem 'tzinfo', '~> 1.2.11'
gem 'tzinfo', '~> 2.0.6' # not rails 5.x compat

#--
# Add JS runtime, ie. Node.js V8
# SEE: `./config/boot.rb` for JS runtime settings

#--
# Profiling
gem 'derailed_benchmarks'
gem 'memory_profiler'

# API gems
# gem 'active_model_serializers', '~> 0.10.9'
gem 'fast_jsonapi', '~> 1.5'
gem 'jwt', '~> 2.7.1' # JSON web token authentication
gem 'rack-cors', '~> 2.0.1'

gem 'acts_as_list', '~> 1.1.0' # sort objects, "Simple CMS"
gem 'binding_of_caller', '~> 1.0.0' # irb in error window

gem 'addressable', '~> 2.8.5' # emojis in URLs
gem 'nokogiri', '~> 1.15.4' # XML HTML parser

# deployment gems
gem 'capistrano', '~> 3.12'
gem 'capistrano3-nginx', '~> 3.0.1'
gem 'capistrano-bundler', '~> 2.1.0'
gem 'capistrano-rails', '~> 1.4'
gem 'capistrano-rvm', '~> 0.1.2'
# gem 'capistrano3-puma', '~> 5.2.0'
gem 'capistrano3-puma', '~> 6.0.0.alpha.1'
gem 'redis', '~> 5.0', '>= 5.0.7'

group :development, :test do
  # gem 'debugger' # DEPRECATED
  gem 'byebug'
  gem 'erb_lint', require: false
  # gem 'factory_bot_rails', '~> 4.0' # 5.0.1 4.11.1
  gem 'factory_bot_rails', '~> 6.2.0' # 5.0.1 4.11.1
  gem 'pry', '~> 0.14.2' # debug
  # gem 'rspec-rails', '~> 5.1.2'
  gem 'rspec-rails', '~> 6.0.3'

  # NOTE: ipatch, exp with solargraph
  # gem "ruby-lsp", require: false
  # NOTE: ipatch, `ruby-lsp-rails` requires rails >= v6.0
  # gem "ruby-lsp-rails"

  gem 'rubocop', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'yard', require: false
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.1.0'
  gem 'faker', '~> 3.1.1'
  gem 'shoulda-matchers', '~> 5.3.0'
  gem 'simplecov'
  gem 'timecop'
end

# add puma to productoin
group :production do
  gem 'puma', '~> 6.3.0'
end
