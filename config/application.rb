require_relative "boot"

require "rails/all"
require "csv"


Bundler.require(*Rails.groups)

module Izvid
  class Application < Rails::Application
    config.load_defaults 8.0

    # Autoload lib
    config.autoload_lib(ignore: %w[assets tasks])

    # ✅ Load all locale files (including sl.yml)
    config.i18n.load_path += Dir[
      Rails.root.join("config", "locales", "**", "*.{rb,yml}")
    ]

    # ✅ Default language
    # config.i18n.default_locale = :sl
  end
end
