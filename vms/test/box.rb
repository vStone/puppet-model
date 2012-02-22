Vagrant::Config.run do |config|
  config.vm.define :test do |test_config|
    test_config.vm.host_name = "test"
    test_config.vm.provision :puppet,
        :options => [] do |test_puppet|
      test_puppet.pp_path = "/tmp/vagrant"
      test_puppet.manifests_path = "manifests"
      test_puppet.module_path = "modules"
      test_puppet.manifest_file = "site.pp"
    end
  end
end
