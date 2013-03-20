# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "slyde/version"

Gem::Specification.new do |spec|
  spec.name          = "slyde"
  spec.version       = Slyde::VERSION
  spec.authors       = ["Brendan Loudermilk"]
  spec.email         = ["brendan@gophilosophie.com"]
  spec.description   = %q{Slides done right, in Ruby}
  spec.summary       = %q{Slyde is a presentation tool built in Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "liquid", "~> 2.4.1"
  spec.add_dependency "redcarpet", "~> 2.2.2"
  spec.add_dependency "sinatra", "~> 1.3.5"
  spec.add_dependency "nokogiri", "~> 1.5.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
