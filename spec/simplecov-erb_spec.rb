# frozen_string_literal: true
require_relative "spec_helper"

require "fileutils"
require "shellwords"

describe SimpleCov::Formatter::ERBFormatter do
  let(:subject) { described_class.new }

  let(:file) { File.join(ENV["SIMPLECOV_ERB_TEMPDIR"], "coverage.txt") }

  describe "#format" do
    let(:answer) do
      <<-EOS
--------------------------------------------------------------------------------
Incomplete test coverage
--------------------------------------------------------------------------------

/test/lib/baz.rb: 60.0% (missed: 4,8)
/test/lib/foo.rb: 80.0% (missed: 8,16)
      EOS
    end

    it "creates the coverage.txt file in the expected location" do
      expect(File.file?(file)).to eq(true)
    end

    it "returns the correctly formatted message as per the default template" do
      actual = File.read(file)
      expect(actual).to eq(answer)
    end
  end
end
