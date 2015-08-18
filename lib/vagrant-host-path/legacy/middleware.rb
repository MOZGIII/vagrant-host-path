require "vagrant-host-path/logic"

module VagrantPlugins
  module HostPath
    module Legacy
      class Middleware
        include Logic

        def initialize(app, env)
          @app = app
        end

        def call(env)
          @vm = env[:vm]
          setup
          @app.call(env)
        end

        protected

        def sudo(command)
          @vm.channel.sudo(command)
        end

        def config
          @vm.config.host_path
        end

        def setup
          return unless config.enabled
          put_path_file(config, @vm.env.cwd)
          put_profile_file(config)
          @vm.ui.success "Host Path set!"
        end
      end
    end
  end
end
