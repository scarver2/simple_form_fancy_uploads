if ENV['COV']
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "rspec/rails"
require "webrat"

Rails.backtrace_cleaner.remove_silencers!

ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)

Webrat.configure do |config|
  config.mode = :rails
end

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
I18n.enforce_available_locales = false

RSpec.configure do |config|
  require 'rspec/expectations'
  config.infer_spec_type_from_file_location!
  config.include RSpec::Matchers
  config.mock_with :rspec
end
