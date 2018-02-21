# frozen_string_literal: true
require "rubygems"
require "bundler/setup"
require "simplecov"
require "simplecov-erb"

require "rspec"

SimpleCov.start do
  add_filter "/spec"
  formatter SimpleCov::Formatter::ERBFormatter
  coverage_dir File.expand_path("../coverage", File.dirname(__FILE__))

  # For testing possible parameters from the gem's test suite or command line.
  if ENV["SIMPLECOV_ERB_FIXTURE_ERB_FILE"]
    SimpleCov::Formatter::ERBFormatter.erb_file = ENV["SIMPLECOV_ERB_FIXTURE_ERB_FILE"]
  end

  if ENV["SIMPLECOV_ERB_FIXTURE_OUTPUT_FILENAME"]
    SimpleCov::Formatter::ERBFormatter.output_filename = ENV["SIMPLECOV_ERB_FIXTURE_OUTPUT_FILENAME"]
  end
end

require_relative "../lib/bar"
require_relative "../lib/baz"
require_relative "../lib/foo"
