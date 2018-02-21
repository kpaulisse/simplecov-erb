# frozen_string_literal: true
require "rubygems"
require "bundler/setup"
require "fileutils"
require "open3"
require "rspec"

require "simplecov"
require "simplecov-erb"

# Get the base directory of this repository. It's one directory "up"
# from the directory with this file.
#
# Takes no arguments.
#
# Returns a String with the absolute path to the base directory.
def basedir
  File.expand_path("..", File.dirname(__FILE__))
end

# Get the directory where the coverage file is expected to be placed.
#
# Takes no arguments.
#
# Returns a String with the absolute path to the coverage directory.
def coveragedir
  File.join(basedir, "test", "coverage")
end

# Generate the fixture by running the simple tests in the fixture directory. The
# default SimpleCov coverage directory will be <repo>/test/coverage (which is
# conveniently .gitignore'd).
#
# env - optionally a Hash[String => String] with additional environment variables.
#
# Returns nothing.
def generate_fixture(env = {})
  rspec = File.join(basedir, "bin", "rspec")
  test_base = File.join(basedir, "test")

  FileUtils.remove_entry_secure(coveragedir) if File.directory?(coveragedir)

  command = "cd #{Shellwords.escape(basedir)} && #{Shellwords.escape(rspec)} #{Shellwords.escape(test_base)}"
  result, exitstatus = Open3.capture2e(env, command)

  unless exitstatus.exitstatus == 0
    STDERR.puts result if result
    raise "Error: Failed to execute fixture generator command #{command.inspect}"
  end

  unless File.directory?(coveragedir)
    STDERR.puts result if result
    raise "Error: Fixture generation did not build the expected coverage directory at #{coveragedir.inspect}"
  end

  nil
end
