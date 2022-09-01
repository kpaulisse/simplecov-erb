# frozen_string_literal: true
Gem::Specification.new do |s|
  s.name        = "simplecov-erb"
  s.version     = File.read(File.expand_path("./VERSION", File.dirname(__FILE__)))
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kevin Paulisse"]
  s.email       = ["kpaulisse@gmail.com"]
  s.homepage    = "https://github.com/kpaulisse/simplecov-erb"
  s.summary     = "Customizable text formatter for SimpleCov code coverage tool for ruby 1.9+"
  s.license     = "MIT"

  s.files         = ["lib/simplecov-erb.rb", "views/simplecov.erb"]
  s.require_paths = ["lib"]

  s.add_dependency "simplecov", "< 1.0"
end
