# frozen_string_literal: true
require_relative "spec_helper"

describe Bar do
  it "allows retrieving a parameter" do
    subject = described_class.new("kittens")
    expect(subject.get_param).to eq("kittens")
  end
end
