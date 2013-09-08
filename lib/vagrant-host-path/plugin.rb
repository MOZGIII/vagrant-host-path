begin
  require "vagrant"
rescue LoadError
  raise "This Vagrant plugin must be run within Vagrant."
end

# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
if Vagrant::VERSION < "1.2.0"
  raise "This Vagrant plugin is only compatible with Vagrant 1.2+"
end

module VagrantPlugins
  module HostPath
    class Plugin < Vagrant.plugin("2")
      name "HostPath"
      description <<-DESC
      This plugin adds path to /vagrant dir as it is on the host to
      the VM environment.
      DESC

      config(:host_path) do
        require_relative "config"
        Config
      end

      action_hook(:set_host_path_on_up, :machine_action_up) do |hook|
        require_relative "middleware"
        hook.append(Middleware)
      end

      action_hook(:set_host_path_on_reload, :machine_action_reload) do |hook|
        require_relative "middleware"
        hook.append(Middleware)
      end
    end
  end
end
