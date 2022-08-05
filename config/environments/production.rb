# frozen_string_literal: true

require 'active_support/core_ext/integer/time'
Rails.application.configure do
  config.action_mailer.delivery_method = :letter_opener_web
  config.action_mailer.default_url_options = { host: 'blog-khoni.herokuapp.com' }
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_options = { from: 'no-reply@example.com' }
  config.action_mailer.smtp_settings = {
    address: Rails.application.credentials[:address],
    port: Rails.application.credentials[:port],
    domain: 'blog-khoni.herokuapp.com',
    user_name: Rails.application.credentials[:user_name],
    password: Rails.application.credentials[:password],
    authentication: 'plain',
    enable_starttls_auto: true
  }

  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.compile = false

  config.active_storage.service = :local

  config.log_level = :info

  config.log_tags = [:request_id]

  config.action_mailer.perform_caching = false

  config.i18n.fallbacks = true

  config.active_support.report_deprecations = false

  config.log_formatter = ::Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new($stdout)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end
