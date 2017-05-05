require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
# helps load variables faster
Dotenv::Railtie.load
# specify all required env variables
GOOGLE_CLIENT_ID = ENV['GOOGLE_CLIENT_ID']
GOOGLE_CLIENT_SECRET = ENV['GOOGLE_CLIENT_SECRET']
FACEBOOK_CLIENT_ID = ENV['FACEBOOK_CLIENT_ID']
FACEBOOK_CLIENT_SECRET = ENV['FACEBOOK_CLIENT_SECRET']
GOOGLEMAP_API_KEY = ENV['GOOGLEMAP_API_KEY']

module Manyatta
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    ActionMailer::Base.smtp_settings = {
      :address => "smtp.gmail.com",
      :port => 587,
      :domain => "mail.google.com",
      :user_name => "mymailerapp@gmail.com",
      :password => "weakPass",
      :authentication => "login",
      :enable_starttls_auto => true
    }
  end
end
