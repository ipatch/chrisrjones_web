source 'https://rubygems.org'

# crj.com

# `~>` denotes bundler will only install minor updates

ruby '2.6.2'

gem 'rails', '~> 5.2.3'

gem 'pg', '1.1.4'
gem 'coffee-rails', '~> 4.2.2'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'uglifier', '4.1.20' # compress assets, ie. js css

# gem 'sassc-rails' # replaces `sass-rails`
gem 'sassc-rails'

###
# Add JS runtime, ie. Node.js V8
# SEE: `./config/boot.rb` for JS runtime settings

gem 'bootstrap-sass', '~> 3.4.1'

gem 'bcrypt', '~> 3.1.7' # `has_secure_password` requires this
gem 'jbuilder', '~> 2.0' # JSON templating

gem 'pry', '~> 0.12.2' # add gem to debug rails

# gem 'debugger' # DEPRECATED, use `byebug`
# gem 'byebug'

gem 'acts_as_list', '~> 0.9.17' # sort objects, "Simple CMS"
gem 'binding_of_caller', '~> 0.8.0' # irb in error window

# gem 'active_model_serializers', '~> 0.10.7' #Api Gems

gem 'nokogiri', '~> 1.10.2'
gem 'addressable', '~> 2.5.2'

gem 'capistrano', '~> 3.10', '>= 3.10.1'
gem 'capistrano-rvm', '~> 0.1.2'
gem 'capistrano-rails', '~> 1.3', '>= 1.3.1'
gem 'capistrano-bundler', '~> 1.3'
gem 'capistrano3-puma', '~> 3.1', '>= 3.1.1'
gem 'capistrano3-nginx', '~> 3.0.1'

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
end

# add puma to productoin
group :production do
  gem 'puma', '~> 3.12'
end
