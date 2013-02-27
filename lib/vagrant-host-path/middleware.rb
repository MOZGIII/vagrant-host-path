module Vagrant
  module HostPath
    class Middleware
      def initialize(app, env)
        @app = app
      end

      def call(env)
        setup env[:vm] if env[:vm].state == :running
        @app.call(env)
      end

      protected

      def setup(vm)
        put_path_file(vm)
        put_profile_file(vm)
        vm.ui.success "Host Path set!"
      end

      def put_path_file(vm)
        vm.channel.sudo("echo \"#{vm.env.cwd.to_s}\" > \"#{vm.config.host_path.path_file}\"")
      end

      def put_profile_file(vm)
        content = profile_file(vm.config.host_path)
        vm.channel.sudo("echo \"#{content.gsub(/["`\\]/, '\\\\\0')}\" > \"#{vm.config.host_path.profile_path}\"")
      end

      def profile_file(config)
        "[ -f \"#{config.path_file}\" ] && export #{config.env_key}=\`cat \"#{config.path_file}\"\`"
      end
    end
  end
end
