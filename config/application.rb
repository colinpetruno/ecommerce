require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ecommerce
  class Application < Rails::Application

    # add all locale directories
    config.i18n.load_path += Dir[
      Rails.
       root.
       join('config', 'locales', '**/*.{rb,yml}').
       to_s
    ]

    # let heroku serve assets
    config.serve_static_files = true

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
