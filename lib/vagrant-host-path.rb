require "vagrant-host-path/version"
require "vagrant-host-path/config"
require "vagrant-host-path/middleware"

Vagrant.config_keys.register(:host_path) { Vagrant::HostPath::Config }
Vagrant.actions[:start].use Vagrant::HostPath::Middleware
