# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hscm/version'

Gem::Specification.new do |spec|
  spec.name          = "hscm"
  spec.version       = Hscm::VERSION
  spec.authors       = ["David L. Whitehurst"]
  spec.email         = ["dlwhitehurst@me.com"]
  spec.summary       = %q{Ruby gem for command-line SCM to multiple users and hosts}
  spec.description   = %q{This gem is a command-line ruby application with dependency on other ruby scripts and gems. The tool is used to capture software names and installed versions for various host servers.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
