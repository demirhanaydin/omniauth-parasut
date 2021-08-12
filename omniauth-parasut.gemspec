# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/parasut/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-parasut'
  spec.version       = OmniAuth::Parasut::VERSION
  spec.authors       = ['demirhanaydin']
  spec.email         = ['demirhanaydin@gmail.com']

  spec.summary       = 'Omniauth OAuth2 strategy for Parasut'
  spec.description   = 'Omniauth OAuth2 strategy for Parasut'
  spec.homepage      = 'https://github.com/demirhanaydin/omniauth-parasut'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.6.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
