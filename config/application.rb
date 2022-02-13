require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TweetBackEnd
  class Application < Rails::Application

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :put, :patch, :options, :head],
          :max_age => 0
      end
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # config.after_initialize do
    #   # TODO: initialize twitter stream and link to action cable 
    #   TwitterStream.stream_connect
    # end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

       # ▾ Must add these lines! ▾
    # Adding back cookies and session middleware
   # config.middleware.use ActionDispatch::Cookies
    #config.middleware.use ActionDispatch::Session::CookieStore

    # Use SameSite=Strict for all cookies to help protect against CSRF
    # config.action_dispatch.cookies_same_site_protection = :strict
  end
end
