# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'railsbank_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'railsbank_api_client'
  spec.version       = RailsbankApiClient::VERSION
  spec.authors       = ['kolisnyklera']
  spec.email         = ['kolisnyklera@gmail.com']

  spec.summary       = 'FIX: Write a short summary, because RubyGems requires one.'
  spec.description   = 'FIX: Write a longer description or delete this line.'
  spec.homepage      = 'https://github.com/codexysoft/railsbank_api_client'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = "FIX: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/codexysoft/railsbank_api_client'
  spec.metadata['changelog_uri'] = 'https://github.com/codexysoft/railsbank_api_client'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'hashie'
  spec.add_dependency 'webmock'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
