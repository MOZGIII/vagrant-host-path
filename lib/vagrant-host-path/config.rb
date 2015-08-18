module VagrantPlugins
  module HostPath
    class Config < Vagrant.plugin(2, :config)
      # Is plugin enabled or disabled.
      #
      # @return [Bool]
      attr_accessor :enabled

      # The name of environment variable to set.
      #
      # @return [String]
      attr_accessor :env_key

      # The path to the tmp file used to store the actual host path.
      #
      # @return [String]
      attr_accessor :path_file

      # The path to a profile file (typically inside of a /etc/profile.d/ dir).
      #
      # @return [String]
      attr_accessor :profile_path

      # The path to the tmp file used to upload profile path.
      #
      # @return [String]
      attr_accessor :temp_upload_path

      def initialize
        @enabled      = UNSET_VALUE
        @env_key      = UNSET_VALUE
        @path_file    = UNSET_VALUE
        @profile_path = UNSET_VALUE
        @temp_upload_path = UNSET_VALUE
      end

      def finalize!
        @enabled      = true if @enabled == UNSET_VALUE
        @env_key      = "VAGRANT_HOST_PATH" if @env_key == UNSET_VALUE
        @path_file    = "/tmp/.vagrant-host-path" if @path_file == UNSET_VALUE
        @profile_path = "/etc/profile.d/vagrant-host-path.sh" if @profile_path == UNSET_VALUE
        @temp_upload_path = "/tmp/vagrant-host-path-profile.sh" if @temp_upload_path == UNSET_VALUE
      end
    end
  end
end
