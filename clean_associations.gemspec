# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clean_associations/version'

Gem::Specification.new do |spec|
  spec.name          = "clean_associations"
  spec.version       = CleanAssociations::VERSION
  spec.authors       = ["Manish Puri"]
  spec.email         = ["manishspuri@gmail.com"]
  spec.summary       = %q{A simple cleaner script for your activerecord models.}
  spec.description   = %q{A simple cleaner script for your activerecord models.}
  spec.homepage      = "https://github.com/Manik-Ratnas/clean_associations"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_dependency 'activerecord'
end
