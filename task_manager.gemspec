# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'task_manager/version'

Gem::Specification.new do |spec|
  spec.name          = "task_manager"
  spec.version       = TaskManager::VERSION
  spec.authors       = ["Pavel Hronek"]
  spec.email         = ["hronek.pav@seznam.cz"]
  spec.summary       = "Simple task manager"
  spec.description   = "Console tool for managing tasks"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "yard"

  spec.add_runtime_dependency "sqlite3"
  spec.add_dependency "rainbow"
end
