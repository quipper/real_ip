# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'real_ip/version'

Gem::Specification.new do |spec|
  spec.name          = "real_ip"
  spec.version       = RealIp::VERSION
  spec.authors       = ["Quipper, Ltd."]
  spec.email         = ["tomo@quipper.com"]

  spec.summary       = %q{Rack middleware to get client IP address on Heroku, extracted from our API service.}
  spec.description   = %q{Rack middleware to get client IP address on Heroku, extracted from our API service.}
  spec.homepage      = "https://github.com/quipper/real_ip"
  spec.license       = "All rights reserved"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 13.0"
end
