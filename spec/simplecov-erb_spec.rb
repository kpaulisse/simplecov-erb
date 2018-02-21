# frozen_string_literal: true
require_relative "spec_helper"

require "fileutils"
require "shellwords"

describe SimpleCov::Formatter::ERBFormatter do
  let(:subject) { described_class.new }

  let(:default_answer) do
    <<-EOS
--------------------------------------------------------------------------------
Incomplete test coverage
--------------------------------------------------------------------------------

/test/lib/baz.rb: 60.0% (missed: 4,8)
/test/lib/foo.rb: 80.0% (missed: 8,16)
    EOS
  end

  context "with a default configuration" do
    before(:all) { generate_fixture }

    let(:file) { File.join(coveragedir, "coverage.txt") }

    describe "#format" do
      it "creates the coverage.txt file in the expected location" do
        expect(File.file?(file)).to eq(true)
      end

      it "returns the correctly formatted message as per the default template" do
        actual = File.read(file)
        expect(actual).to eq(default_answer)
      end
    end
  end

  context "with an alternate filename configuration" do
    before(:all) { generate_fixture("SIMPLECOV_ERB_FIXTURE_OUTPUT_FILENAME" => "foofoo.txt") }

    let(:file) { File.join(coveragedir, "foofoo.txt") }

    describe "#format" do
      it "creates the coverage file in the expected location" do
        expect(File.file?(file)).to eq(true)
      end

      it "does not create the default coverage file" do
        default_file = File.join(coveragedir, "coverage.txt")
        expect(File.file?(default_file)).to eq(false)
      end

      it "returns the correctly formatted message as per the default template" do
        actual = File.read(file)
        expect(actual).to eq(default_answer)
      end
    end
  end
end
