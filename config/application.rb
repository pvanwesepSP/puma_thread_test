require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PumaThreadTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.mario_service = Class.new do
      def initialize
        puts "Initialized!"
        super
      end

      def run(first_name:, last_name:)
        @first_name = first_name
        @last_name = last_name

        User.create(first_name: @first_name, last_name: "Mario")
        User.create(first_name: "Mario", last_name: @last_name)
      end
    end.new

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
