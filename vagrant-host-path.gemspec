# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-host-path/version'

Gem::Specification.new do |gem|
  gem.name          = "vagrant-host-path"
  gem.version       = Vagrant::HostPath::VERSION
  gem.authors       = ["MOZGIII"]
  gem.email         = ["mike-n@narod.ru"]
  gem.description   = %q{Vagrant plugin that stores the host path to your project in the environment variable in the VM.}
  gem.summary       = %q{The host path to your project in the environment variable in the VM for Vagrant.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
