Gem::Specification.new do |s|
  s.name        = "simplecov-erb"
  s.version     = '0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kevin Paulisse"]
  s.email       = ["kpaulisse@gmail.com"]
  s.homepage    = "https://github.com/kpaulisse/simplecov-erb"
  s.summary     = "Customizable text formatter for SimpleCov code coverage tool for ruby 1.9+"
  s.description = "Customizable text formatter for SimpleCov code coverage tool for ruby 1.9+"

  s.rubyforge_project = "simplecov-erb"
  s.files         = ['lib/simplecov-erb.rb']
  #s.test_files    = ['test/helper.rb', 'test/test_simplecov_json.rb']
  s.require_paths = ["lib"]

  s.add_dependency "simplecov"
end
