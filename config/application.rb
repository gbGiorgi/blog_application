# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BlogDemo
  class Application < Rails::Application
    config.load_defaults 7.0
    config.action_mailer.default_url_options = { host: 'http://localhost:3000' }

    config.i18n.available_locales = %i[en ge]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = true
  end
end
