# Vagrant::Host::Path

This plugin creates an environment variable (`VAGRANT_HOST_PATH` by default) with the path to the project's root dir on your host machine.
You can just replace `/vagrant` prefix of any file in your VM with the value of `VAGRANT_HOST_PATH` and you'll get the path to that same file on the host.

## Installation

If you're using Vagrant with ruby's gem:

    $ gem install vagrant-host-path

Or if you installed it with an installer:

    $ vagrant gem install vagrant-host-path

## Usage

    $ vagrant up
    [default] VM already created. Booting if it's not already running...
    ...
    [default] Host Path set!
    ...
    $ vagrant ssh  # or any other way you connect to the VM

And after that you cat use the env var within your VM:

    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic-pae i686)

     * Documentation:  https://help.ubuntu.com/
    Welcome to your Vagrant-built virtual machine.
    Last login: Tue Feb 26 23:22:00 2013 from 10.0.2.2
    vagrant@precise32:~$ echo $VAGRANT_HOST_PATH
    C:/Users/MOZGIII/Desktop/vagrant-host-path/test

## Configuration

```ruby
Vagrant::Config.run do |config|
  
  # The environment key to set
  config.host-path.env_key = "VAGRANT_HOST_PATH"

  # Temp file to save path to
  config.host-path.path_file = "/tmp/.vagrant-host-path"

  # Profile script path
  config.host-path.profile_path = "/etc/profile.d/vagrant-host-path.sh"
end
```

Have in mind that both the files get overwritten on every VM start.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
