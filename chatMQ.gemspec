# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chatMQ/version'

Gem::Specification.new do |spec|
  spec.name          = "chatMQ"
  spec.version       = ChatMQ::VERSION
  spec.authors       = ["DilumN"]
  spec.email         = ["dilumnavanjana@gmail.com"]

  spec.summary       = %q{Secret chat client to send messages encrypted}
  spec.description   = %q{Chat via an encrypted pipeline with 0MQ messaging}
  spec.homepage      = "http://dilumn.github.io"
  spec.license       = "MIT"


  spec.files = %w(LICENSE.txt README.md chatMQ.gemspec) + Dir['bin/*'] + Dir['lib/**/*.rb']
  spec.executables   = Dir['bin/*'].map { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "ffi-rzmq", '~> 2.0'
  spec.add_development_dependency "celluloid", '~> 0.17'
end
