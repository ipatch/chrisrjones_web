# frozen_string_literal: true

# config/application.rb for chrisrjones_rails
#
require File.expand_path('boot', __dir__)

require 'rails/all'
require 'yaml'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kernel #:nodoc:
end

# pg 1.0 gem has migrated constants, but ActiveRecord 4.2 still reqs
PGconn = PG::Connection
PGresult = PG::Result
PGError = PG::Error

module CrjCom
  # base class for application
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over these
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # configure JS engine, no coffescript
    config.generators.javascript_engine = :js

    # EXP
    config.autoload_paths << Rails.root.join('lib')

    # Do not swallow errors in after_commit/after_rollback callbacks.
    # config.active_record.raise_in_transactional_callbacks = true

    config.before_configuration do
      env_file = Rails.root.join('config', 'secrets.yml').to_s
      if File.exist?(env_file)
        YAML.load_file(env_file)[Rails.env].map do |key, value|
          ENV[key.to_s] = value.to_s
        end
      end
    end

    # Run `rake -D time` to list avail timezones . Default is UTC.
    config.time_zone = 'Central Time (US & Canada)'

    # default locale = :en translations in config/locales/*.rb,yml autoloaded
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    # Configure the default encoding used in templates Ruby 1.9
    config.encoding = 'utf-8'

    # filter sensitive parameters from log file(s).
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # UPGRADE: rails from v4.2 to 5.x
    # ActiveSupport.halt_callback_chains_on_return_false = false

    # setup CORS to connect rails API to JS client
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:3000', '127.0.0.1:300', 'http://localhost:4000'
        resource '/api/*', credentials: false, headers: :any, methods: %i[get post options]
      end

      # allow do
      #   origins '*'
      #   resource '/api/*', headers: :any, methods: :get
      # end
    end
  end
end
