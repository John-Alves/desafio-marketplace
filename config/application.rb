require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
require 'carrierwave/mongoid'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

ENV['RAILS_ADMIN_THEME'] ||= 'rollincode'

module MarketplaceChallenge
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.generators.system_tests = nil

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'application.yml')
      if File.exists?(env_file)
        YAML.load(File.open(env_file)).each do |key, value|
          ENV[key.to_s] ||= value
        end
      end
    end
  end
end
