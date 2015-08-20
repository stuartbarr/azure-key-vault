# -*- mode: ruby; -*-
$LOAD_PATH.unshift 'lib'
require "azure-key-vault/version"

Gem::Specification.new do |s|
  s.name      = "azure-key-vault"
  s.version   = Azure::KeyVault::VERSION.split(/[-+]/,2).first
  s.date      = Time.now.strftime('%Y-%m-%d')
  s.summary   = "Ruby Client for Azure Key Vault"
  s.homepage  = "http://github.com/stuartbarr/azure-key-vault"
  s.email     = "stuartbarr@outlook.com"
  s.authors   = [ "Stuart Barr" ]
  s.has_rdoc  = false

  s.files = %x[git ls-files].split($/) - %w[.gitignore]
  s.require_paths = %w[lib]

  s.add_runtime_dependency 'json'
  s.add_runtime_dependency 'rest-client'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
