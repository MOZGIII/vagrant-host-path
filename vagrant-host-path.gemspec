# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-host-path/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-host-path"
  spec.version       = VagrantPlugins::HostPath::VERSION
  spec.authors       = ["MOZGIII"]
  spec.email         = ["mike-n@narod.ru"]
  spec.description   = %q{Vagrant plugin that stores the host path to your project in the environment variable in the VM.}
  spec.summary       = %q{The host path to your project in the environment variable in the VM for Vagrant.}
  spec.homepage      = "https://github.com/MOZGIII/vagrant-host-path"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
