# frozen_string_literal: true
require "rubygems"
require "bundler/setup"
require "simplecov"
require "simplecov-erb"

require "rspec"

SimpleCov.start do
  add_filter "/spec"
  formatter SimpleCov::Formatter::ERBFormatter
  if ENV["SIMPLECOV_ERB_TEMPDIR"]
    coverage_dir ENV["SIMPLECOV_ERB_TEMPDIR"]
  else
    coverage_dir File.expand_path("../coverage", File.dirname(__FILE__))
  end
end

require_relative "../lib/bar"
require_relative "../lib/baz"
require_relative "../lib/foo"
