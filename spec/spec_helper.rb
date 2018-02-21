# frozen_string_literal: true
require "rubygems"
require "bundler/setup"
require "open3"
require "simplecov"
require "simplecov-erb"

require "rspec"

RSpec.configure do |config|
  config.add_setting :tempdir

  config.before(:suite) do
    config.tempdir = Dir.mktmpdir("simplecov-erb-")
    ENV["SIMPLECOV_ERB_TEMPDIR"] = config.tempdir

    basedir = File.expand_path("..", File.dirname(__FILE__))
    rspec = File.join(basedir, "bin", "rspec")
    fixture = File.join(basedir, "test")

    command = "cd #{Shellwords.escape(basedir)} && #{Shellwords.escape(rspec)} #{Shellwords.escape(fixture)}"
    result, exitstatus = Open3.capture2e(command)
    unless exitstatus.exitstatus == 0
      STDERR.puts result
      raise "Error: Failed to execute fixture generator command #{command.inspect}"
    end
  end

  config.after(:suite) do
    if config.tempdir && File.directory?(config.tempdir)
      FileUtils.remove_entry_secure(config.tempdir)
    else
      warn "Could not clean up tempdir"
    end
  end
end
