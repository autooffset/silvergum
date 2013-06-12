# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |file| require file }

ActiveRecord::Migration.check_pending!

require 'active_record_spec_helper'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.order = 'random'

  config.include RSpec::Rails::RequestExampleGroup, :type => :request,
    :example_group => {:file_path => /spec\/acceptance/}
  config.include Capybara::DSL, :type => :request,
    :example_group => {:file_path => /spec\/acceptance/}

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end
