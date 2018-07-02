# default deploy_config_path is 'config/deploy.rb'
set :deploy_config_path, 'cap/deploy.rb'
# default stage_config_path is 'config/deploy'
set :stage_config_path, 'cap/stages'

# previous variables MUST be set before 'capistrano/setup' # Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/rvm'
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

set :rvm_type, :user
set :rvm_ruby_version, '2.5.1'
set :rvm_map_bins, %{rake gem bundle ruby}

# Add the below line, see: https://stackoverflow.com/a/43021458/708807
require 'capistrano/puma'
install_plugin Capistrano::Puma # load_hooks: false  Default puma tasks
require "capistrano/nginx"
install_plugin Capistrano::Puma::Nginx

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('cap/tasks/*.rake').each { |r| import r }
