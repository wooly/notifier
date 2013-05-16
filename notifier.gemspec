# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'notifier/version'

Gem::Specification.new do |spec|
  spec.name          = "notifier"
  spec.version       = Notifier::VERSION
  spec.authors       = ["Steve Bell"]
  spec.email         = ["stephen.david.bell@me.com"]
  spec.description   = "Wrapper around HipChat gem"
  spec.summary       = "Wrapper around HipChat gem"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "hipchat"
end
