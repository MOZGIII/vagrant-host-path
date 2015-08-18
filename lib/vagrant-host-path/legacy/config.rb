module VagrantPlugins
  module HostPath
    module Legacy
      class Config < Vagrant::Config::Base
        attr_writer :enabled
        attr_writer :env_key
        attr_writer :path_file
        attr_writer :profile_path
        attr_writer :temp_upload_path

        # FIXME: Defaults duplication here!

        def enabled
          return true if @enabled.nil?
          @enabled
        end

        def env_key
          @env_key || "VAGRANT_HOST_PATH"
        end

        def path_file
          @path_file || "/tmp/.vagrant-host-path"
        end

        def profile_path
          @profile_path || "/etc/profile.d/vagrant-host-path.sh"
        end
        
        def temp_upload_path
          @temp_upload_path || "/tmp/vagrant-host-path-profile.sh"
        end
      end
    end
  end
end
