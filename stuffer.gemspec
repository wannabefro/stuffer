# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stuffer/version'

Gem::Specification.new do |spec|
  spec.name          = "stuffer"
  spec.version       = Stuffer::VERSION
  spec.authors       = ["Matt Buckley", "Sam McTaggart"]
  spec.email         = ["matt.d.buckley1212@gmail.com", "sam.mctaggart@gmail.com"]
  spec.description   = %q{Stuff it up}
  spec.summary       = %q{The greatest gem of all time}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "factory_girl_rails"
  spec.add_development_dependency "launchy"
  spec.add_development_dependency 'pry'
end
