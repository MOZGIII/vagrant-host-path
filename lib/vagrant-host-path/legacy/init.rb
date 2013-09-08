require "vagrant-host-path/legacy/config"
require "vagrant-host-path/legacy/middleware"

Vagrant.config_keys.register(:host_path) do
  VagrantPlugins::HostPath::Legacy::Config
end

Vagrant.actions[:start].use VagrantPlugins::HostPath::Legacy::Middleware
