# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/params_key_converter/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-params_key_converter"
  spec.version       = "0.0.1"
  spec.authors       = ["sogo.ohta"]
  spec.email         = ["sogo.ohta@gmail.com"]
  spec.summary       = "Rails app's params converter between JS app and Rails"
  spec.description   = 'This is a rack middleware that convert params key between JavaScript app and Rails app.'
  spec.homepage      = "https://github.com/s5ot/rack-params_key_converter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "activesupport"
  spec.add_dependency "json"
end
