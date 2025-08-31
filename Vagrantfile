Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-24.04"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  nodes = {
    1 => { name: "kafka-1", ip: "192.168.56.10" },
    2 => { name: "kafka-2", ip: "192.168.56.11" },
    3 => { name: "kafka-3", ip: "192.168.56.12" }
  }

  nodes.each do |id, meta|
    config.vm.define meta[:name] do |node|
      node.vm.hostname = meta[:name]

      node.vm.provider :libvirt do |lv|
        lv.cpus = 2
        lv.memory = 2048
      end

      node.vm.network :private_network,
        ip: meta[:ip],
        libvirt__network_name: "kafka-net"
    end
  end
end

