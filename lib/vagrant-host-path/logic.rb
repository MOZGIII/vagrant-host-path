module VagrantPlugins
  module HostPath
    module Logic
      def put_path_file(config, cwd)
        sudo("echo \"#{cwd.to_s}\" > \"#{config.path_file}\"")
      end

      def put_profile_file(config)
        sudo("echo \"#{escape_shell(profile_file(config))}\" > \"#{config.profile_path}\"")
      end

      def profile_file(config)
        "[ -f \"#{config.path_file}\" ] && export #{config.env_key}=\`cat \"#{config.path_file}\"\`"
      end

      def escape_shell(content)
        content.gsub(/["`\\]/, '\\\\\0')
      end
    end
  end
end
