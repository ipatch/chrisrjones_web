# frozen_string_literal: true

Rails.application.configure do
  # these settings take presedence over config/application.rb.
  # in dev mode every request is reloaded
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # inline source map support
  config.sass.inline_source_maps = true

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large number of complex assets.
  config.assets.debug = true

  # API, error respone in JSON format instead of HTML
  config.debug_exception_response_format = :api

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # General Settings
  config.app_domain = 'localhost'

  # TODO: ipatch, properly setup mail server for development environment
  # NOTE: ipatch, rails does not provide a builtin mail server BOOOO 👎

  # config/environments/development.rb

  # TODO: need to access the port var from the `./config/boot.rb`
  config.action_mailer.default_url_options = { host: "localhost:#{ENV.fetch('PORT', nil)}" }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'gmail.com',
    # user_name: 'your_gmail_username@gmail.com',
    # password: 'your_gmail_password',
    user_name: ENV.fetch('crjrails_gmail_un', nil),
    password: ENV.fetch('crjrails_gmail_pw', nil),
    authentication: 'plain',
    enable_starttls_auto: true
  }
  # config.action_mailer.default_url_options = { host: config.app_domain }
  # config.action_mailer.perform_deliveries = true
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #   address: 'smtp.chrisrjones.com',
  #   port: 587,
  #   domain: 'chrisrjones.com',
  #   user_name: ENV['MAIL_ADDRESS'],
  #   password: ENV['MAIL_PASSWORD'],
  #   authentication: 'plain',
  #   enable_starttls_auto: true,
  #   openssl_verify_mode: 'none'
end
