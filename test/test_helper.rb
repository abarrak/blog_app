ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"

Minitest::Reporters.use!(Minitest::Reporters::DefaultReporter.new, ENV, Minitest.backtrace_filter)

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
  include ApplicationHelper

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
end

class ActionController::TestCase
  include Devise::TestHelpers
end