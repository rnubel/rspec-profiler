# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/profiler/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-profiler"
  spec.version       = RSpec::Profiler::VERSION
  spec.authors       = ["Robert Nubel"]
  spec.email         = ["rnubel@enovafinancial.com"]
  spec.description   = %q{Rspec profiling}
  spec.summary       = %q{gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
