require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module AppointmentScheduler
  class Application < Rails::Application
    config.time_zone = 'Dhaka'
    config.active_record.default_timezone = :local
  end
end
