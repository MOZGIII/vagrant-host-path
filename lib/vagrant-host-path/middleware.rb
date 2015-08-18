require "vagrant-host-path/logic"

module VagrantPlugins
  module HostPath
    class Middleware
      include Logic

      def initialize(app, env)
        @app = app
      end

      def call(env)
        @machine = env[:machine]
        setup
        @app.call(env)
      end

      protected

      def sudo(command)
        @machine.communicate.sudo(command)
      end

      def config
        @machine.config.host_path
      end

      def setup
        return unless config.enabled
        put_path_file(config, @machine.env.cwd)
        put_profile_file(config)
        @machine.ui.success "Host Path set!"
      end
    end
  end
end
