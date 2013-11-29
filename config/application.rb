require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module BaconAsia
  class Application < Rails::Application
    %w(validators).each do |dir|
      Dir[config.root.join("lib/#{dir}/*.rb")].each { |f| require f }
    end
  end
end
