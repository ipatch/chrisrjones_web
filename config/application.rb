# config/application.rb for CrjCom

require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'yaml'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# NOTE: fix, for working with pg v1.x gem in a rails v4.2 app
module Kernel
  # rails v4.2
  # def gem_with_pg_fix(dep, *reqs)
  #   if dep == 'pg' && reqs == ['~> 0.15']
  #     reqs = ['~> 1.0']
  #   end
  #   gem_without_pg_fix(dep, *reqs)
  # end

  # rails v4.2
  # alias_method_chain :gem, :pg_fix

  # rails v5.x
  # alias_method :gem, :gem_with_pg_fix
end
# pg 1.0 gem has migrated constants, but ActiveRecord 4.2 still reqs
PGconn = PG::Connection
PGresult = PG::Result
PGError = PG::Error

module CrjCom
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

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

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true


    # UPGRADE: rails from v4.2 to 5.x
    # ActiveSupport.halt_callback_chains_on_return_false = false
  end
end
