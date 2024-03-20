# frozen_string_literal: true

if ENV['MEASURE_TEST_COVERAGE'] == 'true'
  require 'simplecov'
  SimpleCov.command_name 'test:cypress'
end

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
