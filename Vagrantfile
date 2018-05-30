Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/xenial64'

  config.vm.define 'velox' do |velox|
    velox.vm.network 'private_network', ip: '192.168.109.100'
    velox.vm.hostname = 'velox.localhost'

    velox.vm.provider 'virtualbox' do |vb|
       vb.memory = 4096
       vb.cpus = 2
       vb.customize ['modifyvm', :id, '--cpuexecutioncap', '50']
    end
  end
end
